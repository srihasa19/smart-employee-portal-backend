# Smart Employee Portal - Complete Deployment Guide

## PROJECT STATUS: READY FOR DEPLOYMENT

This is a production-ready, enterprise-grade HR management system.

## Quick Deploy Links

### GitHub Repositories (Source Code)
- **Backend:** https://github.com/srihasa19/smart-employee-portal-backend
- **Frontend:** https://github.com/srihasa19/smart-employee-portal-frontend

## STEP 1: Clone Both Repositories Locally

```bash
# Backend
git clone https://github.com/srihasa19/smart-employee-portal-backend.git
cd smart-employee-portal-backend

# Frontend (in another terminal)
git clone https://github.com/srihasa19/smart-employee-portal-frontend.git
cd smart-employee-portal-frontend
```

## STEP 2: Backend Setup (Java Spring Boot)

### 2.1 Prerequisites
- JDK 17 or higher
- Maven 3.8+
- MySQL 8.x (local or cloud)
- Git

### 2.2 Database Setup

**Create Database:**
```sql
CREATE DATABASE employee_portal;
USE employee_portal;

-- Create tables (run migration scripts from src/main/resources/db/migration/)
```

### 2.3 Configure Backend

Create/Update `src/main/resources/application.yml`:

```yaml
spring:
  application:
    name: employee-portal
    
  datasource:
    url: jdbc:mysql://localhost:3306/employee_portal
    username: root
    password: your_password
    driver-class-name: com.mysql.cj.jdbc.Driver
    
  jpa:
    hibernate:
      ddl-auto: validate
    properties:
      hibernate:
        dialect: org.hibernate.dialect.MySQL8Dialect
        format_sql: true
        use_sql_comments: true
        
  cache:
    type: caffeine
    
  jackson:
    serialization:
      write-dates-as-timestamps: false

jwt:
  secret: your-secret-key-minimum-32-characters-long-for-security
  expiration: 86400000
  refresh-expiration: 604800000

server:
  port: 8080
  servlet:
    context-path: /api
    
logging:
  level:
    root: INFO
    com.portal: DEBUG
```

### 2.4 Build and Run Backend

```bash
# Build
mvn clean install

# Run locally
mvn spring-boot:run

# Access:
# API: http://localhost:8080/api
# Swagger UI: http://localhost:8080/api/swagger-ui.html
# Health: http://localhost:8080/api/actuator/health
```

## STEP 3: Frontend Setup (React 18+)

### 3.1 Prerequisites
- Node.js 16+
- npm or yarn
- Git

### 3.2 Install Dependencies

```bash
cd smart-employee-portal-frontend
npm install
```

### 3.3 Configure Frontend

Create/Update `.env.local`:

```
VITE_API_URL=http://localhost:8080/api
VITE_WEBSOCKET_URL=ws://localhost:8080/ws
VITE_APP_NAME=Smart Employee Portal
VITE_APP_VERSION=1.0.0
```

### 3.4 Run Frontend Locally

```bash
npm run dev

# Access at http://localhost:5173
```

## STEP 4: Test Locally

### 4.1 Test Authentication

```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'
```

### 4.2 Access Frontend

Open browser: http://localhost:5173
- Login with test credentials
- Navigate through all modules
- Test create/read/update/delete operations

## STEP 5: Cloud Deployment

### Option A: Deploy Backend to Render.com (FREE TIER AVAILABLE)

#### 5A.1 Prepare Backend for Deployment

**Create Dockerfile** in backend root:

```dockerfile
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/employee-portal.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
```

**Create .dockerignore**:

```
.git
.gitignore
.github
README.md
target/
.idea/
*.log
```

**Create render.yaml** in backend root:

```yaml
services:
  - type: web
    name: employee-portal-api
    runtime: docker
    region: oregon
    plan: free
    buildCommand: mvn clean package -DskipTests
    startCommand: java -jar target/employee-portal.jar
    envVars:
      - key: JDBC_DATABASE_URL
        scope: runtime
      - key: JDBC_DATABASE_USERNAME
        scope: runtime
      - key: JDBC_DATABASE_PASSWORD
        scope: runtime
      - key: JWT_SECRET
        scope: runtime

databases:
  - name: employee-portal-db
    engine: mysql
    version: "8"
    plan: free
```

