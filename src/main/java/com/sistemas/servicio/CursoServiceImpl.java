package com.sistemas.servicio;

import com.sistemas.entidad.Curso;
import com.sistemas.repositorio.CursoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CursoServiceImpl implements CursoService {

    @Autowired
    private CursoRepository cursoRepository;

    @Override
    public Curso agregar(Curso curso) {
        Curso c = cursoRepository.saveAndFlush(curso);
        return c;
    }

    @Override
    public List<Curso> listarTodos() {
        List<Curso> result = cursoRepository.findAll();
        return result;
    }

    @Override
    public Curso buscar(Long id) {
        Curso result = null;
        Optional<Curso> buscado = cursoRepository.findById(id);

        if (buscado.isPresent()) {
            result = cursoRepository.findById(id).get();
        }
        return result;
    }

    @Override
    public void actualizar(Curso curso) {
        cursoRepository.save(curso);
    }

    @Override
    public void eliminar(Long id) {
        cursoRepository.deleteById(id);
    }
}
