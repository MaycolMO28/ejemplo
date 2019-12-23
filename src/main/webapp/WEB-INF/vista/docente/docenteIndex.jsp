<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="Spring" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="Tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>

<article>
    <header>
        <H2 class="text-primary">Listado Docentes</H2>
    </header>
    <article>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Celular</th>
                <th>Especialidad</th>
                <c:if test="${privilegio == 'director'}">
                    <th>Editar</th>
                    <th>Eliminar</th>
                </c:if>
            </tr>
            </thead>
            <tbody>
            <core:forEach var="docente" items="${modeloDocentes}">
                <tr>

                    <td>${docente.nombre}</td>
                    <td>${docente.apellido}</td>
                    <td>${docente.celular}</td>
                    <td>${docente.especialidad}</td>
                    <c:if test="${privilegio == 'director'}">
                        <td><a href="#" onclick="show_DocenteEditar(${docente.id})">Editar</a></td>
                        <td><a href="#" onclick="ElimnarDocente(${docente.id})">Eliminar</a></td>
                    </c:if>
                </tr>
            </core:forEach>
            </tbody>
        </table>

    </article>
    <footer>
        <div class="container">
            <c:if test="${privilegio == 'director'}">
                <button type="button" id="btn_agregar" class="btn btn-primary" onclick="show_DocenteFormNuevo()">Agregar
                    Docente
                </button>
                <button type="button" id="btn_cerrar" class="btn btn-secondary" onclick="doCerrarCasoUso()">Cerrar
                </button>
            </c:if>
        </div>
    </footer>
</article>

<script>
    function show_DocenteFormNuevo() {
        $.get("${pageContext.request.contextPath}/docente/nuevo",
            function (Resultado) {
                $('#divCasoForm').html(Resultado);
            }
        )
    }

    function show_DocenteEditar(id) {
        $.get("${pageContext.request.contextPath}/docente/editar?id=" + id,
            function (Resultado) {
                $('#divCasoForm').html(Resultado);
            }
        )
    }

    function ElimnarDocente(id) {
        var check = confirm("Seguro que quiere eliminar el dato?");
        if (check) {
            $.get("${pageContext.request.contextPath}/docente/eliminar?id=" + id);
            alert("Se elimino correctamente");
            $.get("${pageContext.request.contextPath}/docente/index",
                function (Resultado) {
                    $('#divCasoForm').html(Resultado);
                }
            );
        }
    }

    function show_DocenteIndex() {
        doIniciarCasoUso();
        // $.get(URL, parametros, funcion(datos, estado, xhr), tipoDato)
        $.get("${pageContext.request.contextPath}/docente/index",
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
