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

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/companydatabase","root", "");


%>

 <table border="2">
<tr>
<th>S.NO</th>
<th>COMPANY NAME</th>
<th>CREATED BY</th>
<th>COMPANY ADDRESS</th>
</tr>
<%
try
{
	 String name = (String) session.getAttribute("userid");
	 String query = "select * from usercompany";
	 Statement stmt=con.createStatement();
	 ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
    <tr><td><%=rs.getInt("S.NO") %></td>
    <td><%=rs.getString("companyname") %></td>
    <td><%=rs.getString("username") %></td>
    <td><%=rs.getString("companyaddr")%></td>
    </tr>
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

<input type="button" value="edit" 
    onclick="openPage('editdetail.jsp')"/>
<input type="button" value="delete" 
    onclick="openPage('deletedetail.jsp')" />
<input type="button" value="approve" 
    onclick="openPage('approvecompany.jsp')" />
    
<script type="text/javascript">
 function openPage(pageURL)
 {
 window.location.href = pageURL;
 }
</script>

<a href="logout.jsp">LOG OUT!!!!!</a>

</body>
</html>