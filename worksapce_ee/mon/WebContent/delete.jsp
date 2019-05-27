<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String id=request.getParameter("id");

	
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			System.out.println("id드 ㄹ어감"+id);
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String jdbcurl = "jdbc:oracle:thin:@localhost:1521:xe";
				conn = DriverManager.getConnection(jdbcurl, "hr", "1234");
				String sql = "DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				System.out.println(sql);
			    int result= pstmt.executeUpdate();
			    System.out.println("123");//db의 검색결과를 리턴해줌 (select문 사용할 때)
				//stmt.executeUpdate();;
				

				
			
			} catch (Exception e) {
				out.println("DB 연동 오류 : " + e.getMessage());
			}finally{
				
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