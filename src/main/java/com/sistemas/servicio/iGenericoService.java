package com.sistemas.servicio;

import java.util.List;

public interface iGenericoService <Entidad, ID>{
	public Entidad agregar(Entidad entidad);
	public List<Entidad> listarTodos();
	public Entidad buscar(ID id);
	public void actualizar(Entidad alumno);
	public void eliminar(ID id);
	// Actualizar
	// Eliminar
}

