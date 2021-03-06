<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="Spring" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="Tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: carlosjerson
  Date: 19/11/19
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<article>
    <header>
        <H2 class="text-primary">Registrar Curso</H2>
    </header>
    <article>
        <Spring:form modelAttribute="curso" id="frmCursoNuevo" method="post">
            <div class="form-group">
                <Spring:hidden path="id" class="form-control" id="InputID" placeholder="(reservado)"/>
                <Spring:errors path="id" cssClass="alert-info"></Spring:errors>
            </div>
            <div class="form-group">
                <Spring:label path="codigo" for="InputCodigo">Codigo</Spring:label>
                <Spring:input path="codigo" id="InputCodigo" class="form-control"
                              cssErrorClass="form-control alert-danger" placeholder="Ingrese Codigo"
                              data-toggle="tooltip" data-placement="bottom" title="Ingrese Codigo Completo"
                              maxlength="9" size="9" required="required"/>
                <Spring:errors path="codigo" class="text-danger"></Spring:errors>
            </div>

            <div class="form-group">
                <Spring:label path="descripcion" for="InputDescripcion">Descripcion</Spring:label>
                <Spring:input path="descripcion" id="InputDescripcion" class="form-control"
                              cssErrorClass="form-control alert-danger" placeholder="Ingrese Descripcion"
                              data-toggle="tooltip" data-placement="bottom" title="Ingrese Descripcion"
                              required="required"/>
                <Spring:errors path="descripcion" cssClass="text-danger"></Spring:errors>
            </div>

            <div class="form-group">
                <Spring:label path="sumilla" for="InputSumilla">Sumilla</Spring:label>
                <Spring:textarea path="sumilla" id="InputSumilla" class="form-control"
                                 cssErrorClass="form-control alert-danger" placeholder="Ingrese Sumilla"
                                 data-toggle="tooltip" data-placement="bottom" title="Ingrese Sumilla"
                                 required="required"/>
                <Spring:errors path="sumilla" cssClass="text-danger"></Spring:errors>
            </div>
            <div class="row">
                <div class="form-group col-6">
                    <Spring:label path="creditos" for="InputCreditos">Creditos</Spring:label>
                    <Spring:input path="creditos" id="InputCreditos" class="form-control"
                                  cssErrorClass="form-control alert-danger" placeholder="Ingrese Creditos"
                                  data-toggle="tooltip" data-placement="bottom" title="Ingrese Creditos" type="number"
                                  min="1" required="required" maxlength="2"/>
                    <Spring:errors path="creditos" cssClass="text-danger"></Spring:errors>
                </div>
                <div class="form-group col-6">
                    <Spring:label path="ciclo" for="InputCiclo">Ciclo</Spring:label>
                    <Spring:select class="form-control" path="ciclo" required="required">
                        <option hidden selected></option>
                        <Spring:option value="I">I</Spring:option>
                        <Spring:option value="II">II</Spring:option>
                        <Spring:option value="III">III</Spring:option>
                        <Spring:option value="IV">IV</Spring:option>
                        <Spring:option value="V">V</Spring:option>
                        <Spring:option value="VI">VI</Spring:option>
                        <Spring:option value="VII">VII</Spring:option>
                        <Spring:option value="VIII">VIII</Spring:option>
                        <Spring:option value="IX">IX</Spring:option>
                        <Spring:option value="X">X</Spring:option>
                    </Spring:select>
                    <Spring:errors path="ciclo" cssClass="text-danger"></Spring:errors>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-6">
                    <Spring:label path="horasTeoria" for="InputeMail">Horas Teoria</Spring:label>
                    <Spring:input type="number" path="horasTeoria" id="InputHorasTeoria" class="form-control"
                                  cssErrorClass="form-control alert-danger" placeholder="Ingrese Horas Teoria"
                                  data-toggle="tooltip" data-placement="bottom" title="Ingrese Horas Teoria" min="1"
                                  size="2" maxlength="2" required="required"/>
                    <Spring:errors path="horasTeoria" cssClass="text-danger"></Spring:errors>
                </div>
                <div class="form-group col-6">
                    <Spring:label path="horasPractica" for="InputHorasPractica">Horas Practica</Spring:label>
                    <Spring:input path="horasPractica" id="InputHorasPractica" class="form-control" type="number"
                                  cssErrorClass="form-control alert-danger" placeholder="Ingrese Horas Practica"
                                  data-toggle="tooltip" data-placement="bottom" title="Ingrese Horas Practica" min="1"
                                  size="2" maxlength="2" required="required"/>
                    <Spring:errors path="horasPractica" cssClass="text-danger"></Spring:errors>
                </div>
            </div>
            <div class="form-group">
                <Spring:button type="submit" id="btn_enviar" class="btn btn-primary">Guardar</Spring:button>
                <Spring:button type="button" id="btn_regresar" class="btn btn-secondary"
                               onclick="show_CursoIndex()">Regresar</Spring:button>
            </div>
        </Spring:form>
    </article>
</article>
<script>
    $("#frmCursoNuevo").submit(function () {
        $.post(
            "${pageContext.request.contextPath}/curso/nuevo",
            $("#frmCursoNuevo").serialize(),
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
