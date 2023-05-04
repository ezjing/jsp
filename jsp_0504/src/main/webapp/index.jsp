<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>

<br><hr><br>

<div class="container my-4">
    <ul>
        <li><a href="ImplicitObjMain.jsp" class="btn btn-link">ImplicitObjMain 예제</a></li>
        <li><a href="FormSubmit.jsp" class="btn btn-link">FormSubmit 예제</a></li>
        <li><a href="ObjectParams.jsp" class="btn btn-link">ObjectParams 예제</a></li>
        <li><a href="OtherImplicitObj.jsp" class="btn btn-link">OtherImplicitObj 예제</a></li>
        <li><a href="CollectionUse.jsp" class="btn btn-link">CollectionUse 예제</a></li>
        <li><a href="Operator1.jsp" class="btn btn-link">Operator1 예제</a></li>
        <li><a href="Operator2.jsp" class="btn btn-link">Operator2 예제</a></li>
        <li><a href="ELCallMethod.jsp" class="btn btn-link">ELCallMethod 예제</a></li>
        <li><a href="TestJSUL.jsp" class="btn btn-link">TestJSUL 예제</a></li>
        <li><a href="Set1.jsp" class="btn btn-link">Set1 예제</a></li>
        <li><a href="Set2.jsp" class="btn btn-link">Set2 예제</a></li>
    </ul>

</div>

</body>
</html>