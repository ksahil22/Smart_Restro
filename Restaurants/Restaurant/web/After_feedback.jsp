<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String res=request.getParameter("rating");
    int rate=Integer.parseInt(res.substring(0,1));
    int order=Integer.parseInt(res.substring(1,res.length()));
    Connection con=null;
    Statement stmt=null,stmt1=null;
    String Query=new String(),Query1=new String();
    ResultSet rs=null,rs1=null;
    String date=new String(),d1=new String(),chef_id=new String(),chef_b=new String(),chef_t=new String(),chef_s=new String(),chef_w=new String();
    int i=0,srno=0,r=0,max=0,min=0,max1=0,min1=0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
        }
        stmt=con.createStatement();
        stmt1=con.createStatement();
        out.println(srno);
        Query="update bill set feedback="+rate+" where order_no="+order;
        stmt.executeUpdate(Query);
        out.println(srno);
        Query="select max(srno) from award";
        rs=stmt.executeQuery(Query);
        out.println(srno);
        while(rs.next())
        {
            srno=rs.getInt("max(srno)");
        }
        out.println(srno);
        Query="select date from award where srno="+srno;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            date=rs.getString("date");
        }
        out.println(srno);
        Query="select date from bill where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            d1=rs.getString("date");
        }
        out.println(srno);
        if(!d1.equals("") && !date.equals("") && !date.equals(null) && !d1.equals(null) &&d1.substring(5,7).equals(date.substring(5,7)))
        {
            Query="select * from ready natural join chef where order_no="+order;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                chef_id=rs.getString("chef_id");
                r=rs.getInt("chef_b");
                i=rate+r;
                Query1="update chef set chef_b="+i+" where chef_id="+chef_id;
                stmt1.executeUpdate(Query1);
            }
            Query="select * from serves natural join waiter where order_no="+order;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                chef_id=rs.getString("waiter_id");
                r=rs.getInt("waiter_b");
                i=r+rate;
                Query1="update waiter set waiter_b="+i+" where waiter_id="+chef_id;
                stmt1.executeUpdate(Query1);
            }
        }
        else
        {
            Query="select max(chef_b),min(chef_b) from chef";
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                max=rs.getInt("max(chef_b)");
                min=rs.getInt("min(chef_b)");
            }
            Query="select max(waiter_b),min(waiter_b) from waiter";
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                max1=rs.getInt("max(waiter_b)");
                min1=rs.getInt("min(waiter_b)");
            }
            Query="select * from chef where chef_b="+max;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                chef_b=rs.getString("chef_id");
            }
            Query="select * from chef where chef_b="+min;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                chef_w=rs.getString("chef_id");
            }
            Query="select * from waiter where waiter_b="+max1;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                chef_s=rs.getString("waiter_id");
            }
            Query="select * from waiter where waiter_b="+min1;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                chef_t=rs.getString("waiter_id");
            }
            srno++;
            out.println(srno);
            Query="insert into award values("+srno+",current_date,"+chef_b+","+chef_s+","+chef_w+","+chef_t+")";
            stmt.executeUpdate(Query);
            Query="update chef set chef_b=0";
            stmt.executeUpdate(Query);
            Query="update waiter set waiter_b=0";
            stmt.executeUpdate(Query);
            Query="select * from dish_order natural join chef where order_no="+order;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                chef_id=rs.getString("chef_id");
                r=rs.getInt("chef_b");
                i=rate+r;
                Query1="update chef set chef_b="+i+" where chef_id="+chef_id;
                stmt1.executeUpdate(Query1);
            }
            Query="select * from serves natural join waiter where order_no="+order;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                chef_id=rs.getString("waiter_id");
                r=rs.getInt("waiter_b");
                i=r+rate;
                Query1="update waiter set waiter_b="+i+" where waiter_id="+chef_id;
                stmt1.executeUpdate(Query1);
            }
        }
        response.sendRedirect("Logout.jsp?order="+order);
    }
    catch(Exception e)
    {out.println(e);}
%>