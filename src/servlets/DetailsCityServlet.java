package servlets;

import db.DBUtil;
import db.City;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/detailscity")
public class DetailsCityServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        Long id = Long.parseLong(request.getParameter("id"));
        City city = DBUtil.getCity(id);

        request.setAttribute("qalalar", city);
        request.getRequestDispatcher("/detailscity.jsp").forward(request, response);

    }

}
