<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pass = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String mobi = request.getParameter("mobi");
    String role = request.getParameter("role");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/companydatabase","root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into registereduser(fname, lname, email, username, password, mobile, role, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pass + "','" + mobi + "','" + role + "', CURDATE())");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>