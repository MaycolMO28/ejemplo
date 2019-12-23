<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="Spring" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="Tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<article>
    <header>
        <H2 class="text-primary">Listado Alumnos</H2>
    </header>
    <article>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Celular</th>
                <th>Direccion</th>
                <th>F. Nacimiento</th>
                <th>eMail</th>
                <th>Promedio</th>
                <c:if test="${privilegio == 'director'}">
                    <th>Editar</th>
                    <th>Eliminar</th>
                </c:if>
            </tr>
            </thead>
            <tbody>
            <core:forEach var="alumno" items="${modeloAlumnos}">
                <tr>

                    <td>${alumno.nombre}</td>
                    <td>${alumno.apellido}</td>
                    <td>${alumno.celular}</td>
                    <td>${alumno.direccion}</td>
                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${alumno.fNacimiento}"/></td>
                    <td>${alumno.eMail}</td>
                    <td>${alumno.promedio}</td>
                    <c:if test="${privilegio == 'director'}">
                        <td><a href="#" onclick="show_AlumnoEditar(${alumno.id})">Editar</a></td>
                        <td><a href="#" onclick="ElimnarAlumno(${alumno.id})">Eliminar</a></td>
                    </c:if>
                </tr>
            </core:forEach>
            </tbody>
        </table>

    </article>
    <footer>
        <div class="container">
            <c:if test="${privilegio == 'director'}">
                <button type="button" id="btn_agregar" class="btn btn-primary" onclick="show_AlumnoFormNuevo()">Agregar
                    Alumno
                </button>
                <button type="button" id="btn_cerrar" class="btn btn-secondary" onclick="doCerrarCasoUso()">Cerrar
                </button>
            </c:if>
        </div>
    </footer>
</article>

<script>
    function show_AlumnoFormNuevo() {
        $.get("${pageContext.request.contextPath}/alumno/nuevo",
            function (Resultado) {
                $('#divCasoForm').html(Resultado);
            }
        )
    }

    function show_AlumnoEditar(id) {
        $.get("${pageContext.request.contextPath}/alumno/editar?id=" + id,
            function (Resultado) {
                $('#divCasoForm').html(Resultado);
            }
        )
    }

    function ElimnarAlumno(id) {
        var check = confirm("Seguro que quiere eliminar el dato?");
        if (check) {
            $.get("${pageContext.request.contextPath}/alumno/eliminar?id=" + id);
            alert("Se elimino correctamente");
            $.get("${pageContext.request.contextPath}/alumno/index",
                function (Resultado) {
                    $('#divCasoForm').html(Resultado);
                }
            );
        }
    }

    function show_AlumnoIndex() {
        doIniciarCasoUso();
        // $.get(URL, parametros, funcion(datos, estado, xhr), tipoDato)
        $.get("${pageContext.request.contextPath}/alumno/index",
            function (Resultado) {
                $('#divCasoForm').html(Resultado);
            }
        );
    };

    function doIniciarCasoUso() {
        $('#divPrincipal').hide();
        $('#divCasoForm').show();
        $('#divCasoRes').show();
    }
</script>
