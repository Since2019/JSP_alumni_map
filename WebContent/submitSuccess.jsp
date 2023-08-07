<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>提交信息</title>
</head>
<body>
	<%
		Context ctx = null;
		DataSource ds = null;
		Statement stmt =null;
		ResultSet rs = null;
		Connection con = null;
		String name = request.getParameter("name").trim();
		String city = request.getParameter("city").trim();
		String school = request.getParameter("school").trim();
		String note = request.getParameter("note").trim();
		int id=Integer.parseInt((String)session.getAttribute("id"));
		try{
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ClassmateLogin");//ClassmateInfo是在创建连接池时自己创建的名字  语句功能找到配置的数据库
			con = ds.getConnection();//创建数据库连接
			stmt = con.createStatement();
			stmt.executeUpdate("UPDATE students SET "+"name='"+name+"',"+"school='"+school+"',note='"+note+"',city='"+city+"' WHERE id="+id);
			
			
			//获取学校坐标，先查找已输入的学校的名字
			mapSearch.CoordinateBean.setSchoolName(school);//看mapSearch.CoordinateBean
			//分别获取经纬度
			mapSearch.CoordinateBean.getSchoolLong();
			mapSearch.CoordinateBean.getSchoolLat();
			
			
			String scLong=mapSearch.CoordinateBean.getSchoolLong().toString();
			String scLat=mapSearch.CoordinateBean.getSchoolLong().toString();
			
			//修改数据库
			stmt.executeUpdate("UPDATE students SET "+"longitude='"+scLong+"',"+"latitude='"+scLat+"'WHERE id="+id);
			
			out.print("修改成功！");
			if(mapSearch.CoordinateBean.getSchoolLong()==null)
			{
				out.print("修改失败！"+"请输入正确的学校名称");
			}
		}catch(Exception e){
			if(mapSearch.CoordinateBean.getSchoolLong()==null)
				out.print("修改失败！"+"请输入正确的学校名称");//没有拿到学校坐标则显示是这种错误
			else
				out.print("修改失败！"+e);
			
		}finally{
			if(rs!=null)
				rs.close();
			if(stmt!=null)
				stmt.close();
			if(con!=null)
				con.close();
		}
	%>
	
</body>
</html>