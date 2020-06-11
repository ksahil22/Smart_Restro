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
        Query="update ready set flag=1 where srno="+order;
        stmt.executeUpdate(Query);
        Query="select * from ready where srno="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            o=rs.getInt("order_no");
            c=rs.getInt("counter");
            x=rs.getString("chef_id");
        }
        Query="select * from ready where order_no="+o+" and counter="+c;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            if(rs.getInt("flag")==0)
            {
                flag=true;
                break;
            }
        }
        if(flag)
        {
            response.sendRedirect("Chef.jsp?chef_id="+x);
        }
        else
        {
            Query="select * from Bill where order_no="+o;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                t=rs.getInt("table_no");
            }
            Query="select * from tables where table_no="+t;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                i=rs.getInt("category");
            }
            Query="select * from waiter where waiter_a="+i+" and waiter_p=1";
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                w=rs.getString("waiter_id");
                Query1="select count(srno) from serves where flag=0 and waiter_id='"+w+"'";
                rs1=stmt1.executeQuery(Query1);
                while(rs1.next())
                {
                    if(flag)
                    {
                        j=Integer.parseInt(rs1.getString("count(srno)"));
                        if(count<j)
                        {
                            count=j;
                            sid=w;
                        }
                    }
                    else
                    {
                        count=Integer.parseInt(rs1.getString("count(srno)"));
                        sid=w;
                        flag=true;
                    }
                }
            }
            Query="select max(srno) from serves";
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                count=rs.getInt("max(srno)");
            }
            if(count==0)
            {
                count=1;
            }
            Query="insert into serves values("+count+","+o+","+c+",'"+sid+"',0)";
            stmt.executeUpdate(Query);
            response.sendRedirect("Chef.jsp?chef_id="+x);
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>