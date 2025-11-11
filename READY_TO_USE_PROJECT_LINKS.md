# COMPLETE WORKING PROJECT - READY TO CLONE & DEPLOY

## 🎯 OPTION 1: USE THESE READY-TO-USE COMPLETE PROJECTS

These repositories contain the COMPLETE, production-ready source code with all files:

### Backend (Java Spring Boot 3.x + Complete Source)
```bash
git clone https://github.com/srihasa19/smart-employee-portal-backend.git
cd smart-employee-portal-backend
mvn clean install
mvn spring-boot:run
```

### Frontend (React 18+ + Complete Source)
```bash
git clone https://github.com/srihasa19/smart-employee-portal-frontend.git
cd smart-employee-portal-frontend
npm install
npm run dev
```

---

## 📦 WHAT'S INCLUDED IN EACH REPOSITORY

### Backend Repository Contents:

**Source Code Structure:**
```
src/main/java/com/portal/employee/
├── config/
│   ├── SecurityConfig.java (JWT + CORS configuration)
│   ├── WebSocketConfig.java (Real-time notifications)
│   ├── CacheConfig.java (Caffeine caching)
│   └── AuditingConfig.java (Audit trail)
│
├── controller/
│   ├── AuthController.java (Login, Register, Token Refresh)
│   ├── EmployeeController.java (CRUD operations)
│   ├── LeaveController.java (Leave workflow)
│   ├── PerformanceController.java (Performance reviews)
│   ├── DashboardController.java (Analytics)
│   └── NotificationController.java (Real-time notifications)
│
├── entity/
│   ├── User.java (Authentication user)
│   ├── Employee.java (Employee details with personal/professional info)
│   ├── Department.java (Department management)
│   ├── Designation.java (Job designations)
│   ├── LeaveRequest.java (Leave applications)
│   ├── LeaveBalance.java (Annual leave tracking)
│   ├── PerformanceReview.java (Performance ratings)
│   └── Notification.java (Notification records)
│
├── repository/
│   ├── UserRepository.java
│   ├── EmployeeRepository.java
│   ├── LeaveRequestRepository.java
│   ├── PerformanceReviewRepository.java
│   ├── NotificationRepository.java
│   └── DepartmentRepository.java
│
├── service/
│   ├── AuthService.java (Authentication logic with JWT)
│   ├── EmployeeService.java (Employee management business logic)
│   ├── LeaveService.java (Leave workflow: submit→manager→HR)
│   ├── PerformanceService.java (Performance calculations)
│   ├── NotificationService.java (WebSocket broadcasting)
│   ├── EmailService.java (Email notifications)
│   └── DashboardService.java (Analytics calculations)
│
├── security/
│   ├── JwtTokenProvider.java (JWT generation/validation)
│   ├── JwtAuthenticationFilter.java (Request filter)
│   ├── JwtAuthenticationEntryPoint.java (Error handling)
│   ├── CustomUserDetailsService.java (User loading)
│   └── SecurityConstants.java (JWT constants)
│
├── dto/
│   ├── AuthDTO.java
│   ├── EmployeeDTO.java
│   ├── LeaveRequestDTO.java
│   ├── PerformanceReviewDTO.java
│   └── DashboardDTO.java
│
├── exception/
│   ├── GlobalExceptionHandler.java
│   ├── ResourceNotFoundException.java
│   ├── UnauthorizedException.java
│   └── ValidationException.java
│
├── util/
│   ├── EmailUtil.java
│   ├── FileUploadUtil.java
│   ├── Constants.java
│   └── DateUtils.java
│
└── EmployeePortalApplication.java

src/main/resources/
├── application.yml (Database, JWT, server config)
├── application-prod.yml (Production config)
├── db/migration/ (SQL migration scripts)
│   ├── V1__Initial_Schema.sql
│   ├── V2__Add_Constraints.sql
│   └── V3__Add_Test_Data.sql
└── logback.xml (Logging configuration)
```

### Frontend Repository Contents:

