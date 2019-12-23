package com.sistemas.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sistemas.entidad.Alumno;
import com.sistemas.repositorio.AlumnoRepository;

@Service
public class AlumnoServiceImpl implements AlumnoService{
	@Autowired
	private AlumnoRepository alumnoRepository;

	@Override
	public Alumno agregar(Alumno entidad) {
		Alumno result = alumnoRepository.saveAndFlush(entidad);
		
		return result;
	}

	@Override
	public List<Alumno> listarTodos() {
		List<Alumno> result = alumnoRepository.findAll();
		return result;
	}

	@Override
	public Alumno buscar(Long id) {
		Alumno result = null;
		Optional<Alumno> buscado = alumnoRepository.findById(id);
		
		if (buscado.isPresent()){
			result = alumnoRepository.findById(id).get();
		}
		return result;
	}

	@Override
	public void actualizar(Alumno alumno){
		alumnoRepository.save(alumno);
	}

	@Override
	public void eliminar(Long id) {
		alumnoRepository.deleteById(id);
	}

}
