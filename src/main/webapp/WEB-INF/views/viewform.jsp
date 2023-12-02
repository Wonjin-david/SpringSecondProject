<%--
  Created by IntelliJ IDEA.
  User: 87062
  Date: 2023-12-02
  Time: 오전 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input type="hidden" name="seq" value=${u.seq}/>
<table>
    <tr><td>Title:</td><td><input type="text" name="title" value=${u.title} /></td></tr>
    <tr><td>Writer:</td><td><input type="text" name="writer" value=${u.writer} /></td></tr>
    <tr><td>Content:</td><td><textarea cols="50" rows="5" name="content">${u.content}</textarea></td></tr>
    <tr><td>Category:</td><td><input type="text" name="category" value=${u.category} /></td></tr>
</table>
<input type="button" value="Back" onclick="history.back()"/></td></tr>
</body>
</html>
