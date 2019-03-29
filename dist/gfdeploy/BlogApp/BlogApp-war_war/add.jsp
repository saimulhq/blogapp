<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Blog Tank</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/webpagestyle.css">
    </style>
</head>
<body>
    <nav class="navbar navbar-default navigation-bar">
        <div class="container-fluid">
            <div class="navbar-header">
                <b><a class="navbar-brand" href="/BlogApp-war/" id="navbar-text">Blog Tank</a></b>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="well well-lg form-add">
            <h3>New Post</h3>
            <form name="createNewBlog" action="add_success.jsp" method="post">
                Title: <input name="title" type="text" class="form-control"><br>
                Text: <textarea rows="8" cols="100" name="content" class="form-control"></textarea><br>
                <a href="/BlogApp-war/" class="btn btn-danger">Cancel</a>
                <button type="submit" class="btn btn-success">Create</button><br>
            </form>
        </div>
    </div>
</div>
</body>
</html>
