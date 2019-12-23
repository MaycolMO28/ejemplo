<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: carlosjerson
  Date: 19/11/19
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<article>
    <header>
        <H2 class="text-primary">Listado Cursos</H2>
    </header>
    <article>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Codigo</th>
                <th>Descripcion</th>
                <th>Sumilla</th>
                <th>Creditos</th>
                <th>Ciclo</th>
                <th>Horas Teoria</th>
                <th>Horas Practica</th>
                <c:if test="${privilegio == 'director'}">
                    <th>Editar</th>
                    <th>Eliminar</th>
                </c:if>
            </tr>
            </thead>
            <tbody>
            <core:forEach var="curso" items="${modeloCursos}">
                <tr>

                    <td>${curso.codigo}</td>
                    <td>${curso.descripcion}</td>
                    <td>${curso.sumilla}</td>
                    <td>${curso.creditos}</td>
                    <td>${curso.ciclo}</td>
                    <td>${curso.horasTeoria}</td>
                    <td>${curso.horasPractica}</td>
                    <c:if test="${privilegio == 'director'}">
                        <td><a href="#" onclick="show_CursoEditar(${curso.id})">Editar</a></td>
                        <td><a href="#" onclick="ElimnarCurso(${curso.id})">Eliminar</a></td>
                    </c:if>
                </tr>
            </core:forEach>
            </tbody>
        </table>

    </article>
    <footer>

        <div class="container">
            <c:if test="${privilegio == 'director'}">
                <button type="button" id="btn_agregar" class="btn btn-primary" onclick="show_CursoFormNuevo()">Agregar
                    Curso
                </button>
                <button type="button" id="btn_cerrar" class="btn btn-secondary" onclick="doCerrarCasoUso()">Cerrar
                </button>
            </c:if>
        </div>
    </footer>
</article>
<script>
    function show_CursoFormNuevo() {
        $.get("${pageContext.request.contextPath}/curso/nuevo",
            function (Resultado) {
                $('#divCasoForm').html(Resultado);
            }
        )
    }

    function show_CursoEditar(id) {
        $.get("${pageContext.request.contextPath}/curso/editar?id=" + id,
            function (Resultado) {
                $('#divCasoForm').html(Resultado);
            }
        )
    }

    function ElimnarCurso(id) {
        var check = confirm("Seguro que quiere eliminar el dato?");
        if (check) {
            $.get("${pageContext.request.contextPath}/curso/eliminar?id=" + id);
            alert("Se elimino correctamente");
            $.get("${pageContext.request.contextPath}/curso/index",
                function (Resultado) {
                    $('#divCasoForm').html(Resultado);
                }
            );
        }
    }

    function show_CursoIndex() {
        doIniciarCasoUso();
        // $.get(URL, parametros, funcion(datos, estado, xhr), tipoDato)
        $.get("${pageContext.request.contextPath}/curso/index",
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