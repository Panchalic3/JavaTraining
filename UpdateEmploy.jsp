<%@page import="java.sql.ResultSet"%>
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
	Connection con = ConnectionHelper.getConnection();
	int empno = Integer.parseInt(request.getParameter("empno"));
	String cmd = "select * from Employ where empno=?";
	PreparedStatement pst = con.prepareStatement(cmd);
	pst.setInt(1, empno);
	ResultSet rs = pst.executeQuery();
	rs.next();
%>
	<form method="get" action="UpdateEmploy.jsp">
		<table border="3" align="center">
		<tr>
			<th colspan="2">
				Update Employ
			</th>
		</tr>
			<tr>
				<th>Employ No</th>
				<td>
					<input type="number" name="empno" readonly="readonly"
					 value=<%=rs.getInt("empno") %>
					 />
				</td>
			</tr>
			<tr>
				<th>Employ Name</th>
				<td>
					<input type="text" name="name"
						value=<%=rs.getString("name") %>
					 />
				</td>
			</tr>
			<tr>
				<th>Gender</th>
				<td>
					<input type="text" name="gender" 
					value=<%=rs.getString("gender") %>
					/>
				</td>
			</tr>
			<tr>
				<th>Department</th>
				<td>
					<input type="text" name="dept" 
						value=<%=rs.getString("dept") %>
					/>
				</td>
			</tr>
			<tr>
				<th>Designation</th>
				<td>
					<input type="text" name="desig" 
						value=<%=rs.getString("desig") %>
					/>
				</td>
			</tr>
			<tr>
				<th>Basic</th>
				<td>
					<input type="text" name="basic" 
						value=<%=rs.getInt("basic") %>
					/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="Update" />
				</th>
			</tr>
		</table>
	</form>
	<%
		if (request.getParameter("empno") !=null && request.getParameter("basic") !=null) {
			cmd ="Update Employ set Name=?, Gender=?, Dept=?, Desig=?, Basic=? " +
					 " Where Empno=?";
				pst = con.prepareStatement(cmd);
				pst.setString(1, request.getParameter("name"));
				pst.setString(2, request.getParameter("gender"));
				pst.setString(3, request.getParameter("dept"));
				pst.setString(4, request.getParameter("desig"));
				pst.setInt(5, Integer.parseInt(request.getParameter("basic")));
				pst.setInt(6, Integer.parseInt(request.getParameter("empno")));
				pst.executeUpdate();
	%>
		<jsp:forward page="EmployShow.jsp" />
	<%
		}
	%>
</body>
</html>