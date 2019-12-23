<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<html>
<header>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media ( min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        body {
            padding-top: 3.5rem;
        }

        #divCasoForm {
            position: relative;
            top: 20px;
        }
    </style>
    <title>Panel Director</title>
</header>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">Ejemplo JPA</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarsExampleDefault"
                aria-controls="navbarsExampleDefault" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdownArchivo"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Registro</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownArchivo">
                        <a class="dropdown-item" href="javascript:show_AlumnoIndex()">Alumnos</a>
                        <a class="dropdown-item" href="javascript:show_DocenteIndex()">Docentes</a>
                        <a class="dropdown-item" href="javascript:show_CursoIndex()">Cursos</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdownProceso"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Agregar</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownArchivo">
                        <a class="dropdown-item" href="javascript:agregarAlumno()">Alumno</a>
                        <a class="dropdown-item" href="javascript:agregarDocente()">Docente</a>
                        <a class="dropdown-item" href="javascript:agregarCurso()">Curso</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdownPoblar"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Generar Datos (Poblar)</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownPoblar">
                        <a class="dropdown-item" href="javascript:poblarAlumnos()">Alumnos</a>
                        <a class="dropdown-item" href="javascript:poblarDocentes()">Docentes</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <a class="btn btn-primary my-2"
                       href="javascript:document.getElementById('logout').submit()">Salir</a>
                </c:if>
            </form>
        </div>
    </nav>
</header>
<main role="main" style="padding-top: 25px;">

    <div class="jumbotron" id="divPrincipal">
        <div class="container">
            <h1 class="display-3">Panel Director</h1>
            <p>Este programa de ejemplo muestra el acceso a datos usando el Framework Spring.
                It includes a large callout called a jumbotron and three supporting pieces of content.
                Use it as a starting point to create something more unique.</p>
        </div>
    </div>

    <div class="container" id="divCasoForm" style="display: none;">
    </div>

    <div class="container" id="divCasoRes" style="display: none;">
    </div>

</main>

<footer class="container text-center" id="pie" style="padding:25px;">
    <p>&copy; Sistemas 2019</p>
</footer>
<c:url value="/logout" var="logoutUrl"/>
<form id="logout" action="${logoutUrl}" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    function show_AlumnoIndex(){
        doIniciarCasoUso();
        $.get("${pageContext.request.contextPath}/alumno/index",
            function(Resultado){
                $('#divCasoForm').html(Resultado);
            }
        );
    };
    function show_DocenteIndex(){
        doIniciarCasoUso();
        $.get("${pageContext.request.contextPath}/docente/index",
            function(Resultado){
                $('#divCasoForm').html(Resultado);
            }
        );
    };
    function show_CursoIndex(){
        doIniciarCasoUso();
        $.get("${pageContext.request.contextPath}/curso/index",
            function(Resultado){
                $('#divCasoForm').html(Resultado);
            }
        );
    };

    function agregarAlumno() {
        doIniciarCasoUso();
        $.get("${pageContext.request.contextPath}/alumno/nuevo",
            function(Resultado){
                $('#divCasoForm').html(Resultado);
            }
        );
    }
    function agregarDocente() {
        doIniciarCasoUso();
        $.get("${pageContext.request.contextPath}/docente/nuevo",
            function(Resultado){
                $('#divCasoForm').html(Resultado);
            }
        );
    }
    function agregarCurso() {
        doIniciarCasoUso();
        $.get("${pageContext.request.contextPath}/curso/nuevo",
            function(Resultado){
                $('#divCasoForm').html(Resultado);
            }
        );
    }

    function poblarAlumnos(){
        $.get("${pageContext.request.contextPath}/alumno/poblar");
    }
    function poblarDocentes(){
        $.get("${pageContext.request.contextPath}/docente/poblar");
    }

    function doIniciarCasoUso(){
        $('#divPrincipal').hide();
        $('#divCasoForm').show();
        $('#divCasoRes').show();
    }
    function doCerrarCasoUso(){
        $('#divPrincipal').show();
        $('#divCasoForm').hide();
        $('#divCasoRes').hide();
    };
</script>
</body>
</html>
