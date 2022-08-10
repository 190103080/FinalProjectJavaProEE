package servlets;

import db.DBUtil;
import db.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/update")
public class UpdateStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String redirect = "/";

        String name = request.getParameter("student_name");
        String surname = request.getParameter("student_surname");
        String birthdate = request.getParameter("student_birthdate");
//        String city = request.getParameter("student_city");
        Long id = Long.parseLong(request.getParameter("student_id"));

        Student student = DBUtil.getStudent(id);

                if (student != null) {
                    student.setName(name);
                    student.setSurname(surname);
                    student.setBirthdate(birthdate);
                    //student.setCity(city);

                    DBUtil.updateStudent(student);
                    redirect = "/editstudent?id="+id+"&success";

                }

        response.sendRedirect(redirect);

    }

}
