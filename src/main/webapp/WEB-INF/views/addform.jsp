<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>

<form action="addok" method="post">
    <table id="edit">
        <tr><td>Title: </td><td><input type="text" name="title"/></td></tr>
        <tr><td>Writer: </td><td><input type="text" name="writer"/></td></tr>
        <tr><td>Content: </td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>
<%--        <tr><td>Image: </td><td><input type="file" name="img"/></td></tr>--%>
        <tr><td>
            <label for="category">Category: </label>
            <select id="category" name="category">
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
<%--        <tr><td><a href="list">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>--%>
    </table>
    <button type="button" onclick="location.href='list'">목록보기</button>
    <button type="submit">등록하기</button>
</form>

</body>
</html>