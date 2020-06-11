<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String req=request.getParameter("cashier_id");
    int i=0;
    while(i<req.length())
    {
        if(req.charAt(i)=='$')
        {
            break;
        }
        i++;
    }
    String cashier_id=req.substring(0,i);
    int order=Integer.parseInt(req.substring(i+1,req.length()));
    Connection con=null;
    Statement stmt=null;
    String Query=new String(),a=new String();
    ResultSet rs=null;
    String x=new String(),y=new String(),date=new String(),time=new String(),status=new String(),cashier_name="-",c_id=new String();
    int count=0,j=0,amount=0,flag=0;
    int[] table_id;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
        }
        stmt=con.createStatement();
        Query="select * from cashier where cashier_id="+cashier_id;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            x=rs.getString("cashier_name");
            y=rs.getString("cashier_id");
        }
        Query="select * from bill natural join customer where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            date=rs.getString("date");
            time=rs.getString("time");
            amount=rs.getInt("amount");
            flag=rs.getInt("flag");
            j=rs.getInt("table_no");
            c_id=rs.getString("cashier_id");
            y=rs.getString("customer_name");
        }
        Query="select * from cashier where cashier_id='"+c_id+"'";
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
                .paid{
                    font-family: sans-serif;
                    font-size: 20px;
                    margin-left: 700px;
                    margin-right: auto;
                    height: 50px;
                    width: 500px;        
                    padding: 5px;
                }
                .paida{
                       font-family: sans-serif;
                    font-size: 20px;
                    background-color: coral;
                    height: 50px;
                    width: 100px;
                    margin-left: auto;
                    margin-right: auto;
                    padding: inherit;
                    padding: 5px;
                    display: inline;
                }
                .paida:hover
                {
                    
                    background-color: greenyellow;
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
                    
                </div>
                <div class="social_icon d-none d-lg-block" align="right">
                        <h3 style="color: white;">
                            
                        <%out.println("Cashier Name: "+x);%>
                        </h3>
                        <div class="social_icon d-none d-lg-block"></div>
                        <h3 style="color: blue;">
                            
                        <%out.println("Cashier ID : "+cashier_id);%>
                        </h3>
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
<!-- Start Align Area -->
      <div>
          <h1 class="head">Smart Restro</h1>
          <div class="date"><h2>Date: <%out.println(date);%>
                  <span class="time">Time: <%out.println(time);%></span></h2></div>
          <div class="date"><h2>Order no: <%out.println(order);%>
                  <span class="time">Table_no: <%out.println(j);%></span></h2></div>
          <div class="date"><h2>Customer: <%out.println(y);%>
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
        Query="select * from dish_order natural join menu where order_no="+order;
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
        Query="select count(table_no) from bill where flag=0";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            count=rs.getInt("count(table_no)");
        }
    }
    catch(Exception e)
    {}
%>
      <div style="text-align: right; font-size: 50px; padding-right: 100px; font-weight: bold; font-family: sans-serif;">Your Total bill is : 
          <span class="bill">₹<%out.println(amount);%></span></div>
      <span class="paid">Change bill status: <a href="<%="Cashier_pay.jsp?cashier_id="+cashier_id+"$"+order%>" class="paida">PAID</a></span>
      <div style="height: 20px;"></div>
      <div style="height: 20px;"></div>
      
      <!-- End Align Area -->
      <!-- footer part start-->
      
      <footer class="footer-area ">
         <div class="container ">
            <div class="row justify-content-between ">
               <div class="col-xl-3 col-sm-6 col-md-3 col-lg-3 ">
                  <div class="single-footer-widget footer_1 " align="left">
                     <p>Contact Info</p>
                     <p>+91 98765 43210 </p>
                     <span>smartrestro@gmail.com</span>
                  </div>
               </div>
               <div class="col-xl-3 col-sm-6 col-md-2 col-lg-3 ">
                  <div class="single-footer-widget footer_2 ">
                     
                     <div class="smartres " align="center">
                        Smart Restro
                     </div>
                  </div>
               </div>
               <div class="col-xl-3 col-sm-6 col-md-2 col-lg-3 ">
                  <div class="single-footer-widget footer_2 " align="right">
                     <div class="social_icon d-none d-lg-block" align="right">
                        <p style="color: white;" align="right">
                            
                        <%out.println("Number of Customers");%>
                        <P>
                        <div class="social_icon d-none d-lg-block">
                        <p style="color: white;" align="right">
                            
                        <%out.println(" Present : "+count);%>
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