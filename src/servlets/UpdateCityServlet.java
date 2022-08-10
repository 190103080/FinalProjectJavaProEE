package servlets;

import db.DBUtil;
import db.City;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/updatecity")
public class UpdateCityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String redirect = "/";

        String name = request.getParameter("city_name");
        String code = request.getParameter("city_code");
        Long id = Long.parseLong(request.getParameter("city_id"));

        City city = DBUtil.getCity(id);

                if (city != null) {
                    city.setName(name);
                    city.setCode(code);

                    DBUtil.updateCity(city);
                    redirect = "/editcity?id="+id+"&success";

                }

        response.sendRedirect(redirect);

    }

}
