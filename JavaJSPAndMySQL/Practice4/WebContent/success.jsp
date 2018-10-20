<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome Admin<%=session.getAttribute("userid")%>
<a href="adminpage.jsp">Admin Page</a>
<%
    }
%>
