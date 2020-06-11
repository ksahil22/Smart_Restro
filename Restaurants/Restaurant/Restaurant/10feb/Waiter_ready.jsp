<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    int order=Integer.parseInt(request.getParameter("order"));
    Connection con=null;
    Statement stmt=null,stmt1=null;
    String Query=new String(),Query1=new String(),x=new String(),w=new String(),sid=new String();
    ResultSet rs=null,rs1=null;
    int[] serves=null;
    int count=0,i=0,j=0,o=0,c=0,t=0;
    boolean flag=false;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {}
        stmt=con.createStatement();
        stmt1=con.createStatement();
        Query="update serves set flag=1 where srno="+order;
        stmt.executeUpdate(Query);
        Query="select * from serves where srno="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            x=rs.getString("waiter_id");
        }
        response.sendRedirect("Waiter.jsp?waiter_id="+x);
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>