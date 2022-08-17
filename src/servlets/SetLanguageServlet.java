package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/setlang")
public class SetLanguageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String lang = request.getParameter("lang");

        if (lang != null && (lang.equals("eng") || lang.equals("rus") || lang.equals("kaz"))) {
            Cookie cookie = new Cookie("yazyk", lang);
            cookie.setMaxAge(3600*24*30);
            response.addCookie(cookie);
        }

        response.sendRedirect("/");

    }
}
