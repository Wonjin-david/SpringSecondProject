<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="com.example.board.BoardDAO, com.example.board.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>free board</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deleteok/' + id;
        }

        function viewPost(id){
            location.href='viewok/' + id;
        }

        function deleteItem(event, seq) {
            // Stop the propagation of the click event
            event.stopPropagation();

            // Your delete logic here
            delete_ok(seq);
        }
    </script>
</head>
<body>
<h1>자유게시판</h1>
<table id="list" width="90%">
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Writer</th>
        <th>Content</th>
        <th>Category</th>
        <th>Regdate</th>
        <th>Moddate</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="u">
        <tr onclick="viewPost('${u.seq}')">
            <td>${u.seq}</td>
            <td>${u.title}</td>
            <td>${u.writer}</td>
            <td>${u.content}</td>
            <td>${u.category}</td>
            <td>${u.regdate}</td>
            <td>${u.moddate}</td>
            <td><a href="editform/${u.seq}">Edit</a></td>
                <%--		<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>--%>
            <td><a href="javascript:void(0);" onclick="deleteItem(event, '${u.seq}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="addform">Add New Post</a>
</body>
</html>