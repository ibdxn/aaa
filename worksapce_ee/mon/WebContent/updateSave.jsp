<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script> function updateUser(id){
	var url="updateSave.jsp?id="+id;
	window.open(url,"정보","width=800,height=300,left=100,top=50");
}</script>
</head>
<body>
	<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String phone=request.getParameter("phone");
	String job=request.getParameter("job");
	
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String jdbcurl = "jdbc:oracle:thin:@localhost:1521:xe";
				conn = DriverManager.getConnection(jdbcurl, "hr", "1234");

				String sql = "UPDATE EMPLOYEES set EMPLOYEE_ID=?, EMAIL=?, FIRST_NAME=?, LAST_NAME=?, PHONE_NUMBER=?,JOB_ID=?, HIRE_DATE=sysdate";
				pstmt = conn.prepareStatement(sql); // sql 받아서 db에 접속해라 라는함수
			      System.out.println(pstmt.toString()); 

				//stmt.executeUpdate();  update customers set pass=?, name=? where id=?


				pstmt.setString(1, id); //물음표에 값을넣어라
				pstmt.setString(2, pw);
				pstmt.setString(3, fname);
				pstmt.setString(4, lname);
				pstmt.setString(5, phone);
				pstmt.setString(6, job);
				
			      pstmt.executeUpdate();// //sql실행해라
			
			} catch (Exception e) {
				out.println("DB 연동 오류 : " + e.getMessage());
			}finally{
				try{
				if(rs!=null){
					rs.close();
				}
				}catch(SQLException e){
					System.out.println(e.getMessage());
				}
				try{
					if(pstmt!=null){
						pstmt.close();
					}
					}catch(SQLException e){
						System.out.println(e.getMessage());
					}
				try{
					if(conn!=null){
						conn.close();
					}
					}catch(SQLException e){
						System.out.println(e.getMessage());
					}
			}
		%>
</body>
</html>