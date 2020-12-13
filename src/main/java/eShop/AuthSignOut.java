package eShop;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/auth/signout")
public class AuthSignOut extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("/marketplace/auth.jsp");
        return;
    };
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request,response);
    }
}
