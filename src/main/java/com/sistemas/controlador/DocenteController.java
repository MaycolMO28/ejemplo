package com.sistemas.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.sistemas.entidad.Docente;
import com.sistemas.servicio.DocenteService;

import javax.validation.Valid;

@Controller
@RequestMapping("/docente")
public class DocenteController {
    @Autowired
    private DocenteService docenteServicio;

    @RequestMapping(path = "/poblar", method = RequestMethod.GET)
    public String poblarDocentes() {
        Docente d1 = new Docente((long) 10, "Jorge", "Linares", "95623319", "Sistemas");
        Docente d2 = new Docente((long) 20, "Adriano", "Jimenez", "945244663", "Industrial");
        Docente d3 = new Docente((long) 30, "Juana", "Mendoza", "924587236", "Agronomia");
        Docente d4 = new Docente((long) 40, "Rosa", "Utrilla", "979658137", "Civil");

        docenteServicio.agregar(d1);
        docenteServicio.agregar(d2);
        docenteServicio.agregar(d3);
        docenteServicio.agregar(d4);

        return "testindex";
    }

    @RequestMapping(path = "/mostrar", method = RequestMethod.GET)
    public String mostarDocentes() {
        System.out.println("Docentes en DB:");

        for (Docente x : docenteServicio.listarTodos()) {
            System.out.println(x.toString());
        }

        return "testindex";
    }

    @GetMapping(value = {"/", "/index"})
    public String listarDocentes(Model model, Authentication authResult) {
        Iterable<Docente> listadoDocentes = docenteServicio.listarTodos();

        model.addAttribute("modeloDocentes", listadoDocentes);
        String role = authResult.getAuthorities().toString();
        if (role.contains("DIRECTOR")) {
            model.addAttribute("privilegio", "director");
        } else {
            model.addAttribute("privilegio", "alumno");
        }

        return "docente/docenteIndex";
    }

    @GetMapping(value = "/nuevo")
    public String mostrarDocenteFormNuevo(Docente docente) {
        return "docente/docenteFormNuevo";
    }

    @PostMapping(value = "/nuevo")
    public String procesarDocenteFormNuevo(
            @Valid @ModelAttribute("docente") Docente docente,
            BindingResult bindingResult,
            Model model) {

        if (bindingResult.hasErrors()) {
            // Corregir errores
            return "docente/docenteFormNuevo";
        }
        // Si llegamos hasta aqu� es que no hubo errores
        docenteServicio.agregar(docente);

        return "redirect:index";
    }


    @RequestMapping(value = "/editar")
    public String editarDocenteForm(@RequestParam long id, Model model) {
        model.addAttribute("docente", docenteServicio.buscar(id));
        return "docente/docenteEditar";
    }

    @PostMapping(value = "/editar")
    public String editarDocenteForm(@Valid @ModelAttribute("docente") Docente docente, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            // Corregir errores
            return "docente/docenteEditar";
        }
        docenteServicio.actualizar(docente);
        return "redirect:index";
    }

    @RequestMapping(value = "/eliminar")
    public String editarDocenteForm(@RequestParam long id) {
        docenteServicio.eliminar(id);
        return "redirect:index";
    }

}
