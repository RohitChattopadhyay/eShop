package eShop;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/auth/register")
public class AuthRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("userid") != null)
            response.sendRedirect("/marketplace");
        else {
            ServletContext context = getServletContext();
            DBConnectionManager dbManager = (DBConnectionManager) context.getAttribute("DBManager");
            Connection conn = dbManager.getConnection();

            String username = request.getParameter("username");
            String gender = request.getParameter("gender");
            String preference = request.getParameter("preference");
            String password = request.getParameter("password");
            Integer hashcode = password.hashCode();
            Statement stmt;
            try {
                stmt = conn.createStatement();
                String sql = "INSERT into users (username,hash,gender,preference) values ('" + username + "', " + Integer.toString(hashcode) + ", '" + gender + "', '" + preference + "')";
                stmt.executeUpdate(sql);       
                
                session.setAttribute("userid", username);
                session.setAttribute("gender", gender);
                session.setAttribute("preference", preference);         
                response.sendRedirect("/marketplace");                
            } catch (SQLException e) {
                response.sendRedirect("/marketplace/auth.jsp?err=Registration%20Failed!!&register");
                e.printStackTrace();
            }            
        }        
    }
}
