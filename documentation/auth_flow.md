# Authentication Flow Documentation

## Overview

This document outlines the authentication flow for admin access to the application. The system implements a secure JWT-based authentication mechanism with proper security measures to protect admin functionality.

## Authentication Flow Steps

| Step | Description | Notes |
|------|-------------|-------|
| 1 | POST /admin/login | Entry point for admin authentication |
| 2 | Admin enters username + password | Minimal UI with brute-force protection |
| 3 | Credentials stored in AWS Secrets Manager | Secure credential storage |
| 4 | Backend verifies credentials, returns JWT | JWT signed with secret key, short-lived |
| 5 | Frontend uses JWT in Authorization header | Standard practice for API authentication |
| 6 | Lambda authorizer validates JWT on every admin endpoint | Shared JWT secret validates signature |

## Security Implementation

### 1. Brute Force Protection

**Issue**: Attackers could attempt millions of password combinations using automated bots.

**Solution**:
- Implement rate limiting (e.g., max 5 requests per minute per IP)
- Return generic error messages (never reveal if user exists)
- Use AWS WAF with IP rate limits or implement IP limiting in Lambda

### 2. Password Hashing

**Implementation**: Use bcrypt for password hashing and comparison.

```typescript
import bcrypt from 'bcryptjs';

// Store this hashed value in Secrets Manager
const storedHash = '$2a$12$...';
const isValid = await bcrypt.compare(inputPassword, storedHash);
```

**Important**: Hash passwords once and store the hash in Secrets Manager. Never store raw passwords.

### 3. JWT Token Creation

**Implementation**: Generate tokens using strong secret keys with short expiration times.

```typescript
import jwt from 'jsonwebtoken';

const token = jwt.sign(
  { role: 'admin' },
  process.env.JWT_SECRET,
  { expiresIn: '1h' }
);
```

**Configuration**:
- Store JWT_SECRET in Secrets Manager or SSM
- 1-hour expiration provides good balance of security and usability
- Consider 15-minute expiration for stricter security requirements

### 4. JWT Validation on Admin Routes

Every admin route must implement the following validation:

1. Extract `Authorization: Bearer <token>` header
2. Validate JWT signature
3. Check `exp` claim (expiration)

```typescript
const decoded = jwt.verify(token, process.env.JWT_SECRET);
// Optionally check role === 'admin'
```

**Access Control**: Never allow access if token is:
- Expired
- Invalid
- Missing

### 5. Secure Lambda + API Gateway Configuration

**Security Measures**:
- Never leave admin routes public in `serverless.yml`
- Use custom Lambda authorizer or middleware to enforce JWT validation
- Ensure API Gateway routes for `/admin/*` are only accessible with valid JWT

### 6. Protection Against Token Theft and Replay Attacks

**Issue**: Stolen JWTs from localStorage could be reused by attackers.

**Mitigation Strategies**:
- Use HTTPS only (default with Amplify)
- Set short expiration times (15-60 minutes)
- Implement proper logout: `localStorage.removeItem('jwt')`
- Consider JWT rotation with refresh tokens (advanced feature)

### 7. Cost Protection Measures

**Critical**: Implement measures to prevent AWS abuse and runaway costs.

**Protection Strategies**:
- Add rate limiting to all routes via API Gateway or Lambda
- Protect write operations and expensive operations (e.g., DB writes) with strong authentication
- Monitor usage via CloudWatch Alarms
- Set AWS budget alerts in Billing → Budgets → Create budget
- Implement email notifications or automatic shutdown on threshold crossing

**Optional Enhancement**: Use a "kill switch" environment variable in SSM (e.g., `APP_ACTIVE=false`) checked in every Lambda before processing logic.



## Security Checklist

### Required Implementation
- [ ] Password hashing with bcrypt
- [ ] Rate limiting on login endpoints
- [ ] JWT validation on all admin routes
- [ ] Secrets stored in AWS Secrets Manager or SSM
- [ ] HTTPS enforcement (Amplify default)
- [ ] Proper error handling without information disclosure

### Recommended Enhancements
- [ ] JWT refresh token mechanism
- [ ] Advanced rate limiting with IP tracking
- [ ] Comprehensive logging and monitoring
- [ ] Automated security testing

