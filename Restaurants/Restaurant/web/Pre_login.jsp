<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    int order=Integer.parseInt(request.getParameter("order"));
    Connection con=null;
    Statement stmt=null;
    String Query=new String();
    ResultSet rs=null;
    String date=new String(),d1=new String();
    int i=0,srno=0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
        }
        stmt=con.createStatement();
        Query="select * from login where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            i=rs.getInt("table_no");
        }
        Query="delete from login where order_no="+order;
        stmt.executeUpdate(Query);
        Query="update tables set vacancy=0 where table_no="+i;
        stmt.executeUpdate(Query);
        response.sendRedirect("Login.jsp");
    }
    catch(Exception e)
    {}
%>