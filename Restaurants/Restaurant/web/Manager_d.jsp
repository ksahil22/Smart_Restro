<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String date=request.getParameter("manager_id");
    String manager_id=(String)session.getAttribute("manager_id");
    Connection con=null;
    Statement stmt=null,stmt1=null;
    String Query=new String(),Query1=new String(),x=new String(),name=new String();
    ResultSet rs=null,rs1=null;
    int[] srno=null;
    int count=0,i=0,j=0,k=0,l=0,c=0,amount=0,order_no=0,flag=0;
    String waiter_name="Waiter",cashier_name="Cashier",status="UnPaid",month="";
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {}
        stmt=con.createStatement();
        stmt1=con.createStatement();
        Query="select * from manager where manager_id='"+manager_id+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            name=rs.getString("manager_name");
        }
        Query="select count(table_no) from login";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
           count=rs.getInt("count(table_no)");
        }
        srno=new int[count];
        if(date.substring(5,7).equals("01"))
        {
            month="January";
        }
        else if(date.substring(5,7).equals("02"))
        {
            month="February";
        }
        else if(date.substring(5,7).equals("04"))
        {
            month="April";
        }
        else if(date.substring(5,7).equals("05"))
        {
            month="May";
        }
        else if(date.substring(5,7).equals("03"))
        {
            month="March";
        }
        else if(date.substring(5,7).equals("06"))
        {
            month="June";
        }
        else if(date.substring(5,7).equals("07"))
        {
            month="July";
        }
        else if(date.substring(5,7).equals("08"))
        {
            month="August";
        }
        else if(date.substring(5,7).equals("09"))
        {
            month="September";
        }
        else if(date.substring(5,7).equals("10"))
        {
            month="October";
        }
        else if(date.substring(5,7).equals("11"))
        {
            month="November";
        }
        else if(date.substring(5,7).equals("12"))
        {
            month="December";
        }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Buri HTML5 Bootstrap Template by Colorlib</title>
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
      
      <style>
      
      .cusid{
              position: relative;
              left: 500px;
              color: aliceblue;
             
          }
          .custid{
              color: aliceblue;
               text-align: right;
              float: right;
              font-size: 25px;
              font-family:sans-serif;
          }
          .custmid{
              color: aliceblue;
               text-align: right;
              float: right;
              font-size: 25px;
              font-family:sans-serif;
          }
          
      </style>
      

  </head>
   <body>
<header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <h3 style="color: white;">SMART RESTRO</h3>
                
                <button
                    class="navbar-toggler"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>

               
                <div class="collapse navbar-collapse main-menu-item justify-content-end" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<%="Manager.jsp?manager_id="+manager_id%>">Main Page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Staff_login.jsp">Logout</a>
                    </li>
                    </ul>
                </div>
                <div class="social_icon d-none d-lg-block">
                        <h3 style="color: white;">
                            
                        <%out.println("Manager ID  : "+manager_id);%>
                        </h3>
                        <div class="social_icon d-none d-lg-block"></div>
                        <h3 style="color: blue;">
                            
                        <%out.println("Manager Name: "+name);%>
                        </h3>
                </div>
                </nav>
            </div>
            </div>
        </div>
    </header>

            <style>
                .check{
                    
                   font-size: 35px; background-color: coral; width: 300px;  margin-left: 300px; box-shadow: 2px 2px 10px blue;  
                }
                .check2
                {
                    font-size: 35px; background-color: coral; width: 300px;  margin-left: 266px; box-shadow: 2px 2px 10px blue; 
                }
                .div1{
                    text-align: center; font-size: 35px; font-family: sans-serif; font-weight: bolder; margin-left: 50px;
                }
      </style>
	<!-- Header part end-->

      
            <style>
          .head{
              animation-name: new;
               animation-duration: 2s;
              
              text-align: center;
              text-shadow: 4px 4px 7px black;
              font-size: 80px;
          }
          .date{
              text-align: right;
              padding-right: 100px;
              font-size: 30px;
              font-family: sans-serif;
          }
          .cus{
              
              text-align: center;
              font-family:inherit;
              font-size: 30px;
              font-family: sans-serif;
              font-weight: 100;
          }
          .tb{
              align-self: center;
          }
          table, td, th {
              align-self: center;
              margin-left: auto;
              margin-right: auto;
              font-family: inherit;
              font-size: 20px;
              font-weight: bolder;
              border: 1px solid black;
          }
          .bill{
              height: 200px;
              text-align: right;
              font-size: 60px; 
              padding-right: 100px;
              text-shadow: 2px 2px 2px black;
              font-family: sans-serif;

          animation-name: bill;
          animation-duration: 1s;
          animation-iteration-count: infinite;}
    
          
          .cush{
              
              text-align: right;
              font-size: 20px;
              color: aliceblue;
          }
          
          @keyframes new{
              from{font-size: 250px;}
              to{font-size: 80px}
          }
                
          @keyframes bill{
              from{font-size: 50px; color: burlywood;}
              to{font-size: 50px; color: azure;}
          }
         .refresh
                {
                font-family: sans-serif;
                    font-size: 20px;
                    background-color: aquamarine;
                    height: 30px;
                    width: 200px;
                    margin-left: 200px;
                    text-align: center;
                }
                .refresh:hover{color: red;
                background-color:beige}
                .wel{
                    
                    color: white;
                    text-decoration-color: aliceblue;
                    font-size: 50px;
                    position: relative;
                    animation-name: welcome;
                    animation-delay: 1s;
                animation-duration: 2s;
                }
                th{
                    width: 200px;    
                }
                button{
                    width: 200px;
                    background-color: lightgreen;
                }
                table{
                    text-align: center;
                                    }
                h1{
                    text-align: center;
                    animation-name: dishes;
                    animation-duration: 2s;
                }
                
                @keyframes dishes{
                    from{font-size:80px;}
                    to{font-size: 35px;}
                   
                @keyframes welcome{
                    from{left: 200px; color: aqua;}
                    to{left: 10px; color: antiquewhite}
                    }
                    .align{
                        display: inline;
                    
                    }
      </style>
	<!-- Header part end-->

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb_iner">
              <div class="breadcrumb_iner_item">
                <p> Eye of the Eagle</p>
                <h2>Let's See everything </h2>
              </div>
            </div>
              <div class="wel">
                  <p class="wel"><%out.println("Welcome Mr. "+manager_id);%></p>
         </div>
          </div>
        </div>
      </div>
         
    </section>
<div>
         <div style="height: 50px;"></div> 
         <h2><span style="  margin-left: 200px;"> Your audit for date of <%out.println(date.substring(8,10)+" "+month+" "+date.substring(0,4));%> is following</span></h2>
          <div style="height: 25px;"></div>
          <table>
              <tr style="  background-color: darkorange; box-shadow: 2px 2px 10px blue;">
                  <th colspan="4"><%out.println(month);%></th>
                </tr>
              <tr>
                 
                <th>Order no</th>
                <th>bill </th>
                  <th>View bill </th>
              </tr>
              
                
<%               
        Query="select * from bill where date='"+date+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            order_no=rs.getInt("order_no");
            amount=rs.getInt("amount");
            i=i+amount;
%>
                <tr>
                <th><%out.println(order_no);%></th>
                <th><%out.println(amount);%></th>
                <th><button>View bill</button></th>
                </tr>
<%        }
        }
        catch(Exception e)
        {out.println(e);}
