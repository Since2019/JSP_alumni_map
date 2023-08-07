<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="stu.CarInfo"%>
<%@page import="java.util.Vector" %>
<%@page import="stu.Students" %>
<%@page import="stu.Site" %>

<% Vector<Site> site=CarInfo.getSiteList();
   Vector<Students> students=Students.getStudentList();
   int id=request.getParameter("curId")==null?0:Integer.parseInt(request.getParameter("curId"));

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" type="image/x-icon" href="img/favicon.jpg">
        <title>同学信息列表</title>
		<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
        <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <style type="text/css">
        body,html,#containerss{
        height: 600px;
        margin: 0px;
        }
        </style>
	</head>
	
	
	<body>
		
		<!--网站头部-->

		<div class="contmodal-header" style="background:#563d7c;">
			<div class="container">
		
				<h2><a href="infoHome.jsp"><strong style="color:#FFFFFF; font-size: 30px;">同学列表 </strong></a>
				
				<form class="navbar-form navbar-right" style="margin:0px;display:inline;" role="search" method="get" action="stu_information.jsp">
					<div class="form-group">
						<input type="text" name="id" class="form-control" placeholder="search all information ">
					</div>
					<button type="submit" class="btn btn-default" ><strong> Search </strong></button>
					
					
				    
				</form>
				
				</h2>
			</div>

		</div>
		
		<div class="container">
			
			<!--胶囊式导航-->
			<div class="row" style="margin-top: 5px;">
				<ul class="nav nav-tabs nav-tabs-justified">
					<li>
						<a href="infoHome.jsp"><strong style="font-size: 18px;"> Homepage </strong></a>
					</li>
					<li class="active">
						<a href="stu_information.jsp"><strong style="font-size: 18px;"> Student-information </strong></a>
						<!--ul class="dropdown-menu">
		                    <li>ff</li>
		                </ul-->
					</li>
										
				</ul>

			</div>
			
			<div class="list-group">
				
			    <table class="table">
			    	<caption><a style="text-decoration: none;"><strong>同学信息</strong></a></caption>
			    	
			    	<!--此处thead为表头，不用修改-->
			    	<thead>
		                <tr class="success">
		                	 <th><strong>Num</strong></th>
			                <th><strong>同学姓名</strong></th>
			                <th><strong>城市</strong></th>
			                <th><strong>学校</strong></th>
			                <th><strong>个性签名</strong></th>
			                <th><strong>学校经度</strong></th>
			                <th><strong>学校纬度</strong></th>
					 </tr>
	                </thead>
	                <tbody>



	                <!--此处循环，需修改-->
	                <%for(int i=1;i<students.size();++i){ %>
		                <tr>
			                <th><%=i%></th>
			                <th><%=students.get(i-1).getName()%></th>
			                <th><%=students.get(i-1).getCity()%></th>
			                <th><%=students.get(i-1).getSchool()%></th>
			                <th><%=students.get(i-1).getNote()%></th>
			              	<th><%=students.get(i-1).getLongitude()%></th>
			              	<th><%=students.get(i-1).getLatitude()%></th>
			           
		                </tr>
                    <%} %>


		                
	                </tbody>
			    </table>
			   
			</div>
				
		</div>
		
		
		
	
	</body>
</html>
