<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Student" %>
<%@ page import="db.City" %><%--
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

          <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #004000">
              <div class="container-fluid">
                <a class="navbar-brand" href="#">BITLAB SHOP</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div class="navbar-nav">
                    <a class="nav-link" aria-current="page" href="/index">ALL STUDENTS</a>
                    <a class="nav-link" href="/cities">CITIES</a>
                  </div>
                </div>
              </div>
            </nav>
          </div>

          <form action="/addcity" method="post">
                <div class="container">
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    + ADD CITY
                  </button>

                  <!-- Modal -->
                  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="staticBackdropLabel">Add New City</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <label>
                            NAME:
                          </label>
                          <input name="city_name" type="text" placeholder="Insert name"> <br>
                          <label>
                            CODE:
                          </label>
                          <input name="city_code" type="text" placeholder="Insert code"> <br>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button class="btn btn-success">Add New City</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
          </form>

        <form action="/cities" method="get">
          <div class="container">
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">NAME</th>
                    <th scope="col">CODE</th>
                    <th scope="col">DETAILS</th>
                  </tr>
                </thead>
              <tbody>
              <%
                ArrayList<City> cities = (ArrayList<City>) request.getAttribute("qalalar");
                if (cities != null) {
                  for (City cts : cities) {
              %>
              <tr>
                <th scope="row"><%=cts.getId()%></th>
                <td><%=cts.getName()%></td>
                <td><%=cts.getCode()%></td>
                <td><a href="/detailscity?id=<%=cts.getId()%>" class="btn btn-dark btn-sm" style="background-color: black; color: white; text-decoration-line: none">DETAILS</a></td>
              </tr>
              <%
                    }
                }
              %>
              </tbody>
            </table>
          </div>
        </form>
      </body>
</html>
