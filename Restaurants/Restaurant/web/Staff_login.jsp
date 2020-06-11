<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Smart restaurant management system</title>
    <link rel="icon" href="img/favicon.png" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css" />
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <!-- themify CSS -->
    <link rel="stylesheet" href="css/themify-icons.css" />
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css" />
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css" />
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css" />
    <link rel="stylesheet" href="css/gijgo.min.css" />
    <link rel="stylesheet" href="css/nice-select.css" />
    <link rel="stylesheet" href="css/all.css" />
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <style >
      
      body{
    margin: 0;
    padding: 0;
    background: #fff;

    color: #fff;
    font-family: Arial;
    font-size: 12px;
}

.body{
    position: absolute;
    top: -20px;
    left: -20px;
    right: -40px;
    bottom: -40px;
    width: auto;
    height: auto;
    
    background-size: cover;
    -webkit-filter: blur(5px);
    z-index: 0;
}

.grad{
    position: absolute;
    top: -20px;
    left: -20px;
    right: -40px;
    bottom: -40px;
    width: auto;
    height: auto;
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
    z-index: 1;
    opacity: 0.7;
}

.header{
    position: absolute;
    top: calc(20% - 35px);
    left: calc(50% - 255px);
    z-index: 2;
}

.header div{
    float: left;
    color: #fff;
    font-family: 'Exo', sans-serif;
    font-size: 35px;
    font-weight: 200;
}

.header div span{
    color: #5379fa !important;
}

.login{
    position: absolute;
    top: calc(30% - 75px);
    left: calc(50% - 50px);
    height: 150px;
    width: 350px;
    padding: 10px;
    z-index: 2;
}

.login input[type=text]{
    width: 250px;
    height: 30px;
    background: transparent;
    border: 1px solid rgba(255,255,255,0.6);
    border-radius: 2px;
    color: #fff;
    font-family: 'Exo', sans-serif;
    font-size: 16px;
    font-weight: 400;
    padding: 4px;
}

.login input[type=password]{
    width: 250px;
    height: 30px;
    background: transparent;
    border: 1px solid rgba(255,255,255,0.6);
    border-radius: 2px;
    color: #fff;
    font-family: 'Exo', sans-serif;
    font-size: 16px;
    font-weight: 400;
    padding: 4px;
    margin-top: 10px;
}

.login input[type=button]{
    width: 260px;
    height: 35px;
    background: #fff;
    border: 1px solid #fff;
    cursor: pointer;
    border-radius: 2px;
    color: #a18d6c;
    font-family: 'Exo', sans-serif;
    font-size: 16px;
    font-weight: 400;
    padding: 6px;
    margin-top: 10px;
}

.login input[type=button]:hover{
    opacity: 0.8;
}

.login input[type=button]:active{
    opacity: 0.6;
}

.login input[type=text]:focus{
    outline: none;
    border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
    outline: none;
    border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=button]:focus{
    outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
  </style>
  <body>
    
    <!-- banner part start-->
    <section class="banner_part">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-7">
            <div class="banner_text">
              <div class="banner_text_iner">
                <div class="body"></div>
                    <div class="header">
                    <div>Smart Restro<span><br>Staff login</br></span></div>
                    </div>
                <br>       
              </div>
            </div>
          </div>
        </div>
    </section>
    
<%
    Connection con=null;
    Statement stmt=null;
    String Query=new String(),x=new String();
    ResultSet rs=null;
    String user=new String(),pass=new String(),cust_pass=new String();
    int order=0,max=1;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
            out.println("Connected");
        }
        stmt=con.createStatement();
%>
<h1  align="center">Staff Login</h1>
</p>
<form  method='post'>
<pre>
<h3  align="center">
<label>Username</label> <input type="text" name="user"  required/>
<label>Password</label> <input type="password" name="password" required />
<input type="submit" value="confirm" name ="submit" /> 
<input type="reset" value="clear"/> 
</pre>
</form>
<%
        x=request.getParameter("submit");
        if(x.equals("confirm"))
        {
            user=request.getParameter("user");
            pass=request.getParameter("password");
        }
        Query="select * from chef where chef_id='"+user+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            cust_pass=rs.getString("chef_password");
        }
        Query="select max(srno) from attendance";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            max=rs.getInt("max(srno)");
        }
        max++;
        if(pass.equals(cust_pass))
        {
            Query="insert into attendance values("+max+",'"+user+"',current_date,current_time,null,null)";
            stmt.executeUpdate(Query);
            Query="update chef set chef_p=1 where chef_id='"+user+"'";
            stmt.executeUpdate(Query);
            response.sendRedirect("Chef.jsp?chef_id="+user);
        }
        else
        {
            Query="select * from waiter where waiter_id='"+user+"'";
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                cust_pass=rs.getString("waiter_password");
            }
            if(pass.equals(cust_pass))
            {
                Query="insert into attendance values("+max+",'"+user+"',current_date,current_time,null,null)";
                stmt.executeUpdate(Query);
                Query="update waiter set waiter_p=1 where waiter_id='"+user+"'";
                stmt.executeUpdate(Query);
                response.sendRedirect("Waiter.jsp?waiter_id="+user);
            }
            else
            {
                Query="select * from cashier where cashier_id='"+user+"'";
                rs=stmt.executeQuery(Query);
                while(rs.next())
                {
                    cust_pass=rs.getString("cashier_password");
                }
                if(pass.equals(cust_pass))
                {
                    Query="insert into attendance values("+max+",'"+user+"',current_date,current_time,null,null)";
                    stmt.executeUpdate(Query);
                    Query="update cashier set cashier_p=1 where cashier_id='"+user+"'";
                    stmt.executeUpdate(Query);
                    response.sendRedirect("Cashier.jsp?cashier_id="+user);
                }
                else
                {
                    Query="select * from manager where manager_id='"+user+"'";
                    rs=stmt.executeQuery(Query);
                    while(rs.next())
                    {
                        cust_pass=rs.getString("manager_password");
                    }
                    if(pass.equals(cust_pass))
                    {
                        Query="insert into attendance values("+max+",'"+user+"',current_date,current_time,null,null)";
                        stmt.executeUpdate(Query);
                        Query="update manager set manager_p=1 where manager_id='"+user+"'";
                        stmt.executeUpdate(Query);
                        response.sendRedirect("Manager.jsp?manager_id="+user);
                    }
                    else
                    {
                        response.sendRedirect("Staff_login.jsp");
                    }
                }
            }
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
 <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- swiper js -->
    <script src="js/slick.min.js"></script>
    <script src="js/gijgo.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
  </body>
</html>

