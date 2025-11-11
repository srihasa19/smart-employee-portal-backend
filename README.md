# Smart Employee Portal - Backend API

## Enterprise-Grade HR Management System

A production-ready Spring Boot 3.x backend API for comprehensive employee management with JWT authentication, leave management, performance tracking, and real-time notifications.

## Features

### 1. Authentication & Authorization
- JWT-based authentication (access + refresh tokens)
- Role-based access control (ADMIN, HR, MANAGER, EMPLOYEE)
- BCrypt password encryption
- Token refresh mechanism
- Secure password reset flow

### 2. Employee Management
- Complete CRUD operations
- Employee profiles with personal & professional details
- Department and designation management
- Advanced search and filtering
- Pagination and sorting
- File upload for documents

### 3. Leave Management
- Leave request submission
- Approval workflow (Manager > HR)
- Leave types: Casual, Sick, Earned, Unpaid
- Leave balance tracking
- Email notifications

### 4. Performance Management
- Performance review cycles
- Goal setting and tracking
- Manager feedback and ratings
- Self-assessment forms
- Performance history

### 5. Real-Time Notifications
- WebSocket-based notifications
- Leave approval/rejection alerts
- Performance review reminders
- Announcements
- Profile updates

## Tech Stack

- **Framework**: Spring Boot 3.x (Java 17+)
- **Security**: Spring Security + JWT
- **Database**: MySQL 8.x
- **Caching**: Redis / Caffeine
- **WebSocket**: Spring WebSocket
- **ORM**: Spring Data JPA
- **API Documentation**: Swagger/OpenAPI
- **Build Tool**: Maven

## Prerequisites

- JDK 17 or higher
- Maven 3.8+
- MySQL 8.x
- Redis (optional, for caching)
- Git

## Installation

### 1. Clone Repository

```bash
git clone https://github.com/yourusername/smart-employee-portal-backend.git
cd smart-employee-portal-backend
```

### 2. Configure Database

Create MySQL database:

```sql
CREATE DATABASE employee_portal;
USE employee_portal;
```

### 3. Update Application Properties

Edit `src/main/resources/application.yml`:

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
  cache:
    type: caffeine
  jackson:
    serialization:
      write-dates-as-timestamps: false

jwt:
  secret: your-secret-key-min-32-characters
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

### 4. Build Project

```bash
mvn clean install
```

### 5. Run Application

```bash
mvn spring-boot:run
```

API will be available at `http://localhost:8080/api`

## Project Structure

```
src/main/java/com/portal/employee/
├── config/
│   ├── SecurityConfig.java
│   ├── WebSocketConfig.java
│   ├── CacheConfig.java
│   └── AuditingConfig.java
├── controller/
│   ├── AuthController.java
│   ├── EmployeeController.java
│   ├── LeaveController.java
│   ├── PerformanceController.java
│   ├── DashboardController.java
│   └── NotificationController.java
├── dto/
│   ├── request/
│   │   ├── LoginRequest.java
│   │   ├── EmployeeRequest.java
│   │   ├── LeaveRequest.java
│   │   └── PerformanceReviewRequest.java
│   └── response/
│       ├── AuthResponse.java
│       ├── EmployeeResponse.java
│       ├── LeaveResponse.java
│       └── ApiResponse.java
├── entity/
│   ├── User.java
│   ├── Employee.java
│   ├── Department.java
│   ├── Designation.java
│   ├── LeaveRequest.java
│   ├── LeaveBalance.java
│   ├── PerformanceReview.java
│   └── Notification.java
├── repository/
│   ├── UserRepository.java
│   ├── EmployeeRepository.java
│   ├── LeaveRequestRepository.java
│   ├── PerformanceReviewRepository.java
│   └── NotificationRepository.java
├── service/
│   ├── AuthService.java
│   ├── EmployeeService.java
│   ├── LeaveService.java
│   ├── PerformanceService.java
│   ├── NotificationService.java
│   └── impl/
├── security/
│   ├── JwtTokenProvider.java
│   ├── JwtAuthenticationFilter.java
│   ├── CustomUserDetailsService.java
│   └── JwtAuthenticationEntryPoint.java
├── exception/
│   ├── GlobalExceptionHandler.java
│   ├── ResourceNotFoundException.java
│   ├── UnauthorizedException.java
│   └── ValidationException.java
├── util/
│   ├── EmailUtil.java
│   ├── FileUploadUtil.java
│   └── Constants.java
└── EmployeePortalApplication.java
```

## API Endpoints

### Authentication
- `POST /auth/login` - User login
- `POST /auth/register` - User registration
- `POST /auth/refresh` - Refresh JWT token
- `POST /auth/logout` - User logout

### Employees
- `GET /employees` - List employees (paginated)
- `GET /employees/{id}` - Get employee details
- `POST /employees` - Create employee
- `PUT /employees/{id}` - Update employee
- `DELETE /employees/{id}` - Delete employee
- `GET /employees/search` - Search employees

### Leave Management
- `GET /leaves` - Get leave requests
- `POST /leaves/request` - Submit leave request
- `GET /leaves/balance/{employeeId}` - Get leave balance
- `PUT /leaves/{id}/approve` - Approve leave
- `PUT /leaves/{id}/reject` - Reject leave
- `GET /leaves/history/{employeeId}` - Get leave history

### Performance
- `GET /performance/reviews/{employeeId}` - Get reviews
- `POST /performance/reviews` - Create review
- `PUT /performance/reviews/{id}` - Update review
- `GET /performance/metrics` - Get metrics

### Dashboard
- `GET /dashboard/stats` - Dashboard statistics
- `GET /dashboard/leave-stats` - Leave statistics
- `GET /dashboard/performance-overview` - Performance overview

### Notifications
- `GET /notifications` - Get notifications
- `PUT /notifications/{id}/read` - Mark as read
- `PUT /notifications/read-all` - Mark all as read
- `DELETE /notifications/{id}` - Delete notification

## Database Schema

Key tables:
- `users` - Authentication
- `employees` - Employee details
- `departments` - Department info
- `designations` - Job designations
- `leave_requests` - Leave applications
- `leave_balances` - Leave balance tracking
- `performance_reviews` - Performance ratings
- `notifications` - User notifications

## Security

- JWT tokens stored securely
- Password hashing with BCrypt
- SQL injection prevention (parameterized queries)
- CORS configuration
- Rate limiting on sensitive endpoints
- Input validation and sanitization
- Audit logging for sensitive operations

## Deployment

### Docker

```dockerfile
FROM openjdk:17-jdk-slim
COPY target/employee-portal.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
```

### Deploy to Render

1. Push code to GitHub
2. Connect repository to Render
3. Configure environment variables
4. Deploy

## Environment Variables

```
JDBC_DATABASE_URL=jdbc:mysql://host:3306/db
JDBC_DATABASE_USERNAME=user
JDBC_DATABASE_PASSWORD=password
JWT_SECRET=your-secret-key
REDIS_URL=redis://localhost:6379
```

## Testing

```bash
mvn test
```

## Documentation

Swagger API Documentation: `http://localhost:8080/api/swagger-ui.html`

## License

MIT License

## Support

For issues and questions, please create an issue on GitHub.
