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
            blogAppRemote.deletePost(result);
            
            String redirectURL = "index.jsp";
            response.sendRedirect(redirectURL);
        %>
    </body>
</html>
