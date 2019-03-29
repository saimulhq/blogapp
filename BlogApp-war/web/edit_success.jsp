<%@page import="javax.naming.InitialContext"%>
<%@page import="com.blogapp.entities.Blogs"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.blogapp.BlogAppRemote"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Tank</title>
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
            
            String id=request.getParameter("id");
            int result = Integer.parseInt(id);
//            System.out.println(result);
            String title = request.getParameter("title");
//            System.out.println(title);
            String content = request.getParameter("content");
//            System.out.println(content);
//            DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm");
            Date date = new Date();
//            System.out.println(dateFormat.format(date));

            if (title != null && content != null) {
                Blogs blog = new Blogs();
                blog.setBlogId(result);
                blog.setTitle(title);
                blog.setContent(content);
                blog.setPostDate(date);
                blogAppRemote.updatePostsInDatabase(blog);
            }

            String redirectURL = "index.jsp";
            response.sendRedirect(redirectURL);
        %>
    </body>
</html>
