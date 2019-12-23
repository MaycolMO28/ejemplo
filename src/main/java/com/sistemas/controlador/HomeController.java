package com.sistemas.controlador;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String loginPage(@RequestParam(value = "error", required = false) String error,
                            @RequestParam(value = "logout", required = false) String logout, Model model, Authentication authResult) {

        if (error != null) {
            model.addAttribute("error", "Usuario y contraseña incorrecta");
        }

        if (logout != null) {
            model.addAttribute("logout", "Sesión cerrada");
        }
        try {
            String role = authResult.getAuthorities().toString();
            if (role.contains("ALUMNO") || role.contains("DIRECTOR")) {
                return "redirect:success";
            }
        } catch (NullPointerException ignored) {

        }
        return "login";
    }

    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String redirectLogin(Authentication authResult) {
        String role = authResult.getAuthorities().toString();
        if (role.contains("DIRECTOR")) {
            return "redirect:/adminPanel";
        } else if (role.contains("ALUMNO")) {
            return "redirect:/userPanel";
        } else {
            return "redirect:/";
        }
    }

    @RequestMapping(value = "/adminPanel", method = RequestMethod.GET)
    public String adminPanel() {
        return "adminIndex";
    }

    @RequestMapping(value = "/userPanel", method = RequestMethod.GET)
    public String userPanel() {
        return "usuarioIndex";
    }


}
