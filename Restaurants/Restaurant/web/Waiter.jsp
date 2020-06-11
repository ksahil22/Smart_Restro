<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String waiter_id=request.getParameter("waiter_id");
    Connection con=null;
    Statement stmt=null,stmt1=null;
    String Query=new String(),Query1=new String(),x=new String(),name=new String(),speciality=new String();
    ResultSet rs=null,rs1=null;
    int[] srno=null;
    int count=0,i=0,j=0,c=0,o=0,m=0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {}
        stmt=con.createStatement();
        stmt1=con.createStatement();
        Query="select * from waiter where waiter_id='"+waiter_id+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            name=rs.getString("waiter_name");
            speciality=rs.getString("waiter_a");
        }
        if(speciality.equals("1"))
        {
            speciality="General";
        }
        else if(speciality.equals("2"))
        {
            speciality="Lawn";
        }
        else if(speciality.equals("3"))
        {
            speciality="Family";
        }
        else if(speciality.equals("4"))
        {
            speciality="Pool";
        }
        Query="select count(order_no) from serves where flag=0 and waiter_id='"+waiter_id+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
           count=rs.getInt("count(order_no)");
        }
        srno=new int[count];
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
          
        
          
          .history:hover{
              
              box-shadow: 4px 4px 6px 6px white;
              font-size: 35px;
              
          }
          .conf{
              color: aliceblue;
              font-size: 20px;
                text-decoration-color: aliceblue;
              
              
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
                table{
                    text-align: center;
                }
                h1{
                    text-align: center;
                    animation-name: dishes;
                    animation-duration: 2s;
                }
                
            .cont {
                display: flex;
                flex-direction: row;
            }
            .cont > div {
                flex: 1; 
            }
                
                @keyframes dishes{
                    from{font-size:80px;}
                    to{font-size: 35px;}
                   
                @keyframes welcome{
                    from{left: 200px; color: aqua;}
                    to{left: 10px; color: antiquewhite}
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
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse main-menu-item justify-content-end" id="navbarSupportedContent">
                        </div>
                        <div class="social_icon d-none d-lg-block">
                            <h4 style="color: white;">
                                <%out.println("Area: "+speciality);%>
                            </h4>
                            <div class="social_icon d-none d-lg-block"></div>
                            <h4 style="color: blue;">
                                <%out.println("Waiter ID  : "+waiter_id);%>
                            </h4>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <!-- breadcrumb start-->
	
      <section class="breadcrumb breadcrumb_bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb_iner">
              <div class="breadcrumb_iner_item">
                  <br>
                <p> carrying the happiness</p>
                <h2>Let's deliver the Moment</h2>
              </div>
            </div>
                <div class="wel">
                  <p class="wel"><%out.println("Welcome back Mr. "+name);%></p>
         </div>
          </div>
        </div>
      </div>
    </section>
	<!-- breadcrumb start-->
	<!-- Start Sample Area -->
<%
    if(count!=0)
    {
%>
        <h1>Dishes i am gonna carrying Today</h1><br> 
<%
    }
%>
<div class="cont">
    <div class="refresh">
        <a href="<%="Waiter.jsp?waiter_id="+waiter_id%>">Refresh</a>
    </div>
    <br>
      <!-- End Sample Area -->
      <!-- Start Button -->
<%
    if(count!=0)
    {
%>
    <div class="refresh">
        <a href="<%="Waiter_pause.jsp?waiter_id="+waiter_id+"$1"%>">Pause order</a>
    </div>
<%
    }
%>
    <div  style="text-align: right; margin-right: 200px;">
            <a href="<%="Waiter_pause.jsp?waiter_id="+waiter_id+"$2"%>" style=" text-color:black; background-color: coral; font-family: sans-serif; font-size: 25px;">Logout</a>
        </div>
</div>
<%
    if(count!=0)
    {
%>
        <p style="height: 20px;"></p>
        <div class="container box_1170">
            <p class="sample-text">please clean your hands. press Done of order when its ready</p> 
            <h3><%out.println("ALL THE BEST Mr. "+name);%></h3>
        </div>
        <div>
            <table>
                <tr>
                    <th width="50px">Sr. No.</th>
                    <th width="100px">Order no</th>
                    <th width="400px">Table no</th>
                    <th width="500px">Customer Name</th>
                    <th width="100px">Quantity</th>
                    <th width="200px">Ready</th>
                </tr>
                
<%
        Query="select * from serves natural join login natural join customer where waiter_id='"+waiter_id+"' and flag=0";
        rs=stmt.executeQuery(Query);
        while(count!=0 && rs.next())
        {
            c=rs.getInt("counter");
            o=rs.getInt("order_no");
            Query1="select count(dish_id) from ready where order_no="+o+" and counter="+c;
            rs1=stmt1.executeQuery(Query1);
            while(rs1.next())
            {
                m=rs1.getInt("count(dish_id)");
            }
%>            
                <tr>
                    <th><%out.println(i+1);%></th>
                    <th><%out.println(o);%></th>
                    <th><%out.println(rs.getString("table_no"));%></th>
                    <th><%out.println(rs.getString("customer_name"));%></th>
                    <th><%out.println(m);%></th>
                    <th  style="width: 150px;">
                        <a href="<%="Waiter_ready.jsp?order="+rs.getInt("srno")%>" 
                            style="font-family: sans-serif;
                                   font-size: 20px;
                                   background-color: aquamarine;
                                   height: 30px;
                                   width: 200px;
                                   text-align: center;">Ready</a></th>
                </tr>
<%  
            i=i+1;
        }
%>
            </table>
        </div>
        <br>
        <br>
<%    
    }
%>
        

<%
} 
catch (Exception e) {
out.println(e);
}
%>
      
      <!-- End Align Area -->
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
                            
                        <%out.println("Number of Orders");%>
                        <P>
                        <div class="social_icon d-none d-lg-block">
                        <p style="color: white;" align="right">
                            
                        <%out.println("to be Delivered : "+count);%>
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