package com.sistemas.controlador;

import java.sql.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.sistemas.entidad.Alumno;
import com.sistemas.servicio.AlumnoService;

@Controller
@RequestMapping("/alumno")
public class AlumnoController {
    @Autowired
    private AlumnoService alumnoServicio;

    @RequestMapping(value = "/poblar", method = RequestMethod.GET)
    public String poblarAlumnos() {
		/*
		Alumno a1= new Alumno(10, "Juan", "Torres", "968523789", 
				Date.valueOf("1980-01-01").toLocalDate(), "jtorres@sistemas.edu.pe", 
				"Urb. abc", 12.5);
		Alumno a2= new Alumno(20, "Carlos", "Pelaes", "937200455", 
				Date.valueOf("1980-05-11").toLocalDate(), "cpelaes@sistemas.edu.pe",
				"Urb. 123", 16.2);
		Alumno a3= new Alumno(30, "Mario", "Bunge", "979300124", 
				Date.valueOf("1986-02-10").toLocalDate(), "mbunge@sistemas.edu.pe",
				"Urb. xyz", 15.2);
		Alumno a4= new Alumno(40, "Ricardo", "Linares", "931555824", 
				Date.valueOf("1980-08-05").toLocalDate(), "jtorres@sistemas.edu.pe", 
				"Urb. 789", 14.4);
		*/
        Alumno a1 = new Alumno(10, "Juan", "Torres", "968523789",
                Date.valueOf("1980-01-01"), "jtorres@sistemas.edu.pe",
                "Urb. abc", 12.5);
        Alumno a2 = new Alumno(20, "Carlos", "Pelaes", "937200455",
                Date.valueOf("1980-05-11"), "cpelaes@sistemas.edu.pe",
                "Urb. 123", 16.2);
        Alumno a3 = new Alumno(30, "Mario", "Bunge", "979300124",
                Date.valueOf("1986-02-10"), "mbunge@sistemas.edu.pe",
                "Urb. xyz", 15.2);
        Alumno a4 = new Alumno(40, "Ricardo", "Linares", "931555824",
                Date.valueOf("1980-08-05"), "jtorres@sistemas.edu.pe",
                "Urb. 789", 14.4);
        alumnoServicio.agregar(a1);
        alumnoServicio.agregar(a2);
        alumnoServicio.agregar(a3);
        alumnoServicio.agregar(a4);

        return "testindex";
    }

    @RequestMapping("/mostrar")
    public String mostarAlumnos() {
        System.out.println("Alumnos en DB:");

        for (Alumno x : alumnoServicio.listarTodos()) {
            System.out.println(x.toString());
        }

        return "testindex";
    }

    @GetMapping(value = {"/", "/index"})
    public String listarAlumnos(Model model, Authentication authResult) {
        Iterable<Alumno> listadoAlumnos = alumnoServicio.listarTodos();

        model.addAttribute("modeloAlumnos", listadoAlumnos);

        String role = authResult.getAuthorities().toString();
        if (role.contains("DIRECTOR")) {
            model.addAttribute("privilegio", "director");
        } else {
            model.addAttribute("privilegio", "alumno");
        }

        return "alumno/alumnoIndex";
    }

    @GetMapping(value = "/nuevo")
    public String mostrarAlumnoFormNuevo(Alumno alumno) {
        return "alumno/alumnoFormNuevo";
    }

    @PostMapping(value = "/nuevo")
    public String procesarAlumnoFormNuevo(
            @Valid @ModelAttribute("alumno") Alumno alumno,
            BindingResult bindingResult,
            Model model) {

        if (bindingResult.hasErrors()) {
            // Corregir errores
            return "alumno/alumnoFormNuevo";
        }
        // Si llegamos hasta aqu� es que no hubo errores
        alumnoServicio.agregar(alumno);

        return "redirect:index";
    }

    @RequestMapping(value = "/editar")
    public String editarAlumnoForm(@RequestParam long id, Model model) {
        model.addAttribute("alumno", alumnoServicio.buscar(id));
        return "alumno/alumnoEditar";
    }

    @PostMapping(value = "/editar")
    public String editarAlumnoForm(@Valid @ModelAttribute("alumno") Alumno alumno, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            // Corregir errores
            return "alumno/alumnoEditar";
        }
        alumnoServicio.actualizar(alumno);
        return "redirect:index";
    }

    @RequestMapping(value = "/eliminar")
    public String editarAlumnoForm(@RequestParam long id) {
        alumnoServicio.eliminar(id);
        return "redirect:index";
    }
}
