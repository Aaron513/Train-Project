package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/TicketSellingAnalysisServlet")
public class TicketSellingAnalysisServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter pw = response.getWriter();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = com.utility.DBConnection.getCon();
            ps = con.prepareStatement("SELECT tr_name, COUNT(*) AS ticket_count FROM ticket2 GROUP BY tr_name");
            rs = ps.executeQuery();

            // Start building JSON
            StringBuilder jsonBuilder = new StringBuilder();
            jsonBuilder.append("{");
            jsonBuilder.append("\"trainData\": [");

            boolean first = true;
            while (rs.next()) {
                if (!first) {
                    jsonBuilder.append(",");
                }
                jsonBuilder.append("{");
                jsonBuilder.append("\"trainName\": \"" + rs.getString("tr_name") + "\",");
                jsonBuilder.append("\"ticketCount\": " + rs.getInt("ticket_count"));
                jsonBuilder.append("}");
                first = false;
            }

            jsonBuilder.append("]");
            jsonBuilder.append("}");

            pw.write(jsonBuilder.toString());
        } catch (Exception e) {
            e.printStackTrace();
            pw.write("{\"error\": \"An error occurred while fetching data.\"}");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}