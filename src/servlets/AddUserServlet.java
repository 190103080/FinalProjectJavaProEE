package servlets;

import db.DBUtil;
import db.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/register")
public class AddUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String redirect = "/register?emailerror";
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("re_password");
        String fullName = request.getParameter("full_name");
        User checkUser = DBUtil.getUser(email);
        if (checkUser == null) {
            redirect = "/register?passworderror";
            if (password.equals(rePassword)) {
                User user = new User();
                user.setEmail(email);
                user.setPassword(password);
                user.setFullName(fullName);
                if (DBUtil.addUser(user)) {
                    redirect = "/register?success";
                }
            }
        }
        response.sendRedirect(redirect);
    }
}
