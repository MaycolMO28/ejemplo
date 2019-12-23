package com.sistemas.controlador;

import com.sistemas.entidad.Curso;
import com.sistemas.servicio.CursoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/curso")
public class CursoController {

    @Autowired
    private CursoService cursoService;

    @GetMapping(value = {"/", "/index"})
    public String listarCurso(Model model, Authentication authResult) {
        Iterable<Curso> listadoCursos = cursoService.listarTodos();
        model.addAttribute("modeloCursos", listadoCursos);
        String role = authResult.getAuthorities().toString();
        if (role.contains("DIRECTOR")) {
            model.addAttribute("privilegio", "director");
        } else {
            model.addAttribute("privilegio", "alumno");
        }
        return "curso/cursoIndex";
    }

    @GetMapping(value = "/nuevo")
    public String mostrarCursoFormNuevo(Curso curso) {
        return "curso/cursoFormNuevo";
    }

    @PostMapping(value = "/nuevo")
    public String procesarCursoFormNuevo(
            @Valid @ModelAttribute("curso") Curso curso,
            BindingResult bindingResult,
            Model model) {

        if (bindingResult.hasErrors()) {
            return "curso/cursoFormNuevo";
        }
        cursoService.agregar(curso);

        return "redirect:index";
    }

    @RequestMapping(value = "/editar")
    public String editarCursoForm(@RequestParam long id, Model model) {
        model.addAttribute("curso", cursoService.buscar(id));
        return "curso/cursoEditar";
    }

    @PostMapping(value = "/editar")
    public String editarCursoForm(@Valid @ModelAttribute("curso") Curso curso, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "curso/cursoEditar";
        }
        cursoService.actualizar(curso);
        return "redirect:index";
    }

    @RequestMapping(value = "/eliminar")
    public String editarCursoForm(@RequestParam long id) {
        cursoService.eliminar(id);
        return "redirect:index";
    }
}
