<%@page import="java.util.List"%>
<%@page import="com.blogapp.entities.Blogs"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.blogapp.BlogAppRemote"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Blog Tank</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/webpagestyle.css">
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
            <div class="well well-sm">
                <a href="add.jsp" class="btn btn-info" role="button">Add new post</a>
            </div>
            <%
                BlogAppRemote blogAppRemote = null;

                try {
                    Context context = new InitialContext();
                    blogAppRemote = (BlogAppRemote) context.lookup(BlogAppRemote.class.getName());

                } catch (Exception e) {
                    e.printStackTrace();
                }

                DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm");

                List<Blogs> listAllBlogs = blogAppRemote.getPostsList();

                for (Blogs blog : listAllBlogs) {
            %>
            <div class="well well-lg">
                <p>
                    <b><a href="view.jsp?id=<%=blog.getBlogId()%>"><%=blog.getTitle()%></a></b><br>
                </p>
                <p>
                    Date posted: <%=dateFormat.format(blog.getPostDate())%><br>
                </p>
                <a href="delete.jsp?id=<%=blog.getBlogId()%>" class="btn btn-danger" style="float: right">Delete</a>
                <a href="edit.jsp?id=<%=blog.getBlogId()%>" class="btn btn-primary" style="float: right">Edit</a>
                <a href="view.jsp?id=<%=blog.getBlogId()%>" class="btn btn-success" style="float: right">View</a>
            </div><%
                }
            %>
        </div>
    </body>
</html>
