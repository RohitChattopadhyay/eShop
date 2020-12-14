package eShop;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.LinkedList;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ServletContext context = getServletContext();
        DBConnectionManager dbManager = (DBConnectionManager) context.getAttribute("DBManager");
        Connection conn = dbManager.getConnection();
        String query = request.getParameter("q");
        try {            
            LinkedList<Apparel> result = new LinkedList<>();
            LinkedList<String> search_history = (LinkedList)request.getSession().getAttribute("search-history");
            if(search_history==null)
                search_history = new LinkedList<>();
            search_history.add(query);
            request.getSession().setAttribute("search-history", search_history);
            if(query!=null && query.length()>0){
                Statement stmt = conn.createStatement();
                String sql = "SELECT product_id,name,gender,cost,discount,added_on FROM products WHERE MATCH (name) AGAINST ('" + query + "' IN NATURAL LANGUAGE MODE)";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) 
                    result.add(new Apparel(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getString("gender"),
                        rs.getInt("cost"),
                        rs.getInt("discount"),
                        rs.getDate("added_on")
                    ));
            }
            request.setAttribute("search_result", result);
            request.setCharacterEncoding("UTF-8");
            request.getRequestDispatcher("/search.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }
}
