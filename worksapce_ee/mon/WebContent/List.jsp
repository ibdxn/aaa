<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginCheck</title>
<script> 
function openwin(id){
	var url="popup.jsp?id="+id;
	window.open(url,"정보","width=800,height=300,left=100,top=50");
}
 function addUser(id){
	var url="insert.jsp?id="+id;
	window.open(url,"정보","width=800,height=300,left=100,top=50");
 }
 function updateUser(id){
		var url="update.jsp?id="+id;
	window.open(url,"정보","width=800,height=300,left=100,top=50");
 }
function deleteUser(id){
	var url="delete.jsp?id="+id;
	window.open(url,"정보","width=800,height=300,left=100,top=50");
}
</script>
</head>
<body>

	<table border=1 width="100%">

		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String jdbcurl = "jdbc:oracle:thin:@localhost:1521:xe";
				conn = DriverManager.getConnection(jdbcurl, "hr", "1234");
				stmt = conn.createStatement();
				String sql = "select * from EMPLOYEES order by EMPLOYEE_ID";
				rs = stmt.executeQuery(sql);//db의 검색결과를 리턴해줌 (select문 사용할 때)
				//stmt.executeUpdate();

				while (rs.next()) {
		%>
		<tr height="80">
			<td><%=rs.getString("EMPLOYEE_ID")%></td>
			<td><%=rs.getString("FIRST_NAME")%></td>
			<td><%=rs.getString("LAST_NAME")%></td>
		
			<td><%=rs.getString("EMAIL")%></td>
			
				<td>
				<button onClick="openwin(<%=rs.getString("EMPLOYEE_ID")%>)">클릭</button>
				</td>
				<td>
				<button onClick="deleteUser(<%=rs.getString("EMPLOYEE_ID")%>)">삭제</button>
				</td>
				<td>
				<button onClick="addUser(<%=rs.getString("EMPLOYEE_ID")%>)">추가</button>
				</td>
				<td>
				<button onClick="updateUser(<%=rs.getString("EMPLOYEE_ID")%>)">수정</button>
				</td>
			</td>
		</tr>
		<%
			}
			} catch (Exception e) {
				out.println("DB 연동 오류 : " + e.getMessage());
			}
		%>
	</table>
</body>
</html>