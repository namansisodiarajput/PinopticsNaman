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

if(x!= null && x.equals("confirm")) {
String compname = request.getParameter("compname");    
String compaddr = request.getParameter("compaddr");
//System.out.println(compname+" "+compaddr);
String name = (String) session.getAttribute("userid");


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

<form method="post" action="userpage.jsp">
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
                        <td colspan="2"> <a href="logout.jsp">LOG OUT!!!!!</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
        
 
 

 

 
 
 
 <table border="2">
<tr>
<th>USERNAME</th>
<th>COMPANYNAME</th>
<th>COMPANYADDRESS</th>
<th>APPROVAL</th>
</tr>
<%
try
{
	 String name = (String) session.getAttribute("userid");
	 String query = "select * from usercompany where username='" + name + "'";
	 Statement stmt=con.createStatement();
	 ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
    <tr><td><%=rs.getString("username") %></td>
    <td><%=rs.getString("companyname") %></td>
    <td><%=rs.getString("companyaddr") %></td>
    <td><%=rs.getBoolean("status")%></td></tr>
        <%
        //System.out.println("   "+rs.getInt("username")+"   "+);

}
%>
    </table>
    <%
    rs.close();
    stmt.close();
    //con.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }
 
%>

</body>
</html>