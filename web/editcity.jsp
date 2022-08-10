<%@ page import="java.util.ArrayList" %>
<%@ page import="db.City" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 26.07.2022
  Time: 16:23
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
                <a class="nav-link" aria-current="page" href="/cities">CITIES</a>
              </div>
            </div>
          </div>
        </nav>
      </div>
      <div class="container">
        <div class="row mt-3">
          <div class="col-6 mx-auto">
              <%
                  City city = (City)request.getAttribute("qalalar");

                  if (city != null) {
              %>
            <form action="/updatecity" method="post">
              <input type="hidden" name="city_id" value="<%=city.getId()%>">
              <div class="row mt-3">
                <div class="col-12">
                  <label>
                    <strong>NAME:</strong>
                  </label>
                </div>
                <div class="row mt-3">
                  <div class="col-12">
                    <input name="city_name" type="text" placeholder="Insert name" required value="<%=city.getName()%>"> <br>
                  </div>
                </div>

                <div class="rwo mt-3">
                  <div class="col-12">
                    <label>
                      <strong>CODE:</strong>
                    </label>
                  </div>
                </div>

                <div class="row mt-3">
                  <div class="col-12">
                    <input name="city_code" type="text" placeholder="Insert price" required value="<%=city.getCode()%>"> <br>
                  </div>
                </div>


                  <div class="row mt-3">
                      <div class="col-12">
                          <button class="btn btn-success">SAVE CITY</button>
                          <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteItemModal" >DELETE ITEM</button>
                      </div>
                  </div>
              </div>
            </form>

              <div class="modal fade" id="deleteItemModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <form action="/deletecity" method="post">
                              <input type="hidden" name="city_id" value="<%=city.getId()%>">
                              <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                  Are you sure?
                              </div>
                              <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                                  <button class="btn btn-danger">YES</button>
                              </div>
                          </form>
                      </div>
                  </div>
              </div>

              <%
                  }
              %>
          </div>
        </div>
      </div>
</body>
</html>
