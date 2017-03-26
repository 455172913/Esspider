<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
Hello upload
<form action="/admin/settle/deposit/imgUpload" method="post" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit">
</form>
</body>
</html>