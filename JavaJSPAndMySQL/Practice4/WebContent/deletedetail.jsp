<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<% 
String x = request.getParameter("submit");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/companydatabase","root", "");

if(x!= null && x.equals("delete")) {
String username = request.getParameter("username");    
String compname = request.getParameter("compname");
//System.out.println(username+" "+oldcompname);


Statement st = con.createStatement();
    //ResultSet rs;
String query = "delete from usercompany where username='"+username+"' and companyname='"+compname+"'";
int i = st.executeUpdate(query);
if (i > 0) {
        //session.setAttribute("userid", user);
      System.out.println("success");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
} else {
      System.out.println("unsuccessful");
}
    		
}
%>

 <form method="post" action="deletedetail.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">DELETE COMPANY</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Enter User Name</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter Company Name </td>
                        <td><input type="text" name="compname" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="delete" name="submit" /></td>
                        <td><a href="adminpage.jsp">GO BACK</a></td>
                    </tr>
                   
                </tbody>
            </table>
            </center>
        </form>

</body>
</html>