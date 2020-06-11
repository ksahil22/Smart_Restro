<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    String manager_id=request.getParameter("manager_id");
    Connection con=null;
    Statement stmt=null,stmt1=null;
    String Query=new String(),Query1=new String(),x=new String(),name=new String();
    ResultSet rs=null,rs1=null;
    int[] srno=null;
    int count=0,i=0,j=0,k=0,l=0,c=0,table_no=0,order_no=0,flag=0;
    String id="",na="";
    String b_chef=new String(),w_chef=new String(),b_waiter=new String(),w_waiter=new String();
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
                    .align{
                        display: inline;
                    
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
                  <p class="wel">Welcome Mr. <%out.println(name);%> </p>
         </div>
          </div>
        </div>
      </div>
         
    </section>
<%
        Query="select max(srno) from award";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            l=rs.getInt("max(srno)");
        }
        Query="select * from award where srno="+l;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            b_waiter=rs.getString("b_waiter");
            w_waiter=rs.getString("w_waiter");
            b_chef=rs.getString("b_chef");
            w_chef=rs.getString("w_chef");
        }
%>
         
    <div>
         <div style="height: 50px;"></div> 
          <h1>Current Chef of the Month</h1>
          <div style="height: 25px;"></div>
          <table>
              <tr style="  background-color: darkorange; box-shadow: 2px 2px 10px blue;">
                  <th colspan="4"> chefs</th>
                </tr>
              <tr>
                 <th >chef id</th>
                <th>chef name</th>
                
              </tr>
<%
        Query="select * from chef where chef_id="+b_chef;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            na=rs.getString("chef_name");
%>
                <tr>
                 <th ><%out.println(b_chef);%></th>
                <th><%out.println(na);%></th>
              </tr>
<%
        }
%>
          </table> 
      </div>
          <div>
         <div style="height: 50px;"></div> 
          <h1>Current Worst Chef of the Month</h1>
          <div style="height: 25px;"></div>
          <table>
              <tr style="  background-color: darkorange; box-shadow: 2px 2px 10px blue;">
                  <th colspan="4"> chefs</th>
                </tr>
              <tr>
                 <th >chef id</th>
                <th>chef name</th>
                
              </tr>
<%
        Query="select * from chef where chef_id="+w_chef;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            na=rs.getString("chef_name");
%>
                <tr>
                 <th ><%out.println(w_chef);%></th>
                <th><%out.println(na);%></th>
              </tr>
<%
        }
%>
          </table> 
      </div>
      <div>
         <div style="height: 50px;"></div> 
          <h1>Current Waiter of the Month</h1>
          <div style="height: 25px;"></div>
          <table>
              <tr style="  background-color: darkorange; box-shadow: 2px 2px 10px blue;">
                  <th colspan="4"> Waiter</th>
                </tr>
              <tr>
                 <th >Waiter id</th>
                <th>Waiter name</th>
                
              </tr>
<%
        Query="select * from waiter where waiter_id="+b_waiter;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            na=rs.getString("waiter_name");
%>
                <tr>
                 <th ><%out.println(b_waiter);%></th>
                <th><%out.println(na);%></th>
              </tr>
<%
        }
%>
          </table> 
      </div>
    <div>
         <div style="height: 50px;"></div> 
          <h1>Current Worst Waiter of the Month</h1>
          <div style="height: 25px;"></div>
          <table>
              <tr style="  background-color: darkorange; box-shadow: 2px 2px 10px blue;">
                  <th colspan="4"> Waiter</th>
                </tr>
              <tr>
                 <th >Waiter id</th>
                <th>Waiter name</th>
                
              </tr>
<%
        Query="select * from waiter where waiter_id="+w_waiter;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            na=rs.getString("waiter_name");
%>
                <tr>
                 <th ><%out.println(w_waiter);%></th>
                <th><%out.println(na);%></th>
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
                      </style>
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
