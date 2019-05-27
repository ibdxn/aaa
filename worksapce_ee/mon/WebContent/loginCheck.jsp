<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
 <head>
<meta charset="UTF-8">
<title>loginCheck</title>
 </head>

 <body>
 <table border=1 width='100%'>
  <% 

  
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");

   
   out.println("ID ==> " + id);
   out.println("PW ==> " + pw);

   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;

   try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      String jdbcurl = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
      conn = DriverManager.getConnection(jdbcurl,"hr","1234");
      stmt = conn.createStatement();
      String sql = "SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = " + id + "AND EMAIL='" + pw + "' ";

      rs = stmt.executeQuery(sql);
      //stmt.executeUpdate();

      
   if(rs.next()){
         response.sendRedirect("List.jsp");
      }else {
      out.println("ID/PW가 정확하지 않습니다.");
      response.sendRedirect("login.jsp");

   }

   }catch(Exception e) {
      out.println("DB연동오류 : " + e.getMessage());
   }
   
   %>
   </table>

 </body>
</html>