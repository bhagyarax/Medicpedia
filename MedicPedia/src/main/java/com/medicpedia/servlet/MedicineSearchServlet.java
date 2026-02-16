package com.medicpedia.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medicpedia.model.Medicine;
import com.medicpedia.util.DBConnection;

@WebServlet("/searchMedicine")
public class MedicineSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("medicineName");
        List<Medicine> medicineList = new ArrayList<>();
        String errorMessage = null;

        if (query == null || query.trim().isEmpty()) {
            errorMessage = "Please enter a medicine name.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("results.jsp").forward(request, response);
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            if (con == null) {
                errorMessage = "Database connection failed.";
            } else {
                String sql = "SELECT * FROM medicines WHERE name LIKE ? OR uses LIKE ?";
                try (PreparedStatement pst = con.prepareStatement(sql)) {
                    String searchPattern = "%" + query.trim() + "%";
                    pst.setString(1, searchPattern);
                    pst.setString(2, searchPattern);

                    try (ResultSet rs = pst.executeQuery()) {
                        while (rs.next()) {
                            Medicine med = new Medicine(
                            		rs.getInt("medicine_id"),
                                rs.getString("name"),
                                rs.getString("image_path"),
                                rs.getString("uses"),
                                rs.getString("side_effects"),
                                rs.getString("precautions"),
                                rs.getInt("min_age"),
                                rs.getInt("max_age"),
                                rs.getBoolean("pregnancy_warning"),
                                rs.getString("risk_level")
                            );
                            medicineList.add(med);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "An error occurred while searching: " + e.getMessage();
        }

        request.setAttribute("searchQuery", query);
        request.setAttribute("medicineList", medicineList);
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
        }

        request.getRequestDispatcher("results.jsp").forward(request, response);
    }
}
