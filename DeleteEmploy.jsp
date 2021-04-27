<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.java.mphasis.jsp.ConnectionHelper"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		int empno = Integer.parseInt(request.getParameter("empno"));
		Connection con = ConnectionHelper.getConnection();
		String cmd = "delete from Employ where empno=?";
		PreparedStatement pst = con.prepareStatement(cmd);
		pst.setInt(1, empno);
		pst.executeUpdate();
	%>
	<jsp:forward page="EmployShow.jsp" />
</body>
</html>