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
    int status=1;
    int flag=0;
    String x=new String(),y=new String();
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
        }
        stmt=con.createStatement();
        Query="select * from bill where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            try
            {
                status=rs.getInt("flag");
                flag=rs.getInt("feedback");
            }
            catch(Exception e)
            {}
        }
        if(status==0)
        {
            response.sendRedirect("Bill.jsp?order="+order+"$"+order);
        }
        else if(status==1 && flag==1)
        {
            response.sendRedirect("Logout.jsp?order="+order);
        }
        else if(status==1)
        {
            response.sendRedirect("Feedback.jsp?order="+order);
        }
    }
    catch(Exception e)
    {
    }
%>