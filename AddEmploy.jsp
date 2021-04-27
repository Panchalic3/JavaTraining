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
	String cmd="select max(empno)+1 empno from Employ";
	PreparedStatement pst=con.prepareStatement(cmd);
	ResultSet rs=pst.executeQuery();
	rs.next();
	int empno=rs.getInt("empno");
%>
	<form method="get" action="AddEmploy.jsp">
		<table border="3" align="center">
			<tr>	
				<th>Employ No</th>
				<td>
					<input type="text"
					readonly="readonly"
					value=<%=empno %>
					 name="empno" />
				</td>
			</tr>
			<tr>
				<th>Employ Name</th>
				<td>
					<input type="text" name="name" />
				</td>
			</tr>
			<tr>
				<th>Gender</th>
				<td>
					<select name="gender">
						<option value="Male">Male</option>
						<option value="Female">Female</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>Department</th>
				<td>
					<select name="dept">
						<option value="Java">Java</option>
						<option value="Oracle">Oracle</option>
						<option value="Ui">UI</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>Designation</th>
				<td>
					<select name="desig">
						<option value="SE">SE</option>
						<option value="TSE">TSE</option>
						<option value="SSE">SSE</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>Salary</th>
				<td>
					<input type="number" name="basic" />
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="Insert" />
				</th>
			</tr>
		</table>
	</form>
	<%
		if (request.getParameter("empno") !=null && 
			request.getParameter("basic") !=null) {
			cmd = "insert into Employ(empno,name,gender,dept,desig,basic) " +
				" values(?,?,?,?,?,?)";
			pst = con.prepareStatement(cmd);
			pst.setInt(1, Integer.parseInt(request.getParameter("empno")));
			pst.setString(2, request.getParameter("name"));
			pst.setString(3, request.getParameter("gender"));
			pst.setString(4, request.getParameter("dept"));
			pst.setString(5, request.getParameter("desig"));
			pst.setInt(6, Integer.parseInt(request.getParameter("basic")));
			pst.executeUpdate();
	%>
		<jsp:forward page="EmployShow.jsp" />
	<%
		}
	%>
	
</body>
</html>