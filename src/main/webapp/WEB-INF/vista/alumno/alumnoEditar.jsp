<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="Spring" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="Tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<article>
    <header>
        <H2 class="text-primary">Editar Alumno</H2>
    </header>
    <article>
        <Spring:form modelAttribute="alumno" id="frmAlumnoEditar" method="post">
            <div class="form-group">
                <Spring:hidden path="id" class="form-control" id="InputID" placeholder="(reservado)"/>
                <Spring:errors path="id" cssClass="alert-info"></Spring:errors>
            </div>
            <div class="form-group">
                <Spring:label path="nombre" for="InputNombres">Nombres</Spring:label>
                <Spring:input path="nombre" id="InputNombres" class="form-control" value="${alumno.nombre}"
                              cssErrorClass="form-control alert-danger" placeholder="Ingrese Nombres"
                              data-toggle="tooltip" data-placement="bottom" title="Ingrese nombres completos"/>
                <Spring:errors path="nombre" class="text-danger"></Spring:errors>
            </div>
            <div class="form-group">
                <Spring:label path="apellido" for="InputApellidos">Apellidos</Spring:label>
                <Spring:input path="apellido" id="InputApellidos" class="form-control" value="${alumno.apellido}"
                              cssErrorClass="form-control alert-danger" placeholder="Ingrese Apellidos"
                              data-toggle="tooltip" data-placement="bottom" title="Ingrese apellido paterno y materno"/>
                <Spring:errors path="apellido" cssClass="text-danger"></Spring:errors>
            </div>
            <div class="form-group">
                <Spring:label path="celular" for="InputCelular">Celular</Spring:label>
                <Spring:input path="celular" id="InputCelular" class="form-control" value="${alumno.celular}"
                              cssErrorClass="form-control alert-danger" placeholder="Ingrese Celular"
                              data-toggle="tooltip" data-placement="bottom" title="Ingrese celular"/>
                <Spring:errors path="celular" cssClass="text-danger"></Spring:errors>
            </div>
            <div class="form-group">
                <Spring:label path="direccion" for="InputDireccion">Direccion</Spring:label>
                <Spring:input path="direccion" id="InputDireccion" class="form-control" value="${alumno.direccion}"
                              cssErrorClass="form-control alert-danger" placeholder="Ingrese Direccion"
                              data-toggle="tooltip" data-placement="bottom" title="Ingrese direccion"/>
                <Spring:errors path="direccion" cssClass="text-danger"></Spring:errors>
            </div>
            <div class="form-group">
                <Spring:label path="fNacimiento" for="InputfNacimiento">Fecha de Nacimiento </Spring:label>
                <Spring:input type="date" path="fNacimiento" id="InputfNacimiento" class="form-control"
                              cssErrorClass="form-control alert-danger" placeholder="Ingrese fecha de nacimiento"
                              data-toggle="tooltip" data-placement="bottom" title="Ingrese fecha de nacimiento"/>
                <Spring:errors path="fNacimiento" cssClass="text-danger"></Spring:errors>
            </div>
            <div class="form-group">
                <Spring:label path="eMail" for="InputeMail">Correo Electronico</Spring:label>
                <Spring:input type="email" path="eMail" id="InputeMail" class="form-control"
                              cssErrorClass="form-control alert-danger" placeholder="Ingrese correo electronico"
                              data-toggle="tooltip" data-placement="bottom" title="Ingrese correo electronico"/>
                <Spring:errors path="eMail" cssClass="text-danger"></Spring:errors>
            </div>
            <div class="form-group">
                <Spring:label path="promedio" for="InputPromedio">Promedio</Spring:label>
                <Spring:input path="promedio" id="InputPromedio" class="form-control"
                              cssErrorClass="form-control alert-danger" placeholder="Ingrese promedio"
                              data-toggle="tooltip" data-placement="bottom" title="Ingrese promedio"/>
                <Spring:errors path="promedio" cssClass="text-danger"></Spring:errors>
            </div>
            <div class="form-group">
                <Spring:button type="submit" id="btn_enviar" class="btn btn-primary">Guardar</Spring:button>
                <Spring:button type="button" id="btn_regresar" class="btn btn-secondary"
                               onclick="show_AlumnoIndex()">Cancelar</Spring:button>
            </div>
        </Spring:form>
    </article>
</article>
<script>
    $("#frmAlumnoEditar").submit(function () {
        $.post(
            "${pageContext.request.contextPath}/alumno/editar",
            $("#frmAlumnoEditar").serialize(),
            function (Data) {
                $('#divCasoForm').html(Data);
            }
        );
        return false;
    });
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });

</script>
