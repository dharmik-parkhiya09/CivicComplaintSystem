<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login | Civic Connect</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="display: flex; align-items: center; justify-content: center; min-height: 100vh;">
<div class="card" style="width: 100%; max-width: 400px;">
  <div style="text-align: center; margin-bottom: 2rem;">
    <h2 style="margin-bottom: 0.5rem;">Welcome Back</h2>
    <p style="color: var(--text-muted);">Log in to manage your civic reports</p>
  </div>

  <form action="${pageContext.request.contextPath}/login" method="post">
    <div class="form-group">
      <label>Email Address</label>
      <input type="email" name="email" placeholder="name@company.com" required/>
    </div>

    <div class="form-group">
      <label>Password</label>
      <input type="password" name="password" placeholder="••••••••" required/>
    </div>

    <button type="submit" class="btn btn-primary" style="width: 100%;">Sign In</button>
  </form>

  <% if (request.getAttribute("error") != null) { %>
  <div style="background: #fef2f2; color: var(--danger); padding: 0.75rem; border-radius: 8px; margin-top: 1rem; text-align: center; font-size: 0.875rem;">
    <%= request.getAttribute("error") %>
  </div>
  <% } %>

  <p style="text-align: center; margin-top: 1.5rem; font-size: 0.875rem;">
    Don't have an account? <a href="register.jsp" style="color: var(--primary); font-weight: 600;">Create one</a>
  </p>
</div>
</body>
</html>