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
if(x!= null && x.equals("confirm")) {
String compname = request.getParameter("compname");    
String compaddr = request.getParameter("compaddr");
//System.out.println(compname+" "+compaddr);
String name = "jatin";

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/companydatabase","root", "");
Statement st = con.createStatement();
    //ResultSet rs;
String query = "insert into usercompany(username,companyname,companyaddr) values ('" + name + "','" + compname + "','" + compaddr + "')";
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

<form method="post" action="Practice.jsp">
            <center>
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Create Company</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Company Name</td>
                        <td><input type="text" name="compname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Company address</td>
                        <td><input type="text" name="compaddr" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="confirm" name="submit"/></td>
                        <td><input type="reset" value="Cancel" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Yet Not Registered!! <a href="reg.jsp">Register Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>

</body>
</html>