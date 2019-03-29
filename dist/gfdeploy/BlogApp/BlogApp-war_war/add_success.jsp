<%@page import="com.blogapp.entities.Blogs"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.blogapp.BlogAppRemote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Tank</title>
    </head>
    <body>
        <div>
            <%
                BlogAppRemote blogAppRemote = null;

                try {
                    Context context = new InitialContext();
                    blogAppRemote = (BlogAppRemote) context.lookup(BlogAppRemote.class.getName());

                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                String title = request.getParameter("title");
//                System.out.println(title);
                String content = request.getParameter("content");
//                System.out.println(content);
//                DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm");
                Date date = new Date();
//                System.out.println(dateFormat.format(date));

                if (title != null && content != null) {
                    Blogs blog = new Blogs();
                    blog.setTitle(title);
                    blog.setContent(content);
                    blog.setPostDate(date);
                    blogAppRemote.addPostsInDatabase(blog);
                }
                
                String redirectURL = "index.jsp";
                response.sendRedirect(redirectURL);
            %>
        </div>
    </body>
</html>
