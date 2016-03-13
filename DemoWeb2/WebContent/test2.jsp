<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function doClick(){
	alert("doClick");
}
function doFocus(){
	alert("doFocus");
	document.getElementById("data");
	data.style.display="inline";  //顯示資料
//	data.style.display="none";  //隱藏資料	
}
function doBlur(){
	alert("doBlur");
}
function doMouseOver(){
	alert("doMouseOver");
}
function doMouseOut(){
	alert("doMouseOut");
}

var array=new Array("baseball","baseketball","valleyball");
//var array=["baseball","baseketball","valleyball"];

//for(var i=0;i<array.length;i++){
//	alert(array[i]);
//}

var product1=new Object(); //方法1
product1.name="Coca Cola";
product1.price=20;

var product2={"name":"Coca Cola","price":20};

//alert(product1.name);

function doClick2(){
	document.getElementById("img1").style.display="inline";
	setTimeout(function(){
		document.getElementById("img1").style.display="none"
	}, 10000);
}

<%--
function doClick3(){
	request=new XMLHttpRequest();
	request.open("GET","/LabWeb/pages/product.controller",true);
	request.send(null);
}

function doClick4(){
	var data="id=1&name="+encodeURIComponent("&test=52");
	console.log(data);
	request=new XMLHttpRequest();
	request.open("POST","/LabWeb/pages/product.controller",true);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	request.send(data);
}
--%>
function doDemo(){
	var demoNode=document.getElementById("demo");
	var number=Math.floor(Math.random()*100);
	demoNode.value=number;
}

</script>
</head>
<body>
<input type="button" value="Load" onclick="doClick2()">
<img id="img1" src="/LabWeb/img/ajax-loader.gif" style="display:none;">
<div style="display:inline;" id="data" onclick="doClick()" onmouseover="doMouseOver()" onmouseout="doMouseOut()">This is a test</div>
<input type="button" value="test" onfocus="doFocus()" onblur="doBlur()">

<hr>
<input id="demo" type="button" value="demo" onclick="doDemo()">
<input type="button" value="GET" onclick="doClick3()">
<input type="button" value="POST" onclick="doClick4()">

<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.*" %>
<%
Context ctx = new InitialContext();
DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/hentai");
Connection conn = dataSource.getConnection();
Statement stmt = conn.createStatement();
ResultSet rset = stmt.executeQuery("select * from dept");
while(rset.next()) {
	String col1 = rset.getString(1);
	String col2 = rset.getString(2);
	out.println("<h1>"+col1+","+col2+"</h1>");
}
rset.close();
stmt.close();
conn.close();
%>
</body>
</html>
