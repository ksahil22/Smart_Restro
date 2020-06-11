<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String cashier_id=request.getParameter("cashier_id");
    Connection con=null;
    Statement stmt=null,stmt1=null;
    String Query=new String(),x=new String(),Query1=new String(),cust_name=new String();
    ResultSet rs=null,rs1=null;
    int[] srno=null;
    int count=0,i=0,j=0,k=0,order=0;
    int size=0,vacancy=0,table_no=0,category=0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {}
        stmt=con.createStatement();
        stmt1=con.createStatement();
        Query="select * from cashier where cashier_id='"+cashier_id+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            x=rs.getString("cashier_name");
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
         p{
                margin-bottom:0.5cm;
            }
        .align
          {
              display: inline;
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
          .services{
              box-sizing: border-box;
              width: calc(100% /3);
              margin-left: 1%;
              white-space: nowrap;
              display: flex;
          }
          div{
              white-space: normal;
              flex-grow: 1;
              
          }
          #flex-container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            margin-right: 10px;
            width: 100%;
            weight: 1;
        }

        .flex-item {
            width: 10%;
            margin: 10px;
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
          
            @keyframes new{
                from{font-size: 250px;}
                to{font-size: 80px}
            }
            @keyframes bill{
                from{font-size: 50px; color: burlywood;}
                to{font-size: 50px; color: azure;}
            }
            .history:hover{
                box-shadow: 4px 4px 6px 6px white;
                font-size: 35px;
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
                  <br>
                <p> Power source for your beloved restaurent</p>
                <h2>Let's make some Money </h2>
              </div>
            </div>
              <div class="wel">
                  <p class="wel"><%out.println("Welcome back Mr. "+x    );%></p>
         </div>
          </div>
        </div>
      </div>
    </section>
	<!-- breadcrumb start-->
	
      <!-- Start Sample Area -->
      
      <!-- End Sample Area -->
      <!-- Start Button -->
      <section class="button-area">
         <div class="container box_1170 border-top-generic">
             <div class="service">
                 
            <h3 class="text-heading" align="center">Booked tables are in green color click on the table to vacate it</h3>
            <p align="center"><a href="#" class="genric-btn danger circle">Available</a>
                <a href="#" class="genric-btn success circle">Booked</a></p>
<%
        Query="select * from tables";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            size=rs.getInt("table_size");
            vacancy=rs.getInt("vacancy");
            table_no=rs.getInt("table_no");
            category=rs.getInt("category");            
            if(category==1 && table_no==1)
            {
%>
                <h2 class="text-heading" align="center">General</h2>
                <div id="flex-container">
                        
<%
            }
            else if(category==2 && table_no==19)
            {
%>
                <h2 class="text-heading" align="center">Lawn</h2>
                <div id="flex-container">
                       
<%
            }
            else if(category==3 && table_no==37)
            {
%>
                <h2 class="text-heading" align="center">Family</h2>
                <div id="flex-container">
                        
<%
            }
            else if(category==4 && table_no==55)
            {
%>
                <h2 class="text-heading" align="center">Pool</h2>
               <div id="flex-container">
<%
            }
            if(size==2 && (table_no==1 || table_no==19 || table_no==55 || table_no==37))
            {
%>
                <div class="flex-item">
                <p align="center">Mini table for you size of 2 </p>
<%
            }
            else if(size==4 && (table_no==7 || table_no==25 || table_no==43 || table_no==61))
            {
%>
                <div class="flex-item">
                <p align="center">Table for your beloved family of 4</p>
<%
            }
            else if(size==6 && (table_no==13 || table_no==31 || table_no==49 || table_no==67))
            {
%>
                <div class="flex-item">
                <p align="center">Enjoy your meal with grand size of 6 </p>
<%
            }
            if(table_no%3==1)
            {
%>                
                <p align="center">
<%
            }
            if(vacancy==0)
            {
%>
                <a href="#" class="genric-btn danger circle"><%out.println("VACANT");%></a>
<%
            }
            else
            {
                Query1="select * from bill natural join customer where flag=0 and table_no="+table_no;
                rs1=stmt1.executeQuery(Query1);
                while(rs1.next())
                {
                    cust_name=rs1.getString("customer_name");
                    order=rs1.getInt("order_no");
                }
                if(!cust_name.equals(""))
                {
%>
                <a href="<%="Cashier_bill.jsp?cashier_id="+cashier_id+"$"+order%>" class="genric-btn success circle"><%out.println(cust_name);%></a>
<%
                }
                else
                {
%>
                    <a href="#" class="genric-btn danger circle"><%out.println("VACANT");%></a>
<%              }
                cust_name="";
                order=0;
            }
            if(table_no%3==0)
            {
%>               
                </p>
<%
            }
            if(table_no%6==0)
            {
%>
                </div>
<%
            }
            if(table_no%18==0)
            {
%>
                </div>
<%
            }
        }
%>
            </div>
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
        {out.println(e);}
%>
<div style="text-align: right; margin-right: 200px;">
          <button onclick="f1()" style=" background-color: coral; font-family: sans-serif; font-size: 30px;">Logout</button>
      </div>
</section>
        <script>
function f1() {
    
   location.href ="Staff_login.jsp";
}
</script>
      <!-- End Align Area -->
      <!-- footer part start-->
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