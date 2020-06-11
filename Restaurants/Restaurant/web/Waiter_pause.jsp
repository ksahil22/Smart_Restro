<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String req=request.getParameter("waiter_id");
    int i=0;
    while(i<req.length())
    {
        if(req.charAt(i)=='$')
        {
            break;
        }
        i++;
    }
    String waiter_id=req.substring(0,i);
    int category=Integer.parseInt(req.substring(i+1,req.length()));
    Connection con=null;
    Statement stmt=null,stmt1=null;
    String Query=new String(),Query1=new String(),x=new String(),w=new String(),sid=new String();
    ResultSet rs=null,rs1=null;
    boolean flag=true;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {}
        stmt=con.createStatement();
        Query="update waiter set waiter_p=0 where waiter_id='"+waiter_id+"'";
        stmt.executeUpdate(Query);
        out.println("sahil");
        if(category==1)
        {
            response.sendRedirect("Waiter.jsp?waiter_id="+waiter_id);
        }
        else
        {
            Query="select * from serves where flag=0 and waiter_id='"+waiter_id+"'";
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                if(rs.getInt("flag")==0)
                {
                    flag=false;
                    break;
                }
            }
            if(flag)
            {
                Query="update attendance set logout_time=current_time, logout_date=current_date where id='"+waiter_id+"'";
                stmt.executeUpdate(Query);
                response.sendRedirect("Staff_login.jsp");
            }
            else
            {
                response.sendRedirect("Waiter.jsp?waiter_id="+waiter_id);
            }
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>