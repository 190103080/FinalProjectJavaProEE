package servlets;

import db.City;
import db.DBUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addcity")
public class AddCityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("city_name");
        String code = request.getParameter("city_code");

        City cities = new City();
        cities.setName(name);
        cities.setCode(code);

        DBUtil.addCities(cities);

        response.sendRedirect("/cities?success");
    }
}
