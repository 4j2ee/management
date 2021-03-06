<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link href="resources/css/comm.css" type="text/css" rel="stylesheet"/>
    <!-- 引入 Bootstrap -->
<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Magic suggest -->
<link href="//cdn.bootcss.com/magicsuggest/2.1.4/magicsuggest-min.css" rel="stylesheet">
<script src="//cdn.bootcss.com/magicsuggest/2.1.4/magicsuggest-min.js"></script>
<script>
$(document).ready(function(){
	$("form").submit(function(event){
	    event.preventDefault();
	  });
	$("button").click(function(){
		var k=$("#input1").val();
		$.ajax({url:"./wareQuery",
			type:"post",
			data:{sk:k},
			success:function(result){
				$("tbody").empty();
				if(result[0]==null){
					$("tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result)
					$("tbody").append("<tr><td>"+r+"</td><td>"+result[r].name+"</td><td>"+result[r].barcode+"</td><td>"+result[r].brand+
							"</td><td>"+result[r].unspsc+"</td><td>"+result[r].spec+"</td><td>"+result[r].life+"</td><td>"+result[r].other+"</td></tr>");
					}
		}});
	});
});
</script>
<title>商品查询</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<jsp:include page="head.jsp" flush="true"/>
	<div class="col-md-12 column">
	<div class="col-md-1 column"></div>
	<div class="col-md-10 column">
	<div class="tab-content">
			<br/>
			<form role="form" class="form-inline" >	
			<div class="form-group">
				<input type="text" class="form-control" id="input1" placeholder="条形码或商品名"/>
			</div>
			<button class="btn btn-default" id="b1">搜索</button>
			</form>
			<br/>
				<table class="table table-hover" id="t1">
				<thead>
					<tr>
						<th>
							序号
						</th>
						<th>
							商品名
						</th>
						<th>
							条形码
						</th>
						<th>
							品牌
						</th>
						<th>
						分类码
						</th>
						<th>
						规格
						</th>
						<th>
						保质期（天）
						</th>
						<th>
						备注信息
						</th>
					</tr>
				</thead>
				<tbody>							
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-1 column"></div>		
	</div>	
		<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>