package eShop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.LinkedList;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/index.html")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private LinkedList<Apparel> getRecommendations(Statement stmt, HttpSession session) throws SQLException {
        LinkedList<Apparel> apparels = new LinkedList<>();
        String gender = (String) session.getAttribute("gender");
        String sql = "SELECT * FROM products WHERE gender='" + gender
                + "' ORDER BY rand()";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next())
            apparels.add(new Apparel(rs.getInt("product_id"), rs.getString("name"), rs.getString("gender"),
                    rs.getInt("cost"), rs.getInt("discount"), rs.getDate("added_on")));
        return apparels;
    }

    private LinkedList<Apparel> getApparels(Statement stmt, HttpSession session) throws SQLException {
        LinkedList<Apparel> apparels = new LinkedList<>();
        String gender = (String) session.getAttribute("gender");
        String preference = (String) session.getAttribute("preference");
        String condition = "";
        if(preference.equals("D"))
            condition = "and discount>0";
        else{
            Date today = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            condition = "and added_on>'" + df.format(new Date(today.getTime() - 604800000)) + "'";
        }
        String sql = "SELECT * FROM products WHERE gender='" + gender
                + "' " + condition + " ORDER BY rand()";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next())
            apparels.add(new Apparel(rs.getInt("product_id"), rs.getString("name"), rs.getString("gender"),
                    rs.getInt("cost"), rs.getInt("discount"), rs.getDate("added_on")));
        return apparels;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ServletContext context = getServletContext();
        DBConnectionManager dbManager = (DBConnectionManager) context.getAttribute("DBManager");
        Connection conn = dbManager.getConnection();
        
        try {
            Statement stmt = conn.createStatement();
            request.setAttribute("recommendations", getRecommendations(stmt, request.getSession()));
            request.setAttribute("results", getApparels(stmt, request.getSession()));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
