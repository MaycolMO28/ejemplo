package com.sistemas.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sistemas.entidad.Alumno;

@Repository
public interface AlumnoRepository extends JpaRepository<Alumno, Long> {

}
