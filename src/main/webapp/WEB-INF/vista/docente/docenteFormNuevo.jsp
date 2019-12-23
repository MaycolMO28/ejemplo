<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="Spring" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="Tags" %>

<article>
	<header>
		<H2 class="text-primary">Registrar Docente</H2>
	</header>
	<article>
	<Spring:form modelAttribute = "docente" id="frmDocenteNuevo" method="post">
		<div class="form-group">
			<Spring:hidden path="id" class="form-control" id="InputID" placeholder="(reservado)"/>
			<Spring:errors path="id" cssClass="alert-info"></Spring:errors>
		</div>
		<div class="form-group">
			<Spring:label path="nombre" for="InputNombres">Nombres</Spring:label>
			<Spring:input path="nombre" id="InputNombres" class="form-control" 
				cssErrorClass="form-control alert-danger"	placeholder="Ingrese Nombres" 
				data-toggle="tooltip" data-placement="bottom" title="Ingrese nombres completos"/>
			<Spring:errors path="nombre" class="text-danger"></Spring:errors>
		</div>
		<div class="form-group">
			<Spring:label path="apellido" for="InputApellidos">Apellidos</Spring:label>
			<Spring:input path="apellido" id="InputApellidos" class="form-control" 
				cssErrorClass="form-control alert-danger" placeholder="Ingrese Apellidos"
				data-toggle="tooltip" data-placement="bottom" title="Ingrese apellido paterno y materno"/>
			<Spring:errors path="apellido" cssClass="text-danger"></Spring:errors>
		</div>
		<div class="form-group">
			<Spring:label path="celular" for="InputCelular">Celular</Spring:label>
			<Spring:input path="celular" id="InputCelular" class="form-control" 
				cssErrorClass="form-control alert-danger" placeholder="Ingrese Celular"
				data-toggle="tooltip" data-placement="bottom" title="Ingrese celular"/>
			<Spring:errors path="celular" cssClass="text-danger"></Spring:errors>
		</div>
		<div class="form-group">
			<Spring:label path="especialidad" for="InputEspecialidad">Especialidad</Spring:label>
			<Spring:input path="especialidad" id="InputEspecialidad" class="form-control"
				cssErrorClass="form-control alert-danger" placeholder="Ingrese Especialidad"
				data-toggle="tooltip" data-placement="bottom" title="Ingrese Especialidad"/>
			<Spring:errors path="especialidad" cssClass="text-danger"></Spring:errors>
		</div>
		<div class="form-group">
			<Spring:button type="submit" id="btn_enviar" class="btn btn-primary">Guardar</Spring:button>
			<Spring:button type="button" id="btn_regresar" class="btn btn-secondary"
				 onclick="show_DocenteIndex()">Regresar</Spring:button>
		</div>
	</Spring:form>
	</article>
</article>
<script>
	$("#frmDocenteNuevo").submit(function() {
		$.post(
			"${pageContext.request.contextPath}/docente/nuevo",
			$("#frmDocenteNuevo").serialize(),
			function(Data){
				$('#divCasoForm').html(Data);
			}
		);
		return false;
	});
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>