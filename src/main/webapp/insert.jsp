<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>


<%



    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String category = request.getParameter("category");


    Connection connection = null;
    Statement statement = null;
    int rows = 0;

    try{
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost/library","root","");
        statement = connection.createStatement();
        statement.executeUpdate("insert into books(title,author,category)values(" + title + "," + author +"," + category + ")");

        response.sendRedirect("index.html");


    }
    catch(ClassNotFoundException e){


    }
    catch(SQLException e){
        System.out.println(e.getMessage());

    }
    finally{
        if(statement!=null){
            try{
                statement.close();
            }
            catch(SQLException e){
                System.out.println(e.getMessage());
            }

        }
        if(connection != null){
            try{
                connection.close();
            }
            catch(SQLException e){
                System.out.println(e.getMessage());
            }
        }
    }








%>
<html>
<head>
    <title></title>


</head>
<body>

</body>
</html>
