<%@ page import="com.project.civic.model.User" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null || !"ADMIN".equals(user.getRole())) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
    return;
  }
%>
<html>
<head>
  <title>Admin Dashboard | Civic Connect</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<nav class="navbar">
  <a href="#" class="navbar-brand">Admin Panel</a>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
  </div>
</nav>

<div class="container">
  <div style="text-align: center; margin-bottom: 3rem;">
    <h1 style="font-size: 2rem; margin-bottom: 0.5rem;">Welcome, <%= user.getName() %></h1>
    <span class="status-badge" style="background: #e2e8f0; color: #475569;">System Administrator</span>
  </div>

  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem;">
    <div class="card" style="text-align: center;">
      <div style="font-size: 2rem; margin-bottom: 1rem;">📋</div>
      <h3>Manage Complaints</h3>
      <p style="color: var(--text-muted); margin-bottom: 1.5rem;">View, track, and update the status of all citizen reports.</p>
      <a href="${pageContext.request.contextPath}/viewAllComplaints" class="btn btn-primary" style="width: 100%;">Open Management</a>
    </div>

    <div class="card" style="text-align: center;">
      <div style="font-size: 2rem; margin-bottom: 1rem;">📊</div>
      <h3>System Reports</h3>
      <p style="color: var(--text-muted); margin-bottom: 1.5rem;">View statistical data and resolution efficiency metrics.</p>
      <a href="${pageContext.request.contextPath}/report" class="btn btn-primary" style="width: 100%; background: white; color: var(--primary); border: 1px solid var(--primary);">View Reports</a>
    </div>
  </div>
</div>
</body>
</html>