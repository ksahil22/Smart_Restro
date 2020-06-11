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
    int i=0,count=0,dishid=0,t=0,sid=0,psid=0,dcount=0,j=0,m=0,n=0;
    boolean flag=false,allocation=true;
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
                sid=Integer.parseInt(rs1.getString("chef_id"));
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
                sid=Integer.parseInt(rs1.getString("chef_id"));
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
            Query1="insert into ready values("+m+","+order+","+dishid+","+i+",'"+dish_type+"',"+count+",'"+psid+"',0)";
            stmt1.executeUpdate(Query1);
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
        response.sendRedirect("Home.jsp?order="+order);
    }
    catch(Exception e)
    {}
%>