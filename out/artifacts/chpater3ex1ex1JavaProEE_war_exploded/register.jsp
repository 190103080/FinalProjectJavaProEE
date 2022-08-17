<%@ page import="db.LanguageUtil" %>
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
  <%--  <%@include file="head.jsp"%>--%>
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

<%--<%@include file="header.jsp"%>--%>

<div class="container" style="min-height: 500px;">

  <div class="row mt-3">

    <div class="col-6 mx-auto">

      <%

        String emailError = request.getParameter("emailerror");

        if(emailError!=null){

      %>

      <div class="alert alert-danger alert-dismissible fade show" role="alert">

        Email is busy!

        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

      </div>

      <%

        }

      %>

      <%

        String passwordError = request.getParameter("passworderror");

        if(passwordError!=null){

      %>

      <div class="alert alert-danger alert-dismissible fade show" role="alert">

        Passwords are not same!

        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

      </div>

      <%

        }

      %>

      <%

        String success = request.getParameter("success");

        if(success!=null){

      %>

      <div class="alert alert-success alert-dismissible fade show" role="alert">

        User added successfully!

        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

      </div>

      <%

        }

      %>

      <form action="/register" method="post">

        <div class="row">

          <div class="col-12">

            <label>EMAIL</label>

          </div>

        </div>

        <div class="row mt-2">

          <div class="col-12">

            <input type="email" class="form-control" required placeholder="Email" name="email">

          </div>

        </div>

        <div class="row mt-3">

          <div class="col-12">

            <label>PASSWORD</label>

          </div>

        </div>

        <div class="row mt-2">

          <div class="col-12">

            <input type="password" class="form-control" required placeholder="Password" name="password">

          </div>

        </div>

        <div class="row mt-3">

          <div class="col-12">

            <label>REPEAT PASSWORD</label>

          </div>

        </div>

        <div class="row mt-2">

          <div class="col-12">

            <input type="password" class="form-control" required placeholder="Repeat password" name="re_password">

          </div>

        </div>

        <div class="row mt-3">

          <div class="col-12">

            <label>FULL NAME</label>

          </div>

        </div>

        <div class="row mt-2">

          <div class="col-12">

            <input type="text" class="form-control" required placeholder="Full name" name="full_name">

          </div>

        </div>

        <div class="row mt-3">

          <div class="col-12">

            <button class="btn btn-success">SIGN UP</button>

          </div>

        </div>

      </form>

    </div>

  </div>

</div>

<%--<%@include file="footer.jsp"%>--%>

</body>

<%--<%@include file="foot.jsp"%>--%>

</html>
