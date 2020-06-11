<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    int order=Integer.parseInt(request.getParameter("order"));
    Connection con=null;
    Statement stmt=null;
    String Query=new String();
    String x=new String(),y=new String();
    ResultSet rs=null;
    int size=0,vacancy=0,table_no=0,category=0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {}
        stmt=con.createStatement();
        Query="select * from login natural join customer where order_no="+order;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            x=rs.getString("customer_name");
            y=rs.getString("customer_id");
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
  </head>

  <body>
	<header class="main_menu home_menu">
		<div class="menub">
            <div class="container">
			<div class="row align-items-center">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light">
				<a class="navbar-brand" href="index.html">
				
				</a>
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
	
				<div
					class="collapse navbar-collapse main-menu-item justify-content-end"
					id="navbarSupportedContent"
				>
				
                     <div class="social_icon d-none d-lg-block">
                        <p style="color: white;">
                            
                        <%out.println("Customer Name: "+x);%>
                        <P>
                        <div class="social_icon d-none d-lg-block"></div>
                        <p style="color: blue;">
                        <%out.println("Customer ID  : "+y);%>
                        <P>
                        </div>
				</nav>
			</div>
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
                <p>#your table</p>
                <h2>Take Your table</h2>
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
      <section class="button-area">
         <div class="container box_1170 border-top-generic">
             <div class="align">
                 
            <h3 class="text-heading">Available tables are in blue colour click on your table to book it</h3>
             <a href="#" class="genric-btn success circle">Available</a>
             <a href="#" class="genric-btn danger circle">Booked</a>
             <div style="height: 20px;"></div>
<%
        Query="select * from tables ";
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
                <h2 class="text-heading">General</h2>
                <div class="button-group-area mt-40">
<%
            }
            else if(category==2 && table_no==25)
            {
%>
                <h2 class="text-heading">Lawn</h2>
                <div class="button-group-area mt-40">
<%
            }
            else if(category==3 && table_no==49)
            {
%>
                <h2 class="text-heading">Family</h2>
                <div class="button-group-area mt-40">
<%
            }
            else if(category==4 && table_no==73)
            {
%>
                <h2 class="text-heading">Pool</h2>
                <div class="button-group-area mt-40">
<%
            }
            if(size==2 && (table_no==1 || table_no==25 || table_no==49 || table_no==73))
            {
%>
                <p>Mini table for you size of 2 </p>
<%
            }
            else if(size==4 && (table_no==9 || table_no==33 || table_no==57 || table_no==81))
            {
%>
                <p>Table for your beloved family of 4</p>
<%
            }
            else if(size==6 && (table_no==17 || table_no==41 || table_no==65 || table_no==89))
            {
%>
                <p>Enjoy your meal with grand size of 6 </p>
<%
            }
            if(table_no%4==1)
            {
%>                
                <p>
<%
            }
            if(vacancy==0)
            {
%>
                <a href="<%="Table.jsp?order="+order+"$"+table_no%>" class="genric-btn success circle"><%out.println(table_no);%></a>
<%
            }
            else
            {
%>
                <a href="#" class="genric-btn danger circle"><%out.println(table_no);%></a>
<%
            }
            if(table_no%4==0)
            {
%>               
                </p>
<%
            }
            if(table_no%8==0)
            {
%>
                <br>
<%
            }
            if(table_no%24==0)
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
        }
        catch(Exception e)
        {}
%>
</section>
      <!-- End Align Area -->
      <!-- footer part start-->
 <style>
                       
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
                      <a href="<%="History.jsp?order"+order%>" style="color: aliceblue;">HISTORY</a>
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