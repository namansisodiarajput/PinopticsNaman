<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome User<%=session.getAttribute("userid")%>
<a href="userpage.jsp">User Page</a>
<%
    }
%>
