package eShop;

import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext ctx = servletContextEvent.getServletContext();

        String url = ctx.getInitParameter("DBURL");
        String u = ctx.getInitParameter("DBUSER");
        String p = ctx.getInitParameter("DBPWD");
        try {
            DBConnectionManager dbManager;
            dbManager = new DBConnectionManager(url, u, p);
            ctx.setAttribute("DBManager", dbManager);    
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }    
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        ServletContext ctx = servletContextEvent.getServletContext();
        DBConnectionManager dbManager = (DBConnectionManager) ctx.getAttribute("DBManager");
        try {
            dbManager.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	System.out.println("Database connection closed for Application.");
    	
    }
	
}