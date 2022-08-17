<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Student" %>
<%@ page import="db.City" %>
<%@ page import="db.LanguageUtil" %>
<%@ page import="db.User" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 26.07.2022
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
      <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"></script>
          <title>Title</title>
      </head>
      <body>

      <%
        User currentUser = (User) session.getAttribute("authUser");
      %>

      <%
        String currentLanguages = "eng";

        Cookie cookies[] = request.getCookies();
        if (cookies != null) {
          for (Cookie c : cookies) {
            if (c.getName() .equals("yazyk")) {
              currentLanguages = c.getValue();
              break;
            }
          }
        }

      %>

      <%
        String name = (String) request.getAttribute("name");
        String surname=  (String) request.getAttribute("surname");
        String allStudents = (String) request.getAttribute("allStudents");
        String citiess = (String) request.getAttribute("cities");
        String birthdate = (String) request.getAttribute("birthdate");
        String city = (String) request.getAttribute("city");
        String addStudent = (String) request.getAttribute("addStudent");
      %>

            <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #004000">
              <div class="container-fluid">
                <a class="navbar-brand" >BITLAB PORTAL</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div class="navbar-nav">
                    <a class="nav-link" aria-current="page" href="/index"><%=LanguageUtil.getTranslationLabelAndLanguages("allStudents", currentLanguages)%></a>
                    <a class="nav-link" href="/cities"><%=LanguageUtil.getTranslationLabelAndLanguages("citiess", currentLanguages)%></a>
                    <a class="nav-link" href="/register"><%=LanguageUtil.getTranslationLabelAndLanguages("register", currentLanguages)%></a>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <%=LanguageUtil.getTranslationLabelAndLanguages("languages", currentLanguages)%>
                      </a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/setlang?lang=eng">ENG</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/setlang?lang=kaz">KAZ</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/setlang?lang=rus">RUS</a></li>
                      </ul>
                    </li>

                    <%
                        if (currentUser != null) {
                    %>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownProfile" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          <%=currentUser.getFullName()%>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownProfile">
                          <li><a class="dropdown-item" href="/profile">EDIT PROFILE</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item" href="/logout">LOGOUT</a></li>
                        </ul>
                      </li>
                    <%
                      } else {
                    %>
                      <li class="nav-item">
                        <a class="nav-link" href="/login">Sign In</a>
                      </li>
                    <%
                      }
                    %>


                  </div>
                </div>
              </div>
            </nav>

          <div class="container mt-5">

            <%
              if (currentUser != null) {
            %>
            <form action="/add" method="post">

              <!-- Button trigger modal -->
              <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                + <%=LanguageUtil.getTranslationLabelAndLanguages("addStudent", currentLanguages)%>
              </button>

              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel"><%=LanguageUtil.getTranslationLabelAndLanguages("addNewStudent", currentLanguages)%></h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <div class="container">
                        <div class="row mt-3">
                          <div class="col-6 mx-auto">
                              <div class="row mt-3">
                                <div class="col-12">
                                  <label>
                                    <%=LanguageUtil.getTranslationLabelAndLanguages("name", currentLanguages)%>
                                  </label>
                                </div>

                                <div class="row mt-3">
                                  <div class="col-12">
                                    <input name="student_name" type="text" placeholder="Insert name"> <br>
                                  </div>
                                </div>

                                <div class="rwo mt-3">
                                  <div class="col-12">
                                    <label>
                                      <%=LanguageUtil.getTranslationLabelAndLanguages("surname", currentLanguages)%>
                                    </label>
                                  </div>
                                </div>

                                <div class="row mt-3">
                                  <div class="col-12">
                                    <input name="student_surname" type="text" placeholder="Insert surname"> <br>
                                  </div>
                                </div>

                                <div class="row mt-3">
                                  <div class="col-12">
                                    <label>
                                      <%=LanguageUtil.getTranslationLabelAndLanguages("birthdate", currentLanguages)%>
                                    </label>
                                  </div>
                                </div>

                                <div class="row mt-3">
                                  <div class="col-12">
                                    <input name="student_birthdate" type="date" placeholder="Insert amount"> <br>
                                  </div>
                                </div>

                                <div class="row mt-3">
                                  <div class="col-12">
                                    <label>
                                      <%=LanguageUtil.getTranslationLabelAndLanguages("city", currentLanguages)%>
                                    </label>
                                  </div>
                                </div>

                                <div class="row mt-3">
                                  <div class="col-12">
                                    <select class="form-select" name="city">
                                      <%
                                        ArrayList<City> cities = (ArrayList<City>) request.getAttribute("qalalar");
                                        if(cities != null) {
                                          for (City cts : cities) {
                                      %>
                                          <option value="<%=cts.getId()%>">
                                              <%=cts.getName() + " - " + cts.getCode()%>
                                          </option>
                                      <%
                                          }
                                        }
                                      %>
                                    </select> <br>
                                  </div>
                                </div>
                              </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><%=LanguageUtil.getTranslationLabelAndLanguages("close", currentLanguages)%></button>
                      <button class="btn btn-success"><%=LanguageUtil.getTranslationLabelAndLanguages("addStudent", currentLanguages)%></button>
                    </div>

                  </div>
                </div>
              </div>

            </form>

            <%
              }
            %>

            <table class="table">
              <thead>
              <tr>
                <th scope="col">ID</th>
                <th scope="col"><%=LanguageUtil.getTranslationLabelAndLanguages("name", currentLanguages)%></th>
                <th scope="col"><%=LanguageUtil.getTranslationLabelAndLanguages("surname", currentLanguages)%></th>
                <th scope="col"><%=LanguageUtil.getTranslationLabelAndLanguages("birthdate", currentLanguages)%></th>
                <th scope="col"><%=LanguageUtil.getTranslationLabelAndLanguages("city", currentLanguages)%></th>
              </tr>
              </thead>
              <tbody>
              <%
                ArrayList<Student> students = (ArrayList<Student>) request.getAttribute("oqushylar");
                if (students != null) {
                  for (Student std : students) {
              %>
              <tr>
                <th scope="row"><%=std.getId()%></th>
                <td><%=std.getName()%></td>
                <td><%=std.getSurname()%></td>
                <td><%=std.getBirthdate()%></td>
                <td><%=std.getCity().getName() + " / " + std.getCity().getCode()%></td>
                <%
                  if (currentUser != null) {
                %>
                <td><a href="/details?id=<%=std.getId()%>" class="btn btn-dark btn-sm" style="background-color: black; color: white; text-decoration-line: none"><%=LanguageUtil.getTranslationLabelAndLanguages("details", currentLanguages)%></a></td>
                <%
                  }
                %>
              </tr>
              <%
                  }
                }
              %>
              </tbody>
            </table>
          </div>

      </body>
</html>
