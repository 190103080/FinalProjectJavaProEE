package servlets;

import db.DBUtil;
import db.Student;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/add")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("student_name");
        String surname = request.getParameter("student_surname");
        String birthdate = request.getParameter("student_birthdate");
        String city = request.getParameter("student_city");

        Student student = new Student();
        student.setName(name);
        student.setSurname(surname);
        student.setBirthdate(birthdate);
        student.setCity(city);

        DBUtil.addItem(student);

        response.sendRedirect("/index?success");
    }
}
