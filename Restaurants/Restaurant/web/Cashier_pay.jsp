<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String req=request.getParameter("cashier_id");
    int i=0;
    while(i<req.length())
    {
        if(req.charAt(i)=='$')
        {
            break;
        }
        i++;
    }
    String cashier_id=req.substring(0,i);
    int order=Integer.parseInt(req.substring(i+1,req.length()));
    Connection con=null;
    Statement stmt=null;
    String Query=new String(),a=new String();
    ResultSet rs=null;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
        }
        stmt=con.createStatement();
        Query="update bill set cashier_id='"+cashier_id+"',flag=1 where order_no="+order;
        stmt.executeUpdate(Query);
        response.sendRedirect("Cashier.jsp?cashier_id="+cashier_id);
    }
    catch(Exception e)
    {}
%>