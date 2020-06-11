<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    int order=Integer.parseInt(request.getParameter("order"));
    Connection con=null;
    Statement stmt=null,stmt1=null,stmt2=null;
    String Query=new String(),x=new String(),Query1=new String(),Query2=new String();
    String dish_type=new String();
    int table_no=0;
    String cashier_id=new String(),cust_id=new String();
    String[] orderIds;
    ResultSet rs=null,rs1=null,rs2=null;
    int[] Oids;
    String[] dish_extra,quant;
    int[] quantity;
    String sid="",psid="";
    int i=0,count=0,dishid=0,t=0,dcount=0,j=0,m=0,n=0,k=0;
    boolean flag=false,allocation=true;
    int month=0,year=0,m1=0,y1=0,am=0,day=0,d1=0,max1=0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
        }
        stmt=con.createStatement();
        stmt1=con.createStatement();
        stmt2=con.createStatement();
        count=0;
        Query="select * from ready where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            i=Integer.parseInt(rs.getString("counter"));
            if(i>count)
            {
                count=i;
            }
        }
        count++;
        Query="select * from temp_order where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            dishid=rs.getInt("dish_id");
            i=rs.getInt("quantity");
            dish_type=rs.getString("description");
            n=dishid/1000;
            Query1="select * from chef where chef_s="+n+" and chef_p=1";
            rs1=stmt1.executeQuery(Query1);
            while(rs1.next())
            {
                sid=rs1.getString("chef_id");
                Query2="select count(dish_id) from ready where chef_id='"+sid+"' and flag=0";
                rs2=stmt2.executeQuery(Query2);
                while(rs2.next())
                {
                    if(j==0 || t>rs2.getInt("count(dish_id)"))
                    {
                        t=rs2.getInt("count(dish_id)");
                        psid=sid;
                        j++;
                    }
                }
            }
            Query1="select * from chef where chef_s=0 and chef_p=1";
            rs1=stmt1.executeQuery(Query1);
            while(rs1.next())
            {
                sid=rs1.getString("chef_id");
                Query2="select count(dish_id) from ready where chef_id='"+sid+"' and flag=0";
                rs2=stmt2.executeQuery(Query2);
                while(rs2.next())
                {
                    if(j==0 || t>rs2.getInt("count(dish_id)"))
                    {
                        t=rs2.getInt("count(dish_id)");
                        psid=sid;
                        j++;
                    }
                }
            }
            Query1="select max(srno) from ready";
            rs1=stmt1.executeQuery(Query1);
            while(rs1.next())
            {
                m=rs1.getInt("max(srno)");
            }
            m++;
            if(!psid.equals(""))
            {
                Query1="insert into ready values("+m+","+order+","+dishid+","+i+",'"+dish_type+"',"+count+",'"+psid+"',0)";
                stmt1.executeUpdate(Query1);
            }
            else
            {
                Query1="select * from chef where chef_p=1";
                rs1=stmt1.executeQuery(Query1);
                while(rs1.next())
                {
                    sid=rs1.getString("chef_id");
                    Query2="select count(dish_id) from ready where flag=0 and chef_id='"+sid+"'";
                    rs2=stmt2.executeQuery(Query2);
                    while(rs2.next())
                    {
                        k=rs2.getInt("count(dish_id)");
                        if(max1==0)
                        {
                            psid=sid;
                        }
                        else if(max1>k)
                        {
                            max1=k;
                            psid=sid;
                        }
                    }
                }
                Query1="insert into ready values("+m+","+order+","+dishid+","+i+",'"+dish_type+"',"+count+",'"+psid+"',0)";
                stmt1.executeUpdate(Query1);
            }
            j=0;
            try
            {
                Query1="insert into dish_order values("+order+","+dishid+","+i+")";
                stmt1.executeUpdate(Query1);
            }
            catch(Exception e)
            {
                Query1="select * from dish_order where dish_id="+dishid+" and order_no="+order;
                rs1=stmt1.executeQuery(Query1);
                while(rs1.next())
                {
                    i=i+rs1.getInt("quantity");
                }
                Query1="update dish_order set quantity="+i+" where order_no="+order+" and dish_id="+dishid;
                stmt1.executeUpdate(Query1);
            }
            Query1="delete from temp_order where order_no="+order+" and dish_id="+dishid;
            stmt1.executeUpdate(Query1);
        }
        i=0;
        Query="select * from dish_order natural join menu where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            i=i+(rs.getInt("quantity")*rs.getInt("dish_price"));
        }
        Query="select * from login where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            table_no=rs.getInt("table_no");
            cust_id=rs.getString("customer_id");
        }
        t=0;
        try
        {
            Query="insert into bill values("+order+","+i+","+table_no+",'"+cust_id+"',null,current_date,current_time,0,0)";
            stmt.executeUpdate(Query);
        }
        catch(Exception e)
        {
            Query="Update bill set amount="+i+",date=current_date,time=current_time where order_no="+order;
            stmt.executeUpdate(Query);
        }
        Query="select max(srno) from accounts";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            t=rs.getInt("max(srno)");
        }
        if(t==0)
        {
            Query="insert into accounts values(1,current_date,"+order+","+i+")";
            stmt.executeUpdate(Query);
        }
        else
        {
            Query="select month(start_date),year(start_date),total_amount from accounts where srno="+t;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                month=rs.getInt("month(start_date)");
                year=rs.getInt("year(start_date)");
                am=rs.getInt("total_amount");
            }
            Query="select month(date),year(date) from bill where order_no="+order;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                m1=rs.getInt("month(date)");
                y1=rs.getInt("year(date)");
            }
            if(m1==month && y1==year)
            {
                am=am+i;
                Query="update accounts set total_amount="+am+" where srno="+t;
                stmt.executeUpdate(Query);
            }
            else
            {
                t++;
                Query="insert into accounts values("+t+",current_date,"+order+","+i+")";
                stmt.executeUpdate(Query);
            }
        }
        t=0;
        Query="select max(srno) from accountsd";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            t=rs.getInt("max(srno)");
        }
        if(t==0)
        {
            Query="insert into accountsd values(1,current_date,"+order+","+i+")";
            stmt.executeUpdate(Query);
        }
        else
        {
            Query="select month(date),year(date),total_amount,day(date) from accountsd where srno="+t;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                month=rs.getInt("month(date)");
                year=rs.getInt("year(date)");
                day=rs.getInt("day(date)");
                am=rs.getInt("total_amount");
            }
            Query="select month(date),year(date),day(date) from bill where order_no="+order;
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                m1=rs.getInt("month(date)");
                y1=rs.getInt("year(date)");
                d1=rs.getInt("day(date)");
            }
            if(m1==month && y1==year && d1==day)
            {
                am=am+i;
                Query="update accountsd set total_amount="+am+" where srno="+t;
                stmt.executeUpdate(Query);
            }
            else
            {
                t++;
                Query="insert into accountsd values("+t+",current_date,"+order+","+i+")";
                stmt.executeUpdate(Query);
            }
        }
        response.sendRedirect("Home.jsp?order="+order);
    }
    catch(Exception e)
    {out.println(e);}
%>