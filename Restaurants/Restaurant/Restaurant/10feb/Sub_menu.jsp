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
    String Query=new String();
    ResultSet rs=null;
    String x=new String(),y=new String();
    String[] menu=new String[6];
    int[] menu_id=new int[6];
    int[] sp=new int[6];
    int k=0;
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
        Query="select sub_category,menu_id from base_menu where category_id="+category;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            menu[k]=rs.getString("sub_category");
            menu_id[k]=rs.getInt("menu_id");
            k++;
        }
        Query="select category from base_menu where category_id="+category;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            req=rs.getString("category");
        }
        for(int m=0;m<k;m++)
        {
            Query="select starting_price from base_menu where menu_id="+menu_id[m];
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                sp[m]=rs.getInt("starting_price");
            }
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
  </head>

  <body>
    <!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <p style="color: white;">SMART RESTRO</p>
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
    <!-- Header part end-->

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <p>Home.Menu</p>
                            <h2><%out.println(req+" Items");%></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- food menu part start-->
    <section class="food_menu">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="single-member">
                    <div class="row">
                        
                        <div class="col-sm-6 col-lg-6">
<%
                        for(int j=0;j<6;j++)
                        {
                            if(j==3)
                            {
%>
                                <div class="col-sm-6 col-lg-6">
<%
                            }
%>
                        <a href="<%="Place_order.jsp?order="+order+"$"+menu_id[j]%>">
                        <div class="single_food_item media">
                            <img src="<%="img/food_menu/single_food_"+(j+1)+".png"%>" class="img-responsive" alt="...">
                            <div class="media-body align-self-center">
                            <h3><%out.println(menu[j]);%></h3>
                            <h5>From ₹<%out.println(sp[j]);%></h5>
                            </div>
                        </div>
<%
                            if(j==2)
                            {
%>
                                </div>
<%
                            }
%>
                        </a>
<%       
                        }
%>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%
    }
    catch(Exception e)
    {
        out.println(e);
    }        
%>
    <!-- food menu part end-->

    <footer class="footer-area ">
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
    <!-- jquery plugins here-->
    <!-- jquery -->
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