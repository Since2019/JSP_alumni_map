<%@page import="stu.Students"%>
<%@page import="mapSearch.CoordinateBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%@page import="stu.CarInfo"%>
<%@page import="java.util.Vector" %>
<%@page import="stu.Site" %>
<%@page import="java.util.Random" %>
<% Vector<Site> site=CarInfo.getSiteList();
   
   Vector<Students> students=Students.getStudentList();
   
   int id=request.getParameter("id")==null?0:Integer.parseInt(request.getParameter("id"));
   String name=request.getParameter("name")==null?"":(request.getParameter("name"));
   Students searched=Students.searchByName(students,name);
   
   Vector<CarInfo> info=CarInfo.getCarInfo();
   int curId=request.getParameter("curId")==null?0:Integer.parseInt(request.getParameter("curId"));
   Random random=new Random();
   String danger=new String();
   for(int i=0;i<5;++i){
	   if(info.get(i).getSpeed()>=90){
		  if(!danger.isEmpty())
			  danger+=",";
          danger+=i;
	   }
   }
   if(danger.isEmpty())
	   danger="无";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" type="image/x-icon" href="img/favicon.jpg">
        <title>Student Infomation System</title>
		<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
        <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://a.alipayobjects.com/g/datavis/g2/2.2.4/g2.js"></script>
        <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <style type="text/css">
        body,html,#containerss{
        height: 700px;
        margin: 0px;
        }
        </style>
	</head>
	
	
	<body>
		
		<!--网站头部-->
		
		
					
					
					

		<div class="contmodal-header" style="background:#563d7c;">
			<div class="container">
		
				<h2><a href="infoHome.jsp"><strong style="color:#FFFFFF; font-size: 20px;"> 电子同学录 <br>by学以致用2528889836@qq.com</strong></a>
				
				<form class="navbar-form navbar-right" style="margin:0px;display:inline;" role="search" method="get" action="infoHome.jsp">
					<div class="form-group">
						<input type="text" name="name" class="form-control" placeholder="搜索同学姓名 "><br>
						     
						
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
					<li class="active">
						<a href="homepage.jsp"><strong style="font-size: 18px;"> Homepage </strong></a>
					</li>
					<li>
						<a href="stu_information.jsp" ><strong style="font-size: 18px;"> Student List </strong></a>
						<!--ul class="dropdown-menu">
		                    <li>ff</li>
		                </ul-->
					</li>
					<li>
						<a href="stu_information.jsp"><strong style="font-size: 18px;"> </strong></a>
					</li>
					
				</ul>

			</div>
			
			<div class="col-lg-3 list-group">
				 <table class="table">
			    	<caption style="color: red;"><a href="#"><strong>未填写提示</strong></a></caption>
			    	<tr class="danger">
			    		<th><%="此功能正在维护中"%></th>
			    	</tr>
			    </table>
				
			    <table class="table">
			    	<caption><a href="stu_information.jsp" target="_blank"><strong>当前同学信息</strong></a></caption>
			    	<thead>
		                <tr class="success">
			                <th><strong>类型</strong></th>
			                <th><strong>信息</strong></th>
		                </tr>
	                </thead>
	                <tbody>
	                	 <tr>
			                <th>学号</th>
			                <th><%=id%></th>
		                </tr>
		                
		                <tr>
			                <th>姓名</th>
			                <th><%=searched.getName()%></th>
		                </tr>
		                <tr>
			                <th>城市</th>
			                <th><%=searched.getCity()%></th>
		                </tr>
		                
		                <tr>
			                <th>学校</th>
			                <th><%=searched.getSchool()%></th>
		                </tr>
	                </tbody>
			    </table>
			    
			    
			    
			    <table class="table">
			    	<caption><a href="stu_information.jsp" target="_blank"><strong>距离曲线</strong></a></caption>
			    	<!-- 创建图表容器 -->
			    	<thead>
		                <tr>
			                <th id="c1"><strong>距离-同学 图表</strong></th>
		                </tr>
	                </thead>
			    	
                </table>
			    
			   
			</div>
			
			
			
		<!--显示地图-->
		
			<div class="col-lg-9">
				<div id="containerss" tabindex="0">
					
				</div>
			</div>
			
		</div>
		
		
		
		
		<!--地图js api-->
        <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=aac39f09b63373487ed9f2624b32d5ee"></script>
        <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
        <script type="text/javascript" src="https://lbs.amap.com/console/show/picker"></script>
        <script type="text/javascript">
        
        // 创建地图
	    var map = new AMap.Map('containerss', {
		    resizeEnable: true,
		    zoom: 5,
		    center: [113.247407, 23.144667]
	    });
	    
	 // 绘制路径折线
	    var lineArr = [
	        <%for(int i=0;i<students.size();++i){%>
	        [<%=students.get(i).getLongitude()%>, <%=students.get(i).getLatitude()%>],
	        <%}%>
	        ];
	 
        var polyline = new AMap.Polyline({
            path: lineArr,          //设置线覆盖物路径
            strokeColor: "#3366FF", //线颜色
            strokeOpacity: 1,       //线透明度
            strokeWeight: 5,        //线宽
            strokeStyle: "solid",   //线样式
            strokeDasharray: [10, 5] //补充线样式
        });
        polyline.setMap(map);
         
	    map.plugin(["AMap.Scale","AMap.MapType"], function() {
            map.addControl(new AMap.Scale());
            map.addControl(new AMap.MapType());
       });
	    
	   
	    
	         
	    // 地图覆盖物 位置 经纬度
        var lnglats = [
        <%for(int i=0;i<students.size();++i){%>
        [<%=students.get(i).getLongitude()%>, <%=students.get(i).getLatitude()%>],
        <%}%>
        ];
	    
	    ///infs[]:存储：人名-学校-城市
        var infs = [
        <%for(int i=0;i<students.size();++i){
        %>
        [<%="\""+students.get(i).getName()+"\""%>,<%="\""+students.get(i).getSchool()+"\""%>,<%="\""+students.get(i).getCity()+"\""%>],
        <%}%>
        ];
	    
          
        var infoWindow = new AMap.InfoWindow({ offset: new AMap.Pixel(0, -30) });

        for (var i = 0, marker; i < lnglats.length; i++) {
            var marker = new AMap.Marker({
                position: lnglats[i],
                map: map
            });
            
          
            	marker.content = '同学信息\n '+'亲爱的:' + infs[i][0] + '\n 在:'+infs[i][2]+' '+infs[i][1];
        
            
            marker.on('click', markerClick);
            marker.on('dblclick', markerClickDouble);
            marker.emit('click', {target: marker});
        }

        function markerClick(e) {
            infoWindow.setContent(e.target.content);
            infoWindow.open(map, e.target.getPosition());}
        function markerClickDouble(e) {
            alert(e.target.getPosition());}
        
        map.setFitView();
	    
        </script>
        
        
        <!-- 创建图表容器 -->
        <script>
        	var data = [
        {genre: 'p1', sold:<%=students.get(id).getId()%>},
        {genre: 'p2', sold:<%=students.get(id).getId()==1?info.get(id).getSpeed():(random.nextInt(110)%(70) + 40)%>},
        {genre: 'p3', sold:<%=info.get(id).getSite()==2?info.get(id).getSpeed():(random.nextInt(110)%(70) + 40)%>},
        {genre: 'p3', sold:<%=info.get(id).getSite()==3?info.get(id).getSpeed():(random.nextInt(110)%(70) + 40)%>},
        {genre: 'p5', sold: <%=info.get(id).getSite()==4?info.get(id).getSpeed():(random.nextInt(110)%(70) + 40)%>},
        {genre: 'p6', sold: <%=info.get(id).getSite()==5?info.get(id).getSpeed():(random.nextInt(110)%(70) + 40)%>},
        {genre: 'p7', sold: <%=info.get(id).getSite()==6?info.get(id).getSpeed():(random.nextInt(110)%(70) + 40)%>},
        {genre: 'p8', sold: <%=info.get(id).getSite()==7?info.get(id).getSpeed():(random.nextInt(110)%(70) + 40)%>},
        {genre: 'p9', sold: <%=info.get(id).getSite()==8?info.get(id).getSpeed():(random.nextInt(110)%(70) + 40)%>},
        {genre: 'p10', sold: <%=info.get(id).getSite()==9?info.get(id).getSpeed():(random.nextInt(110)%(70) + 40)%>},
      ]; // G2 对数据源格式的要求，仅仅是 JSON 数组，数组的每个元素是一个标准 JSON 对象。
      // Step 1: 创建 Chart 对象
      var chart = new G2.Chart({
        id: 'c1', // 指定图表容器 ID
        width : 300, // 指定图表宽度
        height : 300 // 指定图表高度
      });
      // Step 2: 载入数据源
      chart.source(data, {
        genre: {
          alias: '同学地点' // 列定义，定义该属性显示的别名
        },
        sold: {
          alias: '距离下一位同学(km)'
        }
      });
      // Step 3：创建图形语法，绘制柱状图，由 genre 和 sold 两个属性决定图形位置，genre 映射至 x 轴，sold 映射至 y 轴
      chart.interval().position('genre*sold').color('genre')
      // Step 4: 渲染图表复制代码
      chart.render();
        </script>
	</body>
</html>
