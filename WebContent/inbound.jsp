<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" />
		<link rel="stylesheet" href="${ctx }/static/css/Site.css" />
		<link rel="stylesheet" href="${ctx }/static/css/zy.all.css" />
		<link rel="stylesheet" href="${ctx }/static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/css/amazeui.min.css" />
		<link rel="stylesheet" href="${ctx }/static/css/admin.css" />
		
		<link rel="stylesheet" href="${ctx }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ctx }/static/css/pagination.css" />
	</head>

	<body>
		<div class="dvcontent">

			<div>
				<!--tab start-->
				<div class="tabs" style="margin: 30px;">
					<div class="hd">
						<ul>
							<li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">查看商品</li>
	<li class="" style="box-sizing: initial;-webkit-box-sizing: initial;">添加商品</li>
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
												<th>商品描述 </th>
												<th>商品价格</th>
												<th>商品图片</th>
												<th>商品数量</th>
												<th>商品类型 </th>
											
												<th>编辑</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${pageInfo.list }" var="inbound">
												<tr>
													<td>${inbound.pid }</td>
													<td>${inbound.proName}</td>
													<td>${inbound.producttype.yName }</td>
													<td>${inbound.proDescrible }</td>
													
													<td>${inbound.proPrice }</td>
													<td>${inbound.proPhoto}</td>
													<td>${inbound.proNumber}</td>
													
													<td>${inbound.proType}</td>
													<td class="edit"><button onclick="btn_edit(${inbound.pid})" data-toggle="modal" data-target="#myModal"><i class="icon-edit bigger-120"></i>编辑</button></td>
													<td class="delete"><button onclick="btn_delete(${inbound.pid})"><i class="icon-trash bigger-120"></i>删除</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div id="div_pagination_bottom">
							            <nav aria-label="Page navigation">
							                <ul class="pagination">
							                     <li>
							                         <a href="${ctx}/inbound/getAllList?currpage=${pageInfo.pageNum-1}"
							                           aria-label="Previous">
							                             <span aria-hidden="true">&laquo;</span>
							                         </a>
							                     </li>
							                     <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							                         <c:if test="${page_Num == pageInfo.pageNum }">
							                             <li class="active"><a href="#" style="margin-top: 7px;">${ page_Num}</a></li>
							                        </c:if>
							                         <c:if test="${page_Num != pageInfo.pageNum }">
							                            <li>
							                                 <a style="margin-top: 7px;" href="${ctx}/inbound/getAllList?currpage=${ page_Num}">${ page_Num}</a>
							                            </li>
							                        </c:if>
							                     </c:forEach>
							                    <li>
							                        <a href="${ctx}/inbound/getAllList?currpage=${pageInfo.pageNum+1}"
							                            aria-label="Next">
							                             <span aria-hidden="true">&raquo;</span>
							                         </a>
							                    </li>
							                </ul>
							            </nav>
							        </div>
							        
							        <!--  1111-->
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
					<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4"
						style="padding-top: 30px;">
						<form class="am-form am-form-horizontal"
							action="saveInbound" method="post" id="saveForm">
						
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="商品名称" name="proName">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									分类ID</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="分类ID" name="yid">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品描述</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="商品描述" name="proDescrible">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品价格</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="商品价格" name="proPrice">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品图片</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="商品图片" name="proPhoto">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品数量</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="商品数量" name="proNumber">
										<small>10字以内...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品类型</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="商品类型" name="proType">
										<small>10字以内...</small>
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
		
		</div>
		<!-- content end -->
	</div>					<!--添加 end-->
							<!--end-->
						</ul>
					</div>
				</div>
				<!--tab end-->

			</div>
					<!-- 模态框（Modal）修改  -->
			 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改分类信息
					</h4>
				</div>
				<div class="modal-body">
					<form class="am-form am-form-horizontal" 
						id="updateForm" >
						<input type="hidden" name="pid" id="pid" value=""/>
										<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="proName" required
										placeholder="商品名称" name="proName">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									分类ID</label>
								<div class="am-u-sm-9">
									<input type="text" id="yid" required
										placeholder="分类ID" name="yid">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品描述</label>
								<div class="am-u-sm-9">
									<input type="text" id="proDescrible" required
										placeholder="商品描述" name="proDescrible">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品价格</label>
								<div class="am-u-sm-9">
									<input type="text" id="proPrice" required
										placeholder="商品价格" name="proPrice">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品图片</label>
								<div class="am-u-sm-9">
									<input type="text" id="proPhoto" required
										placeholder="商品图片" name="proPhoto">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品数量</label>
								<div class="am-u-sm-9">
									<input type="text" id="proNumber" required
										placeholder="商品数量" name="proNumber">
										<small>10字以内...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									商品类型</label>
								<div class="am-u-sm-9">
									<input type="text" id="proType" required
										placeholder="商品类型" name="proType">
										<small>10字以内...</small>
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
             <script type="text/javascript" src="${ctx }/static/js/jquery.pagination.js"></script>
			<script>
				var num = 1;
				$(function() {

				 	$(".tabs").slide({ trigger: "click" });
					$.ajax({
						url:"${ctx}/inbound/getTypeList",
						type:"GET",
						error:function(e){
							alert(e);
						}
					});
				/* $(function() {
				 	$(".tabs").slide({ trigger: "click" });
					$.get("${ctx}/inbound/getTypeList",function(data){
						$("#typeId1").append("<option value='0'>请选择分类</option>");
						 $("#typeId2").append("<option value='0'>请选择分类</option>");
						 $(data).each(function(){
							 var option = "<option value='"+this.tid+"'>"+this.typeName+"</option>";
							// 将创建的列表项添加到下拉列表中
							$("#typeId1").append(option);
							$("#typeId2").append(option);
						 });
					});
				}); */

	
				$("#butUpdate").click(function(){
					// 获得表单中的数据,获得表单中的所有数据
					//alert($("#updateForm").serialize());
					$.post("${ctx}/inbound/updateInbound",$("#updateForm").serialize(),function(data){
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
				
				
				
			}); 
			
			/* 	var btn_save = function() {
					$.ajax({
						type: "post",
						url: "${ctx}/inbound/saveInbound",
						data: $("#saveForm").serialize(),
						success: function(data) {
							if(data.result > 0) {
								$.jq_Alert({
									message: "添加成功",
									btnOktext: "确认",
									dialogModal: true,
									btnOkClick: function() {
										window.location.reload();
									}
								});
							}
						},
						error:function(t){
							alert(t);
						}
					});
				} */

				var btn_edit = function(id) {
					
					$.get("${ctx}/inbound/findInbound",{pid:id},function(data){
						/* alert(data);
						console.log(data); */
						// 将这个json对象中的数据设置到页面上
						window.setTimeout(function(){
							
							$("#pid").val(data.pid);
							$("#proName").val(data.proName);
							$("#yid").val(data.yid);
							$("#proDescrible").val(data.proDescrible);
							$("#proPrice").val(data.proPrice);
							$("#proPhoto").val(data.proPhoto);
							$("#proNumber").val(data.proNumber);
							$("#proType").val(data.proType);
							
						},1000)
					});
				}
				/* var btn_delete = function(id) {
					$.get("${ctx}/inbound/deleteInbound",{id:id},function(data){
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
				} */
				
				var btn_delete = function(id) {
					$.jq_Confirm({
						message: "您确定要删除吗?",
						btnOkClick: function() {
							$.ajax({
								type: "post",
								url: "${ctx}/inbound/deleteInbound",
								data: { id: id },
								dataType:"json",
								success: function(data) {
									if(data.result > 0) {
										$.jq_Alert({
											message: "删除成功",
											btnOkClick: function() {
												window.location.reload();
												// 使用Ajax去请求后台的数据
											}
										});
									}
								}
							});
						}
					});
				}
			</script>

		</div>
	</body>

</html>