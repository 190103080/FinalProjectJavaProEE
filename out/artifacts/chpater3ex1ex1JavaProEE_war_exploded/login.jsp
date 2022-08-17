<%@ page import="db.LanguageUtil" %>
<%@ page import="db.City" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 17.08.2022
  Time: 5:32
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

                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row mt-3">
            <div class="col-6 mx-auto">
                <%
                    String error = request.getParameter("error");
                    if (error != null) {
                %>

                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Incorrect email or password!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <%
                    }
                %>

    <form action="/login" method="post">

<%--        <!-- Button trigger modal -->--%>
<%--        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
<%--            + <%=LanguageUtil.getTranslationLabelAndLanguages("addStudent", currentLanguages)%>--%>
<%--        </button>--%>

<%--        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <h5 class="modal-title" id="exampleModalLabel"><%=LanguageUtil.getTranslationLabelAndLanguages("addNewStudent", currentLanguages)%></h5>--%>
<%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--                        <div class="container">--%>
                            <div class="row mt-3">
                                <div class="col-6 mx-auto">
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <label>
<%--                                                <%=LanguageUtil.getTranslationLabelAndLanguages("name", currentLanguages)%>--%>
                                                EMAIL:
                                            </label>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <input name="email" type="email" placeholder="Insert name"> <br>
                                            </div>
                                        </div>

                                        <div class="rwo mt-3">
                                            <div class="col-12">
                                                <label>
<%--                                                    <%=LanguageUtil.getTranslationLabelAndLanguages("surname", currentLanguages)%>--%>
                                                    PASSWORD:
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <input name="password" type="password" placeholder="Insert surname"> <br>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

<%--                    <div class="modal-footer">--%>
<%--&lt;%&ndash;                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><%=LanguageUtil.getTranslationLabelAndLanguages("close", currentLanguages)%></button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <button class="btn btn-success"><%=LanguageUtil.getTranslationLabelAndLanguages("addStudent", currentLanguages)%></button>&ndash;%&gt;--%>
<%--                    </div>--%>

                        <div class="row mt-4">
                            <div class="col-12">
                                <button class="btn btn-success">Sign In</button>
                            </div>
                        </div>

                </div>
            </div>
        </div>

    </form>

</body>
</html>
