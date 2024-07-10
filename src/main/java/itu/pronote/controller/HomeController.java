package itu.pronote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import itu.pronote.model.*;

@Controller
public class HomeController {
    
    @RequestMapping("/")
    public String viewIndex(Model model) throws CustomException
    {
        ClasseEtudiantModel classe = new ClasseEtudiantModel();
        ClasseEtudiantModel[] getAllClasse = classe.getAllClasse();
        
        model.addAttribute("classe", getAllClasse);

        return "home/home";
    }

    @GetMapping("/getClasseById")
    public String viewRangEtudiant(@RequestParam("id_classe") int id_classe,Model model) throws CustomException
    {
        NoteEtudiantModel note = new NoteEtudiantModel();
        NoteEtudiantModel[] getrangById = note.getViewV_V_RangEtudiantWhere(id_classe);

        model.addAttribute("rangEtudiant", getrangById);
        return "home/rangEleve";
    }

    @GetMapping("/getEtudiantById")
    public String viewNoteEtudiant(@RequestParam("id_etudiant")int id_etudiant,Model model) throws CustomException
    {
        NoteEtudiantModel note = new NoteEtudiantModel();
        NoteEtudiantModel[] getMatiereEtudiant = note.getViewNoteEtudiant(id_etudiant);

        model.addAttribute("noteEtudiant", getMatiereEtudiant);
        return "home/noteEtudiant";
    }

}
