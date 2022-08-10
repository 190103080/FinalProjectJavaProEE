package servlets;

import db.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/deletecity")
public class DeleteCityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        Long id = Long.parseLong(request.getParameter("city_id"));
        DBUtil.deleteCity(id);

        response.sendRedirect("/cities");

    }

}
