package eShop;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/auth/signin")
public class AuthSignIn extends HttpServlet {
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
            String password = request.getParameter("password");
            Integer hashcode = password.hashCode();
            Statement stmt;
            try {
                stmt = conn.createStatement();
                String sql = "SELECT gender, preference FROM users WHERE username = '" + username + "' and hash=" + Integer.toString(hashcode);
                ResultSet rs = stmt.executeQuery(sql);
                int count = 0;
                String gender = "";
                String preference = "";
                while (rs.next()){
                    gender = rs.getString("gender");
                    preference = rs.getString("preference");
                    count++;
                }
                if(count==1){
                    session.setAttribute("userid", username);
                    session.setAttribute("gender", gender);
                    session.setAttribute("preference", preference);
                    response.sendRedirect("/marketplace");
                }
                else{
                    response.sendRedirect("/marketplace/auth.jsp?err=Unable%20to%20Login");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }            
        }        
    }
}