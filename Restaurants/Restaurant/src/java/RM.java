/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

/**
 *
 * @author PC11
 */
public class RM extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String menu=request.getParameter("menuname");
        String price=request.getParameter("price");
        String type=request.getParameter("mt");
       //String un=request.getParameter("t1");
       //  String pw=request.getParameter("t2");
        PrintWriter out = response.getWriter();
        try  {
            /* TODO output your page here. You may use following sample code. */
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rest","root","root");
           
           Statement stmt=con.createStatement();
          // stmt.executeUpdate("insert into restmenu values('"+menu+"','"+price+"','"+type+"' )");
           //out.println("Succefully Entered");
           //out.print("Hello "+un);
          // out.print("Your Password is "+pw);
           //response.sendRedirect("home");
           String act = request.getParameter("act");
            if (act == null) {
    //no button has been selected
            } else if (act.equals("Save")) {
                 // Execute SQL query
         Statement stm= con.createStatement();
         String sql;
         sql = "SELECT * FROM restmenu";
         ResultSet rs = stm.executeQuery(sql);

         // Extract data from result set
         while(rs.next()){
            //Retrieve by column name
          //  int id  = rs.getInt("id");
           // int age = rs.getInt("age");
            String first = rs.getString("menu");
            String last = rs.getString("price");
            int i=Integer.parseInt(last);
            i=i+100;
            //Display values
           // out.println("ID: " + id + "<br>");
           // out.println(", Age: " + age + "<br>");
            out.println(", First: " + first + "<br>");
            out.println(", Last: " + i + "<br>");
         }
         out.println("</body></html>");

         // Clean-up environment
         rs.close();
         stmt.close();
    //delete button was pressed
            } else if (act.equals("update")) {
                stmt.executeUpdate("insert into restmenu values('"+menu+"','"+price+"','"+type+"' )");
           out.println("Succefully update Entered");
    //update button was pressed
            } else {
    //someone has altered the HTML and sent a different value!
            }
           //Creating two cookies
          /*Cookie c1=new Cookie("userName",un);
          Cookie c2=new Cookie("userPassword",pw);

          //Adding the cookies to response header
          response.addCookie(c1);
          response.addCookie(c2);
          out.print("<br><a href='welcome'>View Details</a>");*/
          //out.close();
           con.close();
           
        }
        catch(Exception e){ out.println(e);}
        
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
