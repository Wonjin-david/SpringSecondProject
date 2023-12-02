<%--
  Created by IntelliJ IDEA.
  User: 87062
  Date: 2023-11-28
  Time: 오후 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit Form</h1>
<form method="post" action="../editok" commandName="boardVO">
    <input type="hidden" name="seq" value=${u.seq} />
    <table id="edit">
        <tr><td>Title: </td><td><input type="text" name="title" value=${u.title} /></td></tr>
        <tr><td>Writer: </td><td><input type="text" name="writer" value=${u.writer} /></td></tr>
        <tr><td>Content: </td><td><textarea cols="50" rows="5" name="content">${u.content}</textarea></td></tr>
        <tr><td>
            <label for="category">Category: </label>
            <select id="category" name="category" value=${u.category}>
                <option value="일반공지">일반공지</option>
                <option value="학부공지">학부공지</option>
                <option value="RC공지">RC공지</option>
            </select>

            <script>

                const selectCategory = document.getElementById('category');
                const selectedCategoryElement = document.getElementById('selectedCategory');

                selectCategory.addEventListener('change', function() {
                    selectedCategoryElement.textContent = selectCategory.value;
                });
            </script>

            <br><br>
        </td></tr>

    </table>
    <input type="submit" value="수정하기"/>
    <input type="button" value="취소하기" onclick="history.back()">
</form>

</body>
</html>
