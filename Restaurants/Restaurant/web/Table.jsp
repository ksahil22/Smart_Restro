<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
    
<%
    String req=request.getParameter("order");
    int i=0;
    while(i<req.length())
    {
        if(req.charAt(i)=='$')
        {
            break;
        }
        i++;
    }
    int order=Integer.parseInt(req.substring(0,i));
    int category=Integer.parseInt(req.substring(i+1,req.length()));
    Connection con=null;
    Statement stmt=null;
    String Query=new String();
    ResultSet rs=null;
    int k=0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
        }
        stmt=con.createStatement();
        Query="update tables set vacancy=1 where table_no="+category;
        stmt.executeUpdate(Query);
        Query="update login set table_no="+category+" where order_no="+order;
        stmt.executeUpdate(Query);
        response.sendRedirect("Home.jsp?order="+order);
    }
    catch(Exception e)
    {}
%>