<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    int order=Integer.parseInt(request.getParameter("order"));
    Connection con=null;
    Statement stmt=null;
    String Query=new String();
    String x=new String(),y=new String();
    String[] menu=new String[6];
    int[] menu_id=new int[6];
    int[] sp=new int[6];
    ResultSet rs=null;
    int i=0;
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
        Query="select distinct category,category_id from base_menu;";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            menu[i]=rs.getString("category");
            menu_id[i]=rs.getInt("category_id");
            i++;
        }
        for(int k=0;k<i;k++)
        {
            Query="select min(starting_price) from base_menu where category_id="+menu_id[k];
            rs=stmt.executeQuery(Query);
            while(rs.next())
            {
                sp[k]=rs.getInt("min(starting_price)");
            }
        }
    }
    catch(Exception e)
    {}
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

    <!-- banner part start-->
    <section class="banner_part">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-7">
            <div class="banner_text">
              <div class="banner_text_iner">
                <h5>Expensive but the best</h5>
                <h1>Smart restaurant in center of the city</h1>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- banner part start-->

    <!-- about part start-->
    <section class="about_part">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-lg-12">
            <div class="about_part_iner">
              <div class="row align-items-center">
                <div class="col-lg-7">
                  <div class="about_text">
                    <h5>about us</h5>
                    <h2>Welcome to smart Restro </h2>
                    <p>
                      Good lights it very to above. Days image to sea. Over
                      there seasons and spirit beast in. Greater bearing
                      creepeth very behold fourth night morning seed moved.
                    </p>
                    <p>
                      Good lights it very to above. Days image to sea. Over
                      seasons and spirit beast in over greater bearing creepeth.
                    </p>
                  </div>
                </div>
                <div class="col-lg-5">
                  <div class="about_img">
                    <img src="img/about.png" alt="" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- about part end-->

    <!-- food_menu start-->
    <section class="food_menu">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="section_tittle">
                        <p>Popular Menu</p>
                        <h2>Delicious Food Menu</h2>
                    </div>
                </div>
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
                        <a href="<%="Sub_menu.jsp?order="+order+"$"+menu_id[j]%>">
                        <div class="single_food_item media">
                            <img src="img/food_menu/single_food_1.png" class="img-responsive" alt="...">
                            <div class="media-body align-self-center">
                            <h3><%out.println(menu[j]);%></h3>
                            <p>Be healthy eat vegiterian.</p>
                            <h5>From ₹<%out.println(sp[j]);%></h5>
                            </div>
                        </div>
                        </a>
<%
                            if(j==2)
                            {
%>
                                </div>
<%
                            }
                        }
%>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- food_menu part end-->

    <!-- intro_video_bg start-->
   
    <!-- intro_video_bg part start-->

    <!--::review_part start::-->
   
    <!--::review_part end::-->

    <!--::contact part css start::-->
    
    <!--::contact part css end::-->

    <!-- footer part start-->
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

    <!-- footer part end-->

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
