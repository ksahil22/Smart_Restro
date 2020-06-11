<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
    
<%
    int order=Integer.parseInt(request.getParameter("order"));
    Connection con=null;
    Statement stmt=null;
    String Query=new String(),a=new String();
    String x=new String(),y=new String();
    ResultSet rs=null;
    int count=0,i=0,j=0;
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
}
catch(Exception e)
{
}   
%>

<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="starability-minified/starability-all.min.css"/>

  <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Smart Restro </title>
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
          .rating {
            display: inline-block;
            position: relative;
            height: 50px;
            line-height: 50px;
            font-size: 50px;
            }

.rating label {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  cursor: pointer;
}

.rating label:last-child {
  position: static;
}

.rating label:nth-child(1) {
  z-index: 5;
}

.rating label:nth-child(2) {
  z-index: 4;
}

.rating label:nth-child(3) {
  z-index: 3;
}

.rating label:nth-child(4) {
  z-index: 2;
}

.rating label:nth-child(5) {
  z-index: 1;
}

.rating label input {
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
}

.rating label .icon {
  float: left;
  color: transparent;
}

.rating label:last-child .icon {
  color: #000;
}

.rating:not(:hover) label input:checked ~ .icon,
.rating:hover label:hover input ~ .icon {
  color: #ff0;
}

.rating label input:focus:not(:checked) ~ .icon:last-child {
  color: #000;
  text-shadow: 0 0 5px #09f;
}
        .cen{
            margin-left: auto;
            margin-right: auto;
            text-align: center;
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
	<!--::header part start::-->
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
                        </li>
                    <li class="nav-item">
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
    </header>
    
    <section class="breadcrumb breadcrumb_bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb_iner">
              <div class="breadcrumb_iner_item">
                 
                <p>just to go</p>
                <h2>feedback </h2>
                  
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
                        
    
    <html>
    <div class="hi">
      <h1 style="text-align: center;">Thank you taking our service </h1>
      <p style="text-align: center; height: 20px;">please give your valuable feedback</p>
          <div class="cen">
              <div style="height: 20px;"></div>
   <h2>how is our Hospitality</h2>
   <form method="get" action="<%="After_feedback.jsp?order="+order%>"><center>
    <!-- Change starability-basic to different class to see animations. -->
    <fieldset class="starability-basic">

      <input type="submit" id="rate1" name="rating" value="<%="1"+order%>" />
      <label for="rate1">1 star.</label>

      <input type="submit" id="rate2" name="rating" value="<%="2"+order%>" />
      <label for="rate2">2 stars.</label>

      <input type="submit" id="rate3" name="rating" value="<%="3"+order%>" />
      <label for="rate3">3 stars.</label>

      <input type="submit" id="rate4" name="rating" value="<%="4"+order%>" />
      <label for="rate4">4 stars.</label>

      <input type="submit" id="rate5" name="rating" value="<%="5"+order%>" />
      <label for="rate5">5 stars.</label>

      <span class="starability-focus-ring"></span>
    </fieldset>
       </center>
       </form>
  </div>
      </div>        
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
