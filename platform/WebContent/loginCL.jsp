<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginCL</title>
</head>
<body>
	
<%
	String referer = request.getHeader("Referer");
	if(referer==null||referer.trim().length()==0||
	!referer.equals("http://localhost:8080/platform/login.jsp")){
		response.sendRedirect("login.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	String name=request.getParameter("user_id");
	String password=request.getParameter("user_password");
	String type=request.getParameter("type");
	
	boolean flag=false;
	try{
		  Connection conn=null;
		  PreparedStatement prestmt=null;
		  ResultSet rs=null;
		  //加载驱动程序，下面的代码加载MySQL驱动程序
		  Class.forName("com.mysql.jdbc.Driver");
		  //注册MySQL驱动程序
		  DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		  //用适当的驱动程序连接到数据库
		  String dbUrl =  "jdbc:mysql://localhost:3306/project?useUnicode=true&characterEncoding=utf8";
		  String dbUser="jc";
		  String dbPwd="1234";
		  //建立数据库连接
		  conn = java.sql.DriverManager.getConnection(dbUrl,dbUser,dbPwd);
		  //创建一个SQL声明
		  switch(type){
		  case "student":
			  prestmt = conn.prepareStatement("select * from student where user_id=? and user_pw=?");
			  prestmt.setString(1, name);
			  prestmt.setString(2, password);
			  
			  rs=prestmt.executeQuery();
			  if(rs.next()){
				  flag=true;
			      out.print("<script language='javascript'>alert('登录成功');window.location.href='student.jsp';</script>"); 
			  }
			  break;
		  case "root":
			  prestmt = conn.prepareStatement("select * from root where user_id=? and user_pw=?");
			  prestmt.setString(1, name);
			  prestmt.setString(2, password);
			  
			  rs=prestmt.executeQuery();
			  if(rs.next()){
				  flag=true;
				    out.print("<script language='javascript'>alert('登录成功');window.location.href='root.jsp';</script>"); 
			  }
			  break;
		  case "review":
			  prestmt = conn.prepareStatement("select * from review where user_id=? and user_pw=?");
			  prestmt.setString(1, name);
			  prestmt.setString(2, password);
			  
			  rs=prestmt.executeQuery();
			  if(rs.next()){
				  flag=true;
				    out.print("<script language='javascript'>alert('登录成功');window.location.href='review.jsp';</script>"); 

			  }
			  break;
		  default:
			  prestmt = conn.prepareStatement("select * from guidance where user_id=? and user_pw=?");
			  prestmt.setString(1, name);
			  prestmt.setString(2, password);
			  
			  rs=prestmt.executeQuery();
			  if(rs.next()){
				  flag=true;
				    out.print("<script language='javascript'>alert('登录成功');window.location.href='guidance.jsp';</script>"); 
			  }
		  }
		  
		  //关闭数据库连接
		  rs.close();
		  prestmt.close();
		  conn.close();
		}catch(Exception e){out.println(e.getMessage());}
	//out.println(type+" "+name+" "+password+" "+flag);
	
	//判断登陆界面的用户名和密码，根据输入的不同情况进行不同的处理
    if(!flag)
	{
	//request.setAttribute("usertxt", "正常登录！！！");
	//request.getRequestDispatcher("success.jsp").forward(request, response);
    out.print("<script language='javascript'>alert('密码错误');window.location.href='login.jsp';</script>"); 

	}
	

%>

  </body>

</html>
