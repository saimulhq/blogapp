<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.blogapp.entities.Blogs"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.blogapp.BlogAppRemote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Tank</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/webpagestyle.css">
    </head>
    <body>
        <%
            BlogAppRemote blogAppRemote = null;

            try {
                Context context = new InitialContext();
                blogAppRemote = (BlogAppRemote) context.lookup(BlogAppRemote.class.getName());

            } catch (Exception e) {
                e.printStackTrace();
            }
            String id = request.getParameter("id");
            int result = Integer.parseInt(id);
            Blogs blog = blogAppRemote.getPostInfo(result);
        %>
        <nav class="navbar navbar-default navigation-bar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <b><a class="navbar-brand" href="/BlogApp-war/" id="navbar-text">Blog Tank</a></b>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="well well-lg form-add">
            <h3>Edit Post</h3>
            <form name="createNewBlog" action="edit_success.jsp?id=<%=blog.getBlogId()%>" method="post">
                Title: <input name="title" type="text" class="form-control" value="<%=blog.getTitle()%>"><br>
                Text: <textarea rows="8" cols="100" name="content" class="form-control"><%=blog.getContent()%></textarea><br>
                <a href="/BlogApp-war/" class="btn btn-danger">Cancel</a>
                <button type="submit" class="btn btn-success">Save</button><br>
            </form>
        </div>
        </div>
    </body>
</html>
