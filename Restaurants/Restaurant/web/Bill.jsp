<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String req=request.getParameter("order");
    int i=0;
    while(i<req.length())
    {
        if(req.charAt(i)=='$')
        {
            break;
        }
        i++;
    }
    int order=Integer.parseInt(req.substring(0,i));
    int category=Integer.parseInt(req.substring(i+1,req.length()));
    Connection con=null;
    Statement stmt=null;
    String Query=new String(),a=new String();
    ResultSet rs=null;
    String x=new String(),y=new String(),date=new String(),time=new String(),status=new String(),cashier_name="-";
    int count=0,j=0,amount=0,flag=0;
    String cashier_id="";
    int[] table_id;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
        }
        stmt=con.createStatement();
        Query="select * from login natural join customer where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            x=rs.getString("customer_name");
            y=rs.getString("customer_id");
        }
        Query="select * from bill where order_no="+category;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            date=rs.getString("date");
            time=rs.getString("time");
            amount=rs.getInt("amount");
            flag=rs.getInt("flag");
            cashier_id=rs.getString("cashier_id");
            j=rs.getInt("table_no");
        }
        Query="select * from cashier where cashier_id='"+cashier_id+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            cashier_name=rs.getString("cashier_name");
        }
        i=0;
        while(i<cashier_name.length() && cashier_name.charAt(i)!=' ')
        {
            i++;
        }
        cashier_name=cashier_name.substring(0,i);
        if(flag==1)
        {
            status="Paid";
        }
        else if(flag==0)
        {
            status="Unpaid";
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
              left: 300px;
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
      <style>
          .head{
              animation-name: new;
               animation-duration: 2s;
              
              text-align: center;
              text-shadow: 4px 4px 7px black;
              font-size: 80px;
          }
          .date{
              text-align: left;
              padding-left: 400px;
              font-size: 30px;
              font-family: sans-serif;
          }
          .time{
              float: right;
              padding-right: 400px;
              font-size: 30px;
              font-family: sans-serif;    
          }
          .smartres{
              
              font-size: 40px;
              font-style: oblique;
              font-family: cursive;
              color: aliceblue;
              text-align: center;
          }
          .history{
              font-size: 30px;
              border-style: double;
              color: white;
              text-align: center; 
              transition-duration: box-shadow 0.5s font-size 0.5s;
          }
          .cush{
              
              text-align: right;
              font-size: 20px;
              color: aliceblue;
          }
          
        
          
          .history:hover{
              
              box-shadow: 4px 4px 6px 6px white;
              font-size: 35px;
              
          }
          .conf{
              color: aliceblue;
              font-size: 20px;
                text-decoration-color: aliceblue;
              
              
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
              from{font-size: 50px; color: darkcyan;}
              to{font-size: 50px; color: darkorange;}
          }
         
          
      </style>
      

  </head>

  <body>
<header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <P style="color: white;">SMART RESTRO</P>
                
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
                        <a class="nav-link" href="<%="Home.jsp?order="+order%>">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%="Menu.jsp?order="+order%>">Menu</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="<%="Contact.jsp?order="+order%>">Contact</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="<%="Pre_logout.jsp?order="+order%>">Bill</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="<%="Pre_logout.jsp?order="+order%>">Logout</a>
                    </li>
                    </ul>
                </div>
                <div class="social_icon d-none d-lg-block">
                        <p style="color: white;">
                            
                        <%out.println("Customer Name: "+x);%>
                        </p>
                        <div class="social_icon d-none d-lg-block"></div>
                        <p style="color: blue;">
                            
                        <%out.println("Customer ID  : "+y);%>
                        </p>
                </div>
                </nav>
            </div>
            </div>
        </div>
    </header>
      
            
	<!-- Header part end-->

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb_iner">
              <div class="breadcrumb_iner_item">
                 
                <p>just to go</p>
                <h2>bill </h2>
                  
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	<!-- breadcrumb start-->
	
      <!-- Start Sample Area -->
      <!-- End Sample Area -->
      <!-- Start Button -->
      <!-- End Button -->
      <!-- Start Align Area -->
      <div>
          <h1 class="head">Smart Restro</h1>
          <div class="date"><h2>Date: <%out.println(date);%>
                  <span class="time">Time: <%out.println(time);%></span></h2></div>
          <div class="date"><h2>Order no: <%out.println(order);%>
                  <span class="time">Table_no: <%out.println(j);%></span></h2></div>
          <div class="date"><h2>Customer: <%out.println(x);%>
                  <span class="time">Cashier: <%out.println(cashier_name);%></span></h2></div>
          <br>
      </div>
      
      <div class="tb">
      <table >
          <tr>
              <th>Dish Name</th>
              <th>Quantity</th>
              <th>Price</th>
              <th>Total Price</th>
          </tr>
<%
        Query="select * from dish_order natural join menu where order_no="+category;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
%>
           <tr>
              <th width="250px"><%=rs.getString("dish_name")%></th>
              <th width="150px"><%=rs.getInt("quantity")%></th>
              <th width="150px"><%=rs.getInt("dish_price")%></th>
              <th width="150px"><%=(rs.getInt("dish_price")*rs.getInt("quantity"))%></th>
          </tr>
          
<%
        }
%>
           </table>
      </div>
<%
    }
    catch(Exception e)
    {}
%>
      <div style="text-align: right; font-size: 50px; padding-right: 100px; font-weight: bold; font-family: sans-serif;">Your Total bill is : 
          <span class="bill">₹<%out.println(amount);%></span></div>
      <div class="date" align="left"><h2>Status: <%out.println(status);%></h2></div>
          <div style="height: 20px;"></div>
      
      <!-- End Align Area -->
      <!-- footer part start-->
      
      <footer class="footer-area ">
         <div class="container ">
            <div class="row justify-content-between ">
               <div class="col-xl-3 col-sm-6 col-md-3 col-lg-3 ">
                  <div class="single-footer-widget footer_1 ">
                    
                     <p>+91 98765 43210</p>
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
               <div class="col-xl-3 col-sm-6 col-md-4 col-lg-3 ">
                  <div class="history">
                      <a href="<%="History.jsp?order="+order%>" style="color: aliceblue;">HISTORY</a>
                  </div>
               </div>
            </div>
            <br><br>
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