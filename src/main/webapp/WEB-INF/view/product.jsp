<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<!-- 1像素透明 = R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7 -->
<c:set var="space" value="data:image/jpeg;base64, R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" />
<html>
    <head>
        <!-- Head -->
        <%@include file="include/header.jspf"  %>
        <style>
            img {
                transition: -webkit-transform 0.25s ease;
            }
            img:active {
                -webkit-transform: scale(5);
            }
        </style>
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#image').val(e.target.result);
                        $('#previewImage').attr('src', e.target.result);
                        $('#previewImage').attr('width', 100);
                    }
                    reader.readAsDataURL(input.files[0]); // convert to base64 string
                }
            }
            $(document).ready(function () {
                $("#myfile").change(function () {
                    readURL(this);
                });
            });
        </script>
    </head>
    <body style="padding: 10px">

        <div id="layout">
            <!-- Toggle -->
            <%@include file="include/toggle.jspf"  %>

            <!-- Menu -->
            <%@include file="include/menu.jspf"  %>

            <div id="main">
                
                <div class="header">
                    <h1>Product</h1>
                    <h2>CRUD</h2>
                </div>
                
                <table class="pure-table" style="border: none">
                    <td valign="top">
                        <!-- 表單 -->
                        <form:form class="pure-form"
                                   modelAttribute="product"
                                   method="post"
                                   action="${pageContext.request.contextPath}/mvc/psi/product">
                            <fieldset>
                                <legend>Product Form</legend>
                                <form:input path="id" readonly="true" /><p />
                                商品名稱 : <br />
                                <form:input path="name" /><p />
                                商品圖片 : <br />
                                <form:input path="image" readonly="true" /><p />
                                <input type="file" id="myfile" name="myfile" /><p />
                                <img style="cursor: zoom-in" id="previewImage" src="${ product.image==null?space:product.image }" width="${ product.image==null?'0':'100' }" /><p />
                                <button type="submit" class="pure-button pure-button-primary">Submit</button>
                            </fieldset>
                            
                        </form:form>
                    </td>
                    <td valign="top">
                        <!-- 資料列表 -->
                        <form class="pure-form">
                            <fieldset>
                                <legend>Product list</legend>
                                <table class="pure-table pure-table-bordered" width="100%">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="p" items="${ products }">
                                            <tr>
                                                <td>${ p.id }</td>
                                                <td>${ p.name }</td>
                                                <td><img style="cursor: zoom-in" id="previewImage" src="${ p.image==null?space:p.image }" width="${ p.image==null?'0':'100' }" /></td>
                                                <td><a href="${pageContext.request.contextPath}/mvc/psi/product/${ p.id }">Update</a></td>
                                                <td><a href="${pageContext.request.contextPath}/mvc/psi/product/delete/${ p.id }">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table> 
                            </fieldset>
                        </form>
                    </td>
                </table>
                
                
                
            </div>
        </div>
        <!-- Foot -->
        <%@include file="include/footer.jspf"  %>
    </body>
</html>