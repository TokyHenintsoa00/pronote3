package itu.pronote.model;

import java.sql.*;

public class ResetDatabase {
    
     private static final String URL = "jdbc:postgresql://localhost:5432/pronote";
    private static final String USER = "postgres";
    private static final String PASSWORD = "root";

    public static void reset() {
        // Utilisation de try-with-resources pour la gestion automatique des ressources
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement selectStmt = conn.createStatement();
             ResultSet rs = selectStmt.executeQuery("SELECT tablename FROM pg_tables WHERE schemaname = 'public'")) {

            while (rs.next()) {
                String tableName = rs.getString("tablename");

                // Ignorer la table 'admin'
                if ("admin".equals(tableName)) {
                    continue;
                }

                System.out.println("Processing table: " + tableName);

                // Utiliser un autre Statement pour les opérations d'update
                try (Statement updateStmt = conn.createStatement()) {
                    // Désactiver les triggers avant de tronquer la table
                    updateStmt.executeUpdate("ALTER TABLE " + tableName + " DISABLE TRIGGER ALL");
                    System.out.println("Triggers disabled for table: " + tableName);

                    // Tronquer la table
                    updateStmt.executeUpdate("TRUNCATE TABLE " + tableName + " CASCADE");
                    System.out.println("Table truncated: " + tableName);

                    // Réactiver les triggers après avoir tronqué la table
                    updateStmt.executeUpdate("ALTER TABLE " + tableName + " ENABLE TRIGGER ALL");
                    System.out.println("Triggers enabled for table: " + tableName);
                } catch (SQLException e) {
                    System.err.println("Error processing table: " + tableName);
                    e.printStackTrace();
                }
            }

            // Réinitialiser les séquences
            try (ResultSet rsSequences = selectStmt.executeQuery("SELECT sequence_name FROM information_schema.sequences WHERE sequence_schema = 'public'")) {
                while (rsSequences.next()) {
                    String sequenceName = rsSequences.getString("sequence_name");
                    System.out.println("Resetting sequence: " + sequenceName);

                    try (Statement updateStmt = conn.createStatement()) {
                        updateStmt.executeUpdate("ALTER SEQUENCE " + sequenceName + " RESTART WITH 1");
                        System.out.println("Sequence " + sequenceName + " reset to 1");
                    } catch (SQLException e) {
                        System.err.println("Error resetting sequence: " + sequenceName);
                        e.printStackTrace();
                    }
                }
            }

            System.out.println("La base de données a été réinitialisée avec succès.");
        } catch (SQLException e) {
            System.err.println("Database reset failed.");
            e.printStackTrace();
        }
    }

}
