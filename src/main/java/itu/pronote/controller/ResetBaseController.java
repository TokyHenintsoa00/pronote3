package itu.pronote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import itu.pronote.model.ResetDatabase;

@Controller
public class ResetBaseController {
    
    @RequestMapping("/reset")
    public String resetDatabase(Model model)
    {
        ResetDatabase reset = new ResetDatabase();
        reset.reset();
        return "home/home";
    }
}
