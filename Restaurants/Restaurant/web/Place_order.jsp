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
    String x=new String(),y=new String();
    String dish_type=new String();
    String dish_feature="";
    String[] orderIds;
    ResultSet rs=null;
    int[] Oids;
    String sub_category=new String(),cat=new String();
    i=0;
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
        Query="select * from base_menu where menu_id="+category;
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            sub_category=rs.getString("sub_category");
            cat=rs.getString("category");
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
    <title>Smart Restro</title>
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
                <p><%out.println(cat+"."+sub_category);%></p>
                <h2>Pick up your delighted dish</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	<!-- breadcrumb start-->
	
      <!-- Start Sample Area -->
<center>
<table align="centre" border="1px">
    <td width="300px">Dish Name</td>
    <td width="140px">Type</td>
    <td width="140px">Price</td>
    <td width="50px">Select</td>
</table>
</center>
<%
        Query="select count(dish_id) from Menu where dish_id between "+category+"00 and "+(category+1)+"00";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            i=rs.getInt("count(dish_id)");
        }
        Query="select count(dish_id) from temp_order where order_no="+order+" and dish_id between "+category+"00 and "+(category+1)+"00";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            i=i-rs.getInt("count(dish_id)");
        }
        orderIds=new String[i];
        Oids=new int[i];
        i=0;
        Query="select * from Menu where dish_id between "+category+"00 and "+(category+1)+"00 and dish_id not in(select dish_id from temp_order where order_no="+order+")";
        rs=stmt.executeQuery(Query);       
        while(rs.next())
        { 
%>
        <form method='post'>
        <center>
             <table border="1px">
        
         <tr align="centre">
                <td width="300px"><%=rs.getString("dish_name") %></td>
                <td width="140px"><%=rs.getString("dish_type") %></td>
                <td width="140px"><%=rs.getString("dish_price") %></td>
                <%Oids[i]=rs.getInt("dish_id");%>
                <td width="50px"><input type="checkbox" name="orders" VALUE="<%=i%>"/></td>
         </tr>
         
             </table> 
        
        <%
                i=i+1;
            }
        %>
        <input type="submit" name="action" value="Add More Dishes">
        <input type="submit" name="action" value="Place Order" >
        </center>
</form>
<%
        a=request.getParameter("action");
        try
        {
            orderIds=request.getParameterValues("orders");
            if(orderIds.length!=0)
            {
                for(int k=0;k<=orderIds.length;k++)
                {
                    if(k==orderIds.length)
                    {
                        break;
                    }
                    try
                    {
                        int s=Integer.parseInt(orderIds[k]);
                        try
                        {
                            Query="insert into temp_order values("+order+","+Oids[s]+",1,null)";
                            stmt.executeUpdate(Query);
                        }
                        catch(Exception e)
                        {
                        }
                    }
                    catch(NumberFormatException nfe)
                    {
                    }
                }
            }
        }
        catch(Exception e)
        {}
        if(a.equals("Add More Dishes"))
        {
            response.sendRedirect("Sub_menu.jsp?order="+order+"$"+category/10);
        }
        else if(a.equals("Place Order"))
        {
            response.sendRedirect("Confirm_order.jsp?order="+order);
        }
    }
    catch(Exception e)
    {
    }
%>
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
                      <a href="<%="History.jsp?order="+order%>" style="color: aliceblue;">HISTORY</a>
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