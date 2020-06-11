<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String chef_id=request.getParameter("chef_id");
    Connection con=null;
    Statement stmt=null;
    String Query=new String(),x=new String(),name=new String(),speciality=new String();
    ResultSet rs=null;
    int[] srno=null;
    int count=0,i=0,j=0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {}
        stmt=con.createStatement();
        Query="select * from chef where chef_id='"+chef_id+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            name=rs.getString("chef_name");
            speciality=rs.getString("chef_s");
        }
        if(speciality.equals("1"))
        {
            speciality="Vegetarian";
        }
        else if(speciality.equals("4"))
        {
            speciality=" Non-Vegetarian";
        }
        else if(speciality.equals("2"))
        {
            speciality="South Indian";
        }
        else if(speciality.equals("3"))
        {
            speciality="Chinese";
        }
        else if(speciality.equals("5"))
        {
            speciality="Snacks";
        }
        else if(speciality.equals("6"))
        {
            speciality="Deserts";
        }
        else
        {
            speciality="Super Chef";
        }
        Query="select count(dish_id) from ready where flag=0 and chef_id='"+chef_id+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
           count=rs.getInt("count(dish_id)");
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
                    aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>

               
                <div class="collapse navbar-collapse main-menu-item justify-content-end" id="navbarSupportedContent">
                    
                </div>
                <div class="social_icon d-none d-lg-block">
                        <h3 style="color: white;">
                            
                        <%out.println("Speciality: "+speciality);%>
                        </h3>
                        <div class="social_icon d-none d-lg-block"></div>
                        <h3 style="color: blue;">
                            
                        <%out.println("Chef ID  : "+chef_id);%>
                        </h3>
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
                <p>cooking is my passion</p>
                <h2>lets cook</h2>
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
        <h1 >Dishes i want to make Today</h1><br> 
<%
    }
%>
        <div class="refresh">
          <a href="<%="Chef.jsp?chef_id="+chef_id%>">Refresh</a>
      </div>
      <br>
       
      
      <!-- End Sample Area -->
      <!-- Start Button -->
<%
    if(count!=0)
    {
%><div class="refresh">
          <a href="<%="Chef_pause.jsp?chef_id="+chef_id+"$1"%>">Pause order</a>
      </div>
      <p style="height: 20px;"></p>
        <div class="container box_1170">
            <p class="sample-text">please clean your hand and vegetables before use. press ready button of dish when its ready</p> 
            <p><%out.println("ALL THE BEST MR. "+name);%></p>
        </div>
        <div>
          <table>
              <tr>
                  <th width="100px">Dish no</th>
                   <th width="400px">Dish name</th>
                   <th width="500px">Descripsion</th>
                   <th width="100px">Quantity</th>
                  <th width="200px">Ready</th>
                  
              </tr>
<%
        Query="select * from ready natural join menu where chef_id='"+chef_id+"' and flag=0";
        rs=stmt.executeQuery(Query);
        while(count!=0 && rs.next())
        {
%>            
              <tr>
                  <th><%out.println(i+1);%></th>
                   <th><%out.println(rs.getString("dish_name"));%></th>
                   <th><%out.println(rs.getString("description"));%></th>
                   <th><%out.println(rs.getString("quantity"));%></th>
                   <th  style="width: 150px;"><a href="<%="Chef_ready.jsp?order="+rs.getInt("srno")%>" style="font-family: sans-serif;
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
 <div style="text-align: right; margin-right: 200px;">
          <a href="<%="Chef_pause.jsp?chef_id="+chef_id+"$2"%>" style=" text-color:black; background-color: coral; font-family: sans-serif; font-size: 30px;">Logout</a>
      </div>
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
                            
                        <%out.println("Number of Dishes");%>
                        <P>
                        <div class="social_icon d-none d-lg-block">
                        <p style="color: white;" align="right">
                            
                        <%out.println("to be Cooked : "+count);%>
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