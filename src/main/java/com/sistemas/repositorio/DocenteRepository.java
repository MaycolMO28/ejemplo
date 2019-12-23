package com.sistemas.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sistemas.entidad.Docente;

@Repository
public interface DocenteRepository extends JpaRepository<Docente, Long> {

}