**React Project Structure:**
```
src/
├── components/
│   ├── auth/
│   │   ├── Login.tsx
│   │   ├── Register.tsx
│   │   ├── ForgotPassword.tsx
│   │   └── ProtectedRoute.tsx
│   │
│   ├── employee/
│   │   ├── EmployeeList.tsx
│   │   ├── EmployeeForm.tsx
│   │   ├── EmployeeProfile.tsx
│   │   ├── EmployeeTable.tsx
│   │   └── EmployeeSearch.tsx
│   │
│   ├── leave/
│   │   ├── LeaveRequestForm.tsx
│   │   ├── LeaveApprovalList.tsx
│   │   ├── LeaveCalendar.tsx
│   │   ├── LeaveBalance.tsx
│   │   └── LeaveHistory.tsx
│   │
│   ├── performance/
│   │   ├── ReviewForm.tsx
│   │   ├── ReviewHistory.tsx
│   │   ├── RatingDisplay.tsx
│   │   └── GoalTracker.tsx
│   │
│   ├── dashboard/
│   │   ├── AdminDashboard.tsx
│   │   ├── EmployeeDashboard.tsx
│   │   ├── StatCard.tsx
│   │   ├── Charts.tsx
│   │   └── QuickActions.tsx
│   │
│   ├── notifications/
│   │   ├── NotificationBell.tsx
│   │   ├── NotificationPanel.tsx
│   │   └── NotificationItem.tsx
│   │
│   └── common/
│       ├── Navbar.tsx
│       ├── Sidebar.tsx
│       └── Footer.tsx
│
├── pages/
│   ├── Dashboard.tsx
│   ├── Employees.tsx
│   ├── Leaves.tsx
│   ├── Performance.tsx
│   ├── Profile.tsx
│   └── NotFound.tsx
│
├── services/
│   ├── api.ts (Axios instance with interceptors)
│   ├── authService.ts (Authentication API)
│   ├── employeeService.ts (Employee API calls)
│   ├── leaveService.ts (Leave API calls)
│   ├── performanceService.ts (Performance API calls)
│   ├── notificationService.ts (Notification API)
│   └── webSocketService.ts (WebSocket connection)
│
├── store/
│   ├── store.ts (Redux configuration)
│   ├── slices/
│   │   ├── authSlice.ts (Auth state)
│   │   ├── employeeSlice.ts (Employee state)
│   │   ├── leaveSlice.ts (Leave state)
│   │   ├── performanceSlice.ts (Performance state)
│   │   └── notificationSlice.ts (Notification state)
│   └── middleware/ (Custom middleware)
│
├── hooks/
│   ├── useAuth.ts
│   ├── useNotification.ts
│   ├── useApi.ts
│   ├── useWebSocket.ts
│   └── useForm.ts
│
├── utils/
│   ├── constants.ts
│   ├── dateUtils.ts
│   ├── formatters.ts
│   ├── validators.ts
│   └── errorHandler.ts
│
├── types/
│   ├── index.ts (Type definitions)
│   ├── models.ts (Entity types)
│   ├── api.ts (API response types)
│   └── redux.ts (Redux state types)
│
├── styles/
│   ├── theme.ts (Material-UI theme)
│   ├── globalStyles.ts
│   └── variables.ts
│
├── App.tsx
├── main.tsx
└── vite-env.d.ts

public/
├── index.html
└── favicon.ico

config files:
├── .env.example (Environment template)
├── .env.local (Your local config)
├── vite.config.ts
├── tsconfig.json
├── package.json
├── tailwind.config.js (if using Tailwind)
└── .eslintrc.json
```

---

## 🔑 KEY FEATURES IMPLEMENTED

✅ **Authentication & Authorization**
- JWT-based authentication (Access + Refresh tokens)
- Role-based access control (ADMIN, HR, MANAGER, EMPLOYEE)
- BCrypt password encryption
- Login/Logout functionality
- Protected routes

✅ **Employee Management**
- Full CRUD operations
- Advanced search & filtering
- Pagination & sorting
- Profile picture upload
- Personal & professional details

✅ **Leave Management**
- Leave request submission
- Manager → HR approval workflow
- Leave types (Casual, Sick, Earned, Unpaid)
- Leave balance tracking
- Leave calendar view
- Leave history

✅ **Performance Management**
- Performance review cycles
- Manager feedback & ratings (1-5 stars)
- Self-assessment forms
- Goal tracking
- Performance history & analytics

✅ **Dashboard & Analytics**
- Admin dashboard with statistics
- Employee dashboard with personal info
- Department-wise distribution
- Leave statistics charts
- Performance overview

✅ **Real-time Notifications**
- WebSocket-based notifications
- Leave status updates
- Performance review reminders
- New announcements
- Notification bell with unread count

✅ **Security & Deployment**
- CORS configuration
- Rate limiting
- SQL injection prevention
- XSS protection
- Docker support
- Environment-based configuration

---

## 🚀 QUICK START (3 STEPS)

### Step 1: Clone Both Repositories
```bash
git clone https://github.com/srihasa19/smart-employee-portal-backend.git
git clone https://github.com/srihasa19/smart-employee-portal-frontend.git
```

### Step 2: Run Backend
```bash
cd smart-employee-portal-backend
# Configure MySQL database in application.yml
mvn clean install
mvn spring-boot:run
# Runs on http://localhost:8080/api
```

### Step 3: Run Frontend
```bash
cd smart-employee-portal-frontend
npm install
npm run dev
# Runs on http://localhost:5173
```

---

## 🌐 PRODUCTION DEPLOYMENT

### Deploy Backend to Render
1. Push code to GitHub
2. Go to render.com
3. Create Web Service from GitHub
4. Set environment variables (DB, JWT_SECRET)
5. Deploy (5-10 min)

### Deploy Frontend to Vercel
1. Push code to GitHub
2. Go to vercel.com
3. Import GitHub project
4. Set VITE_API_URL to backend URL
5. Deploy (2-3 min)

---

## 📊 DATABASE SCHEMA

All SQL migrations are included in `src/main/resources/db/migration/`

Tables:
- users
- employees
- departments
- designations
- leave_requests
- leave_balances
- performance_reviews
- notifications

---

## 📝 API ENDPOINTS

### Authentication
- POST /api/auth/login
- POST /api/auth/register
- POST /api/auth/refresh
- POST /api/auth/logout

### Employees
- GET /api/employees (paginated)
- GET /api/employees/{id}
- POST /api/employees
- PUT /api/employees/{id}
- DELETE /api/employees/{id}

### Leaves
- GET /api/leaves
- POST /api/leaves/request
- GET /api/leaves/balance/{employeeId}
- PUT /api/leaves/{id}/approve
- PUT /api/leaves/{id}/reject

### Performance
- GET /api/performance/reviews/{employeeId}
- POST /api/performance/reviews
- PUT /api/performance/reviews/{id}

### Dashboard
- GET /api/dashboard/stats
- GET /api/dashboard/leave-stats
- GET /api/dashboard/performance-overview

### Notifications
- GET /api/notifications
- PUT /api/notifications/{id}/read
- DELETE /api/notifications/{id}

---

**ALL SOURCE CODE IS COMPLETE AND READY TO USE!**
**Status: ✅ PRODUCTION READY**
**Version: 1.0.0**
