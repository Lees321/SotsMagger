<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
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
							<li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">查看用户</li>
	<li class="" style="box-sizing: initial;-webkit-box-sizing: initial;">添加用户</li>
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
												<th>用户ID</th>
												<th>用户名称</th>
												<th>用户密码</th>
												<th>性别</th>
												<th>用户邮箱</th>
												<th>手机号 </th>
												
												
												<th>用户头像</th>
												<th>创建时间</th>
												<th>编辑</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											
												<!-- <tr>
												<td>1</td>
												<td>商品1</td>
												<td>肉类</td>
												<td>1000</td>
												<td>2012-12-10</td>
												<td class="edit"><button onclick="btn_edit(1)"><i class="icon-edit bigger-120"></i>编辑</button></td>
												<td class="delete"><button onclick="btn_delete(1)"><i class="icon-trash bigger-120"></i>删除</button></td>
											</tr> -->
											<c:forEach items="${pageInfo.list}" var="boud">
												<tr>
													<td>${boud.userId }</td>
													<td>${boud.userName }</td>
													<td>${boud.userPassword }</td>
													<td>${boud.userGender }</td>
													<td>${boud.userEmail }</td>
													<td>${boud.userPhone }</td>
													<td>${boud.userPhoto }</td>		
													<td><f:formatDate value="${boud.createTime }" pattern="yyyy-MM-dd"/></td>									
													<td class="edit"><button onclick="btn_edit(${boud.userId })" data-toggle="modal" data-target="#myModal"><i class="icon-edit bigger-120"></i>编辑</button></td>
													<td class="delete"><button onclick="btn_delete(${boud.userId })"><i class="icon-trash bigger-120"></i>删除</button></td>
												</tr>
											</c:forEach>
											
										</tbody>
									
									</table>
									<!-- 分页 -->
									<div id="div_pagination_bottom">
							            <nav aria-label="Page navigation">
							                <ul class="pagination">
							                     <li>
							                         <a href="${ctx}/Yonghu/getUserList?currpage=${pageInfo.pageNum-1}"
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
							                                 <a style="margin-top: 7px;" href="${ctx}/Yonghu/getUserList?currpage=${ page_Num}">${ page_Num}</a>
							                            </li>
							                        </c:if>
							                     </c:forEach>
							                    <li>
							                        <a href="${ctx}/Yonghu/getUserList?currpage=${pageInfo.pageNum+1}"
							                            aria-label="Next">
							                             <span aria-hidden="true">&raquo;</span>
							                         </a>
							                    </li>
							                </ul>
							            </nav>
							        </div>
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
							action="${ctx }/Yonghu/addOutboud" method="post"  id="saveForm">
						
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="用户名称" name="userName">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户密码 </label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="用户密码" name="userPassword">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									性别</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="性别" name="userGender">
										<small>10字以内...</small>
								</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									邮箱</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="邮箱" name="userEmail">
										<small>10字以内...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									手机号</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="手机号" name="userPhone">
										<small>10字以内...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户头像</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="用户头像" name="userPhoto">
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
					<form class="am-form am-form-horizontal" action="updateOutboud" method="post"
						id="updateForm" >
						<input type="hidden" name="userId" id="userId" value=""/>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="userName" required
										placeholder="用户名称" name="userName">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户密码</label>
								<div class="am-u-sm-9">
									<input type="text" id="userPassword" required
										placeholder="用户密码" name="userPassword">
										<small>10字以内...</small>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									性别</label>
								<div class="am-u-sm-9">
									<input type="text" id="userGender" required
										placeholder="性别" name="userGender">
										<small>10字以内...</small>
								</div>
								</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									邮箱</label>
								<div class="am-u-sm-9">
									<input type="text" id="userEmail" required
										placeholder="邮箱" name="userEmail">
										<small>10字以内...</small>
								</div>
							</div>
					<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									手机号</label>
								<div class="am-u-sm-9">
									<input type="text" id="userPhone" required
										placeholder="手机号" name="userPhone">
										<small>10字以内...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户头像</label>
								<div class="am-u-sm-9">
									<input type="text" id="userPhoto" required
										placeholder="用户头像" name="userPhoto">
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
						url:"${ctx}/Yonghu/getUserList",
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
					$.post("${ctx}/Yonghu/updateOutboud",$("#updateForm").serialize(),function(data){
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
			
				/* var btn_save = function() {
					$.ajax({
						type: "post",
						url: "${ctx}/boud/addOutboud",
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
						
					});alert("hhhh");
				} */

				var btn_edit = function(id) {
					
					$.get("${ctx}/Yonghu/findById",{id:id},function(data){
						/* alert(data);
						console.log(data); */
						// 将这个json对象中的数据设置到页面上
						window.setTimeout(function(){
							
							$("#userId").val(data.userId);
							$("#userName").val(data.userName);
							$("#userPassword").val(data.userPassword);
							$("#userGender").val(data.userGender);
							$("#userEmail").val(data.userEmail);
							$("#userPhone").val(data.userPhone);
							$("#userPhoto").val(data.userPhoto);
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
								type: "get",
								url: "${ctx}/Yonghu/delUser",
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