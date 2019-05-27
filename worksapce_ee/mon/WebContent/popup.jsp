<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginCheck</title>
<script> function openwin(id){
	var url="popup.jsp?id="+id;
	window.open(url,"정보","width=800,height=300,left=100,top=50");
}</script>
</head>
<body>
	<table border=1 width="100%">
		<%
	
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			String reqID=request.getParameter("id");

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String jdbcurl = "jdbc:oracle:thin:@localhost:1521:xe";
				conn = DriverManager.getConnection(jdbcurl, "hr", "1234");
				stmt = conn.createStatement();
				String sql = "select * from EMPLOYEES where EMPLOYEE_ID=" + reqID;
				rs = stmt.executeQuery(sql);//db의 검색결과를 리턴해줌 (select문 사용할 때)
				//stmt.executeUpdate();

				if (rs.next()) {
		%>
		<table border="1">
			<tr height="100">
				<td width="16%">ID</td>
				<td width="16%">이름</td>
				<td width="16%">성</td>
				<td width="16%">이메일(패스워드)</td>
				<td width="16%">전화번호</td>
				<td width="16%">업무</td>
			</tr>




			<tr>
				<td><%=rs.getString("EMPLOYEE_ID")%></td>
				<td><%=rs.getString("FIRST_NAME")%></td>
				<td><%=rs.getString("LAST_NAME")%></td>
				<td><%=rs.getString("EMAIL")%></td>
				<td><%=rs.getString("PHONE_NUMBER")%></td>
				<td><%=rs.getString("JOB_ID")%></td>
				</tr>
				</table>
		
				
			<%
				}
				} catch (Exception e) {
					out.println(e.getMessage());
				}
			%>
</body>
</html>