%>
          </table>
      </div>
<div style=" height: 200px; text-align: right;font-size: 60px;  padding: 20px; padding-right: 100px;font-family: sans-serif;"> 
          Total amount of this Month is : <span class="bill">₹<%out.println(i);%></span></div>
          
          <!-- footer part start-->
      <footer class="footer-area ">
         <div class="container ">
            <div class="row justify-content-between ">
               <div class="col-xl-3 col-sm-6 col-md-3 col-lg-3 ">
                  <div class="single-footer-widget footer_1 ">
                     <p>Contact Info</p>
                     <p>+91 98765 43210 </p>
                     <span>smartrestro@gmail.com</span>
                  </div>
               </div>
               <div class="col-xl-3 col-sm-6 col-md-2 col-lg-3 ">
                  <div class="single-footer-widget footer_2 ">
                     
                     <div class="smartres ">
                        Smart Restro
                     </div>
                  </div>
               </div>
               <div class="col-xl-3 col-sm-6 col-md-2 col-lg-3 ">
                  <div class="single-footer-widget footer_2 ">
                     <div class="social_icon d-none d-lg-block">
                        <p style="color: white;" align="right">
                            
                        <%out.println("Number of Customers");%>
                        <P>
                        <div class="social_icon d-none d-lg-block">
                        <p style="color: white;" align="right">
                            
                        <%out.println("present : "+count);%>
                        <P>
                </div>
                     <div class="contact_info ">
                        <ul>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <div class="copyright_part_text ">
               <div class="row ">
                  <div class="col-lg-12 text-center ">
                     <p class="footer-text m-0 ">
                      
                     </p>
                  </div>
               </div>
            </div>
         </div>
      </footer>
                        
<!-- footer part end-->
      <!-- jquery -->
      <script src="js/jquery-1.12.1.min.js "></script>
      <!-- popper js -->
      <script src="js/popper.min.js "></script>
      <!-- bootstrap js -->
      <script src="js/bootstrap.min.js "></script>
      <!-- easing js -->
      <script src="js/jquery.magnific-popup.js "></script>
      <!-- swiper js -->
      <script src="js/swiper.min.js "></script>
      <!-- swiper js -->
      <script src="js/masonry.pkgd.js "></script>
      <!-- particles js -->
      <script src="js/owl.carousel.min.js "></script>
      <!-- swiper js -->
      <script src="js/slick.min.js "></script>
      <script src="js/gijgo.min.js "></script>
      <script src="js/jquery.nice-select.min.js "></script>
      <!-- custom js -->
      <script src="js/custom.js "></script>
   </body>
</html>