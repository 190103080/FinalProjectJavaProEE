package servlets;

import db.City;
import db.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/cities")
public class CitiesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        ArrayList<City> cities = DBUtil.getAllCities();

        request.setAttribute("qalalar", cities);
        request.getRequestDispatcher("/cities.jsp").forward(request, response);

    }

}
