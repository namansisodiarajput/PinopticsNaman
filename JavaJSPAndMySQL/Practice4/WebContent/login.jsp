<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/companydatabase","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    String query = "SELECT * FROM registereduser WHERE username='" + userid  +"' AND password='" + pwd +"'";
    rs = st.executeQuery(query);// and password='" + pwd + "'
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        String rolevalue = rs.getString("role");
        if(rolevalue.contains("admin"))
        response.sendRedirect("success.jsp");
        if(rolevalue.contains("user"))
        response.sendRedirect("success2.jsp");
        System.out.println("hi");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>