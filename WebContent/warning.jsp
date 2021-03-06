<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${ctx }/static/css/Site.css" />
		<link rel="stylesheet" href="${ctx }/static/css/zy.all.css" />
		<link rel="stylesheet" href="${ctx }/static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/css/amazeui.min.css" />
		<link rel="stylesheet" href="${ctx }/static/css/admin.css" />
		<link rel="stylesheet" href="${ctx }/static/css/bootstrap.css" />
	</head>

	<body>
		<div class="dvcontent">
			<div>
				<!--tab start-->
				<div class="tabs">
					<div class="hd">
						<ul>
							<li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">预警管理</li>
							<li class="" style="box-sizing: initial;-webkit-box-sizing: initial;">添加预警</li>
						</ul>
					</div>
					<div class="bd">
						<ul style="display: block;padding: 20px;">
							<li>
								<!--分页显示角色信息 start-->
								<div id="dv1">
									<table class="table" id="tbRecord">
										<thead>
											<tr>
												<th>编号</th>
												<th>商品名称</th>
												<th>商品分类</th>
												<th>备注</th>
												<th>预警数量</th>
												<th>编辑</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${wlist }" var="warn">
												<tr>
													<td>${warn.wid }</td>
													<td>${warn.stock.productName }</td>
													<td>${warn.type.typeName }</td>
													<td>${warn.remark }</td>
													<td>${warn.warnNum }</td>
													<td class="edit"><button onclick="btn_edit(${warn.wid })" data-toggle="modal" data-target="#myModal"><i class="icon-edit bigger-120"></i>编辑</button></td>
													<td class="delete"><button onclick="btn_delete(${warn.wid })"><i class="icon-trash bigger-120"></i>删除</button></td><!-- zddz -->
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>
								<!--分页显示角色信息 end-->
							</li>
						</ul>
						<ul class="theme-popbod dform" style="display: none;">
							<div class="am-cf admin-main" style="padding-top: 0px;">
								<!-- content start -->

								<div class="am-cf admin-main" style="padding-top: 0px;">
									<!-- content start -->
									<div class="admin-content">
										<div class="admin-content-body">

											<div class="am-g">
												<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">

												</div>
												<!-- zddz -->
												<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4" style="padding-top: 30px;">
													<form class="am-form am-form-horizontal" action="saveWarn" method="post">
														<div class="am-form-group">
															<label for="typeId1" class="am-u-sm-3 am-form-label">
								分类</label>
															<div class="am-u-sm-9">
																<select name="typeId" required id="typeId1">
																	<option value="0">请选择分类</option>
																</select><small>分类</small>
															</div>
														</div>
														<div class="am-form-group">
															<label for="productId1" class="am-u-sm-3 am-form-label">
																商品名称</label>
																<div class="am-u-sm-9">
																	<select name="sid" required id="productId1">
																		<option value="0">请选择商品</option>
																	</select><small>商品</small>
																</div>
														</div>

														<div class="am-form-group">
															<label for="editWarnNum" class="am-u-sm-3 am-form-label">
									数量</label>
															<div class="am-u-sm-9">
																<input type="text" id="editWarnNum" required placeholder="预警数量" name="warnNum">
																<small>预警数量</small>
															</div>
														</div>
														<div class="am-form-group">
															<label for="editRemark" class="am-u-sm-3 am-form-label">
									备注</label>
															<div class="am-u-sm-9">
																<textarea class="" rows="5" id="editRemark" name="remark" placeholder="输入备注"></textarea>
																<small>250字以内...</small>
															</div>
														</div>
														<div class="am-form-group">
															<div class="am-u-sm-9 am-u-sm-push-3">
																<input type="submit" class="am-btn am-btn-success" value="添加分类" />
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
										<footer class="admin-content-footer">
											<hr>
											<p class="am-padding-left"></p>
										</footer>
									</div>
									<!-- content end -->
								</div>
								<!--添加 end-->
						</ul>
						</div>
					</div>
					<!--tab end-->

				</div>
				<!-- 模态框（Modal）修改 zddz  -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="myModalLabel">
									修改预警信息
								</h4>
							</div>
							<div class="modal-body">
								<form class="am-form am-form-horizontal"
									id="updateForm" method="post">
									<input type="hidden" name="wid" id="wid" value=""/>
									<div class="am-form-group">
															<label for="user-email" class="am-u-sm-3 am-form-label">
								分类</label>
															<div class="am-u-sm-9">
																<select name="typeId" required id="typeId">
																	<%-- <option value="<input type="text" v></input>">请选择分类</option> --%>
                                                                    <option value="0">请选择</option>
																</select> <small>分类</small>
															</div>
														</div>
														<div class="am-form-group">
															<label for="user-email" class="am-u-sm-3 am-form-label">
																商品名称</label>
																<div class="am-u-sm-9">
																	<select name="typeName" required id="productId">
																		<option value="0">请选择商品</option>

																	</select> <small>商品</small>
																</div>
														</div>

														<div class="am-form-group">
															<label for="warnNum" class="am-u-sm-3 am-form-label">
									数量</label>
															<div class="am-u-sm-9">
																<input type="text" id="warnNum" required placeholder="预警数量" name="warnNum">
																<small>预警数量</small>
															</div>
														</div>
														<div class="am-form-group">
															<label for="remark" class="am-u-sm-3 am-form-label">
									备注</label>
															<div class="am-u-sm-9">
																<textarea class="" rows="5" id="remark" name="remark" placeholder="输入备注"></textarea>
																<small>250字以内...</small>
															</div>
														</div>
														
								</form>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
								<button type="button" class="btn btn-primary" id="butUpdate">
									提交更改
								</button>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->


				<script src="${ctx }/static/js/jquery.min.js" type="text/javascript"></script>
				<script src="${ctx }/static/js/plugs/Jqueryplugs.js" type="text/javascript"></script>
				<script src="${ctx }/static/js/_layout.js"></script>
				<script src="${ctx }/static/js/plugs/jquery.SuperSlide.source.js"></script>
				<script type="text/javascript" src="${ctx }/static/js/bootstrap.min.js"></script>
				<script>
				var num = 1;
				$(function() {

				 	$(".tabs").slide({ trigger: "click" });
					$.ajax({
						url:"${ctx}/warn/getWarnList",
						type:"GET",
						error:function(e){
							alert(e);
						}
						})
					});
					
				$("#butUpdate").click(function(){
					// 获得表单中的数据,获得表单中的所有数据
					//alert($("#updateForm").serialize());
					$.post("${ctx}/warn/updateWarn",$("#updateForm").serialize(),function(data){
						console.log(data.result)
						// 让模态框隐藏
						$("#myModal").modal("hide");
						if(data.result > 0){
							$.jq_Alert({
								message: "修改成功",
								btnOkClick: function() {
									// 使用Ajax去请求后台的数据
									window.location.reload();
								}
							});
						}else{
							$.jq_Alert({
								message: "修改失败",
								btnOkClick: function() {
									// 使用Ajax去请求后台的数据
									window.location.reload();
								}
							});
						}
					})
				
				
				
				
			}); 
					// 获得所有的分类信息
						$.get("${ctx}/stock/getTypeList",function(data){
							console.log("类型数据："+data);
							$(data).each(function(){
								$("#typeId").append("<option value='"+this.tid+"'>"+this.typeName+"</option>");
								$("#typeId1").append("<option value='"+this.tid+"'>"+this.typeName+"</option>");
							});
						});
						// 获得库存中的商品信息
						$.post("${ctx}/stock/getStockList",function(data){
							$(data).each(function(){
								$("#productId").append("<option value='"+this.sid+"'>"+this.productName+"</option>");
								$("#productId1").append("<option value='"+this.sid+"'>"+this.productName+"</option>");
							});
						});
					
				
					
							
					
					var btn_save = function() {
						var pid = $("#RawMaterialsTypePageId  option:selected").val();
						var name = $("#RawMaterialsTypeName").val();
						var desc = $("#RawMaterialsTypeDescription").val();
						var ramark = $("#Ramark").val();
						$.ajax({
							type: "post",
							url: "/RawMaterialsType/AddRawMaterialsType",
							data: { name: name, pid: pid, desc: desc, ramark: ramark },
							success: function(data) {
								if(data > 0) {
									$.jq_Alert({
										message: "添加成功",
										btnOktext: "确认",
										dialogModal: true,
										btnOkClick: function() {
											//$("#RawMaterialsTypeName").val("");
											//$("#RawMaterialsTypeDescription").val("");
											//$("#Ramark").val("");                           
											//page1();
											location.reload();

										}
									});
								}
							}
						});
						alert(t);
					}

					var btn_edit = function(id) {
						alert(id);
						$.get("${ctx}/warn/findById",{id:id},function(data){
							 /* alert(data);
							console.log(data); */
							// 将这个json对象中的数据设置到页面上
							window.setTimeout(function(){
								alert(data.wid)
								$("#wid").val(data.wid);
								 $.get("${ctx}/stock/getTypeList",function(data1){
								 $(data1).each(function(i){// i代表的是下标，下标从0开始
									 if(data.typeId==this.tid){
										 $("#typeId").find("option").eq(i+1).attr("selected","selected");
										 $("#productId").find("option").eq(i).attr("selected","selected");
									 }
								 });
							 });
								$("#editTypeName").val(data.typeName);
								$("#warnNum").val(data.warnNum);
								$("#remark").val(data.remark);
							},1000)
						});
					}
					var btn_delete = function(id) {
						$.get("${ctx}/warn/delWarn",{id:id},function(data){
							if(data.result > 0){
								$.jq_Confirm({
									message: "您确定要删除吗?",
									btnOkClick: function() {
										// 刷新页面
										location.reload();
									}
								});
							}
						});
					}
				</script>

			</div>
	</body>

</html>