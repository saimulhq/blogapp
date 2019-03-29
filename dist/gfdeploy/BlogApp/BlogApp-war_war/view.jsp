<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.blogapp.entities.Blogs"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.blogapp.BlogAppRemote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

//            System.out.println(blog.getTitle());
//            System.out.println(blog.getContent());
//            System.out.println(blog.getPostDate());
            DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm");
        %>
        <nav class="navbar navbar-default navigation-bar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <b><a class="navbar-brand" href="/BlogApp-war/" id="navbar-text">Blog Tank</a></b>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="well well-lg view-post">
                <p><b><%=blog.getTitle()%></b></p><br>
                <p><%=blog.getContent()%></p><br>
                <p>Date posted: <%=dateFormat.format(blog.getPostDate())%></p><br>
                <a href="/BlogApp-war/" class="btn btn-danger">Back</a>
            </div>
        </div>
    </body>
</html>
