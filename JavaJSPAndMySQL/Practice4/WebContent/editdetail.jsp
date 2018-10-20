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

if(x!= null && x.equals("update")) {
String username = request.getParameter("username");    
String oldcompname = request.getParameter("oldcompname");
String newcompname = request.getParameter("newcompname");    
String newcompaddr = request.getParameter("newcompaddr");
System.out.println(username+" "+oldcompname);


Statement st = con.createStatement();
    //ResultSet rs;
String query = "update usercompany set companyname='"+newcompname+"',companyaddr='"+newcompaddr+"' where username='"+username+"' and companyname='"+oldcompname+"'";
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

 <form method="post" action="editdetail.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">ENTER COMPANY DETAIL</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Enter User Name</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter Old Name For Company </td>
                        <td><input type="text" name="oldcompname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter New Name For Company</td>
                        <td><input type="text" name="newcompname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Enter New Address For Company</td>
                        <td><input type="text" name="newcompaddr" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="update" name="submit" /></td>
                        <td><a href="adminpage.jsp">GO BACK</a></td>
                    </tr>
                   
                </tbody>
            </table>
            </center>
        </form>

</body>
</html>