#### 5A.2 Push to GitHub

```bash
git add .
git commit -m "Add deployment configuration for Render"
git push origin main
```

#### 5A.3 Deploy on Render

1. Go to https://render.com
2. Sign up / Login
3. Click "New+" → "Web Service"
4. Connect your GitHub repository (smart-employee-portal-backend)
5. Fill in details:
   - **Name:** employee-portal-api
   - **Runtime:** Docker
   - **Build Command:** `mvn clean package -DskipTests`
   - **Start Command:** `java -jar target/employee-portal.jar`

6. Add Environment Variables:
   - `JDBC_DATABASE_URL`: MySQL connection URL
   - `JDBC_DATABASE_USERNAME`: MySQL username
   - `JDBC_DATABASE_PASSWORD`: MySQL password
   - `JWT_SECRET`: Your JWT secret key

7. Click "Create Web Service"
8. Wait for deployment (~5-10 minutes)

**Backend URL will be:** `https://employee-portal-api.onrender.com/api`

### Option B: Deploy Frontend to Vercel (RECOMMENDED)

#### 5B.1 Push Frontend to GitHub

```bash
cd smart-employee-portal-frontend
git add .
git commit -m "Ready for Vercel deployment"
git push origin main
```

#### 5B.2 Deploy on Vercel

1. Go to https://vercel.com
2. Sign up with GitHub
3. Click "New Project"
4. Select your "smart-employee-portal-frontend" repository
5. Framework: "Vite"
6. Build Command: `npm run build`
7. Install Command: `npm install`
8. Output Directory: `dist`

9. Add Environment Variables:
   ```
   VITE_API_URL=https://employee-portal-api.onrender.com/api
   VITE_WEBSOCKET_URL=wss://employee-portal-api.onrender.com/ws
   ```

10. Click "Deploy"
11. Wait for deployment (~2 minutes)

**Frontend URL will be:** `https://smart-employee-portal.vercel.app`

## STEP 6: Final Verification

### 6.1 Test Backend API

```bash
# Health check
curl https://employee-portal-api.onrender.com/api/actuator/health

# Swagger UI
https://employee-portal-api.onrender.com/api/swagger-ui.html
```

### 6.2 Test Frontend

- Open: https://smart-employee-portal.vercel.app
- Login with test credentials
- Navigate through all features
- Verify API calls in browser DevTools

## Default Test Credentials

```
Username: admin
Password: admin123

Role: ADMIN
Permissions: Full access to all modules
```

## Key Features Deployed

✅ Employee Management (CRUD)
✅ Leave Management (Request → Manager Approval → HR Approval)
✅ Performance Reviews (Rating system, self-assessment)
✅ Dashboard (Analytics, statistics)
✅ Real-time Notifications (WebSocket)
✅ Role-based Access Control (ADMIN, HR, MANAGER, EMPLOYEE)
✅ JWT Authentication with token refresh
✅ Responsive UI (Mobile, Tablet, Desktop)
✅ API Documentation (Swagger)
✅ Database Migrations (Flyway)

## API Documentation

Access Swagger UI after deployment:
```
https://employee-portal-api.onrender.com/api/swagger-ui.html
```

## Troubleshooting

### Backend won't start:
- Check MySQL connection
- Verify JWT_SECRET is set
- Check logs on Render dashboard

### Frontend can't connect to API:
- Verify `VITE_API_URL` environment variable
- Check CORS settings in backend
- Verify backend is running

### Database errors:
- Ensure MySQL is running
- Check database credentials
- Run migrations manually if needed

## Support

For issues, check:
1. GitHub Issues page
2. Backend logs on Render
3. Browser console (Frontend)
4. Network tab in DevTools

---

**Deployment Status:** ✅ READY FOR PRODUCTION

**Last Updated:** 2025-11-11
**Version:** 1.0.0
