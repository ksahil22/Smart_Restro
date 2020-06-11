<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    Connection con=null;
    Statement stmt=null;
    String Query=new String(),a=new String();
    ResultSet rs=null;
    String x=new String(),y=new String();
    String name=new String(),password=new String(),username=new String(),user=new String(),Address=new String();
    String contactno=new String();
    int i=0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
        if(con!=null)
        {
        }
        stmt=con.createStatement();
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
    <title>Smart restaurant managment syatem better worl</title>
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
  <style>
      
      body{
    margin: 0;
    padding: 0;
    background: #fff;

    color: #fff;
    font-family: Arial;
    font-size: 12px;
}

.body{
    position: absolute;
    top: -20px;
    left: -20px;
    right: -40px;
    bottom: -40px;
    width: auto;
    height: auto;
    
    background-size: cover;
    -webkit-filter: blur(5px);
    z-index: 0;
}

.grad{
    position: absolute;
    top: -20px;
    left: -20px;
    right: -40px;
    bottom: -40px;
    width: auto;
    height: auto;
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
    z-index: 1;
    opacity: 0.7;
}

.header{
    position: absolute;
    top: calc(20% - 70px);
    left: calc(50% - 255px);
    z-index: 2;
}

.header div{
    float: left;
    color: #fff;
    font-family: 'Exo', sans-serif;
    font-size: 35px;
    font-weight: 200;
}

.header div span{
    color: #5379fa !important;
}

.login{
    position: absolute;
    top: calc(30% - 75px);
    left: calc(50% - 50px);
    height: 150px;
    width: 350px;
    padding: 10px;
    z-index: 2;
}

.login input[type=text]{
    width: 250px;
    height: 30px;
    background: transparent;
    border: 1px solid rgba(255,255,255,0.6);
    border-radius: 2px;
    color: #fff;
    font-family: 'Exo', sans-serif;
    font-size: 16px;
    font-weight: 400;
    padding:4px;
}

.login input[type=password]{
    width: 250px;
    height: 30px;
    background: transparent;
    border: 1px solid rgba(255,255,255,0.6);
    border-radius: 2px;
    color: #fff;
    font-family: 'Exo', sans-serif;
    font-size: 16px;
    font-weight: 400;
    padding: 4px;
    margin-top: 10px;
}

.login input[type=button]{
    width: 260px;
    height: 35px;
    background: #fff;
    border: 1px solid #fff;
    cursor: pointer;
    border-radius: 2px;
    color: #a18d6c;
    font-family: 'Exo', sans-serif;
    font-size: 16px;
    font-weight: 400;
    padding: 6px;
    margin-top: 10px;
}

.login input[type=button]:hover{
    opacity: 0.8;
}

.login input[type=button]:active{
    opacity: 0.6;
}

.login input[type=text]:focus{
    outline: none;
    border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
    outline: none;
    border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=button]:focus{
    outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
  </style>
  <body>     
    <!-- banner part start-->
    <section class="banner_part">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-7">
            <div class="banner_text">
                <center>
                    <table border="0" cellspacing="0" cellpadding="0" width="440">
                        <tr>
                            <font position="center" size="40" color="ffffff" face="Algerian">Smart resto</font>
                        </tr>
                        <br>
                        <tr>
                            <font position="center" size="5" color="ffffff" face="Times new roman">Customer Registration</font>
                        </tr>
                        <br>
                        <tr>
                    		<td class="bodyText">
                                    <p>Please fill required details and click on Submit</p>
                                </td>
                	</tr>
                    </table>
                    <form>
                        <table>
                            <tr>
                                <td colspan="2" >&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="32%"> Name: <font align="absmiddle">*</font></td>
                                <td align="left" ><input type="text" name="Name" maxlength="30" size="30" value="" title="Enter your name" required></td>
                            </tr>
                            <tr>
                                <td colspan="2" >&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="32%">Username: <font align="absmiddle">*</font></td>
                                <td align="left" ><input type="text" name="username" maxlength="15" size="30" value="" required>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" >&nbsp;</td>
                            </tr>
                            <tr> 
                                <td width="32%">Password: <font align="absmiddle">*</font></td>
                                <td align="left" ><input type="password" name="password" maxlength="16" minlength="8" size="30" value="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required></td>   
                            </tr>
                            <tr>
                                <td colspan="2" >&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="32%">Address: <font align="absmiddle">*</font></td>
                                <td align="left" width="51%"><input type="text_area" name="Address" maxlength="50" size="30" value="" required></td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="32%">Mobile No: </td>
                                <td align="left"><input type="tel" name="phone" maxlength="10" size="30" pattern="[789]{1}[0-9]{9}" title="Enter valid mobile number"></td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <table>
                                    <h2 align="center">
                                        <input type="submit" value="submit" name ="submit" style=" background-color: green; padding: 5px;"/><br>
                                        <input type="reset" value="clear" style="background-color: red; padding: 5px;"/>
                                    </h2>
                                </table>
                            </tr>    
                        </table>
                    </form>
                </center>
                <%
        a=request.getParameter("submit");
        if(a.equals("submit"))
        {
            username=request.getParameter("username");
            name=request.getParameter("Name");
            password=request.getParameter("password");
            Address=request.getParameter("Address");
            contactno=request.getParameter("contact_number");
        }
        Query="select * from customer where customer_id='"+username+"'";
        rs=stmt.executeQuery(Query);
        while(rs.next())
        {
            user=rs.getString("Customer_id");
        }
        if(user.equals(username))
        {
            out.println("!!!!USER IS ALREADY EXISTS!!!!");
        }
        else
        {
            Query="insert into customer values('"+username+"','"+password+"','"+name+"','"+Address+"')";
            stmt.executeUpdate(Query);
            response.sendRedirect("Login.jsp");
        }
    }
    catch(Exception e)
    {}
%>
                <div class="banner_text_iner">
                </div>
                </div>
            </div>
          </div>
        </div>
    </section> 
 
             
    <!-- banner part start-->

    
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