<%-- 
    Document   : officesAll
    Created on : 12.04.2016, 21:03:25
    Author     : Alexander Savelev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/res/css/bootstrap.css" />" >
        <link rel="stylesheet" href="<c:url value="/res/css/bootstrap-theme.css" />" >
        <link rel="stylesheet" href="<c:url value="/res/css/styles.css" />" >
        <title><c:out value="${title}" /></title>
    </head>

    <body>
        <div class="wrapper">
            <div class="container-fluid content">
                <%@include file="../../modules/header.jspf" %>

                <br>

                <div class="row">

                    <%@include file="../../modules/sideMenu/sideMenu_offices.jspf" %> 

                    <br><br>

                    <div class="col-md-10">
                        <div class="panel panel-primary panel-primary-dark">
                            <div class="panel-heading panel-heading-dark" align="center">Офисы</div>
                            <div class="panel-body">
                                <table id="officesTable" class="table table-hover table-condensed">

                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Название</th>
                                            <th>Юр. лицо</th>
                                            <th>E-mail</th>
                                            <th>Телефон</th>
                                            <th>Адрес</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${alloffices}" var="office" varStatus="idx">
                                            <tr>
                                                <td>${idx.count}</td>
                                                <td>
                                                    <a href="<c:url value="/office?id=${office.id}" />">
                                                        <c:out value="${office.name}" />
                                                    </a>
                                                </td>
                                                <td><c:out value="${office.organisation.name}" /></td>
                                                <td>
                                                    <span class="glyphicon glyphicon-envelope"></span> 
                                                    <a href="mailto:<c:out value="${office.email}" />">
                                                        <c:out value="${office.email}" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <span class="glyphicon glyphicon-phone-alt"></span> 
                                                    <c:out value="${office.phone}" />
                                                </td>
                                                <td><c:out value="${office.address}" /></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <br>

                                <span class="glyphicon glyphicon-cog"></span>
                                <a href="<c:url value="/admin/offices" />" > Управление офисами </a>
                                &nbsp;
                                <span class="glyphicon glyphicon-print"></span>
                                <a href="<c:url value='/offices?mode=print' />" target="_blank">Распечатать</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../../modules/footer.jspf" %>

        </div>

    <link rel="stylesheet" href="<c:url value="/res/css/jquery.dataTables.css" />" >
    <script type="text/javascript">
        $(document).ready(function () {
            $("#officesTable").DataTable();
        });
    </script>

</body>
</html>