package itu.pronote.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClasseEtudiantModel {
    int id_classe;
    String nom_classe;

    public int getId_classe() {
        return id_classe;
    }
    public void setId_classe(int id_classe) {
        this.id_classe = id_classe;
    }
    public String getNom_classe() {
        return nom_classe;
    }
    public void setNom_classe(String nom_classe) {
        this.nom_classe = nom_classe;
    }

    public ClasseEtudiantModel(int id_classe, String nom_classe) {
        this.id_classe = id_classe;
        this.nom_classe = nom_classe;
    }
    public ClasseEtudiantModel() {
    }


    public ClasseEtudiantModel[] getAllClasse() throws CustomException 
    {
        List<ClasseEtudiantModel> list_classe = new ArrayList<>();
        Conn c = new Conn();
        Connection conn = c.getConnex();
        try 
        {
            Statement stmnt = conn.createStatement();
            ResultSet result = stmnt.executeQuery("SELECT * FROM classe");

            while (result.next()) {
                int id_classe = result.getInt(1);
                String nom_classe = result.getString(2);

                ClasseEtudiantModel classe = new ClasseEtudiantModel(id_classe, nom_classe);
                list_classe.add(classe);
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            throw new CustomException("erreur select classe");
        }
        finally{
            try {
                conn.close();
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        }

        return list_classe.toArray(new ClasseEtudiantModel[list_classe.size()]);   
    }
    
    
    
}
