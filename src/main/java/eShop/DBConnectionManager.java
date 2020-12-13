package eShop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionManager {
    private String dbURL;
    private String user;
    private String password;
    private Connection con;

    public DBConnectionManager(String url, String u, String p) throws ClassNotFoundException {
        this.dbURL = url;
        this.user = u;
        this.password = p;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.con = DriverManager.getConnection(dbURL, user, password);
            System.out.println("Database connection initialized for Application.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return this.con;
    }

    public void closeConnection() throws SQLException {
        this.con.close();
    }
}
