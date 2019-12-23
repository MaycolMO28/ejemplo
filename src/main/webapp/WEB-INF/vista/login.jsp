<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body onload='document.loginForm.username.focus();'>



<!--Navbar -->
<nav class="mb-1 navbar navbar-expand-lg navbar-dark secondary-color lighten-1">
  <h2 class="navbar-brand" >PROYECTO DE ARQUITECTURA DE SOFTWARE</h2>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-555"
    aria-controls="navbarSupportedContent-555" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent-555">
 
    <ul class="navbar-nav ml-auto nav-flex-icons">
   
      <li class="nav-item avatar dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-55" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-2.jpg" class="rounded-circle z-depth-0"
            alt="avatar image">
        </a>
        
      </li>
    </ul>
  </div>
</nav>
<!--/.Navbar -->



































<div class="container">
    <div class="row" style="padding-top:150px;">
        <div class="col-6">
            <h1>Login</h1>
            <form action="<c:url value='/' />" method='POST' style="padding-top:20px;">
                <c:if test="${not empty error}">
                    <div class="alert-danger text-center" style="padding: 5px;">${error}</div>
                </c:if>
                <c:if test="${not empty logout}">
                    <div class="alert-info text-center" style="padding: 5px;">${logout}</div>
                </c:if>
                <div class="form-group">
                    <label for="username">Usuario</label>
                    <input type="text" class="form-control" id="username"
                           name="username" placeholder="Ingrese usuario">
                </div>
                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" class="form-control" id="password"
                           name="password" placeholder="Ingrese Contraseña">
                </div>
                <button class="btn btn-primary">Ingresar</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
        <div class="col-6" style="padding-left: 40px;">
            <h2 align="center">Acceso</h2>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Usuario</th>
                    <th scope="col">Contraseña</th>
                    <th scope="col">Rol</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>lilyramirez</td>
                    <td>lily</td>
                    <td>Alumna</td>
                </tr>
                <tr>
                    <td>isabelperez</td>
                    <td>isabel</td>
                    <td>Alumna</td>
                </tr>
                <tr>
                    <td>kellysullon</td>
                    <td>kelly</td>
                    <td>Alumna</td>
                </tr>
                <tr>
                    <td>director</td>
                    <td>123</td>
                    <td>Director</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
