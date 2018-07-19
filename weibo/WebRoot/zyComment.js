
var fCode = 0;
function createFormCommentHtml(self){
	// 先添加父容器
	$(self).append('<div id="commentFrom"></div>');
	
	// 组织发表评论的form html代码
	var boxHtml = '';
	boxHtml += '<form id="replyBoxAri" class="ui reply form">';
	boxHtml += '	<div class="ui large form ">';
	boxHtml += '		<div class="two fields">';
	boxHtml += '			<div class="field" >';
	boxHtml += '				<input type="text" id="userName" />';
	boxHtml += '				<label class="userNameLabel" for="userName">Your Name</label>';
	boxHtml += '			</div>';
	boxHtml += '			<div class="field" >';
	boxHtml += '				<input type="text" id="userEmail" />';
	boxHtml += '				<label class="userEmailLabel" for="userName">E-mail</label>';
	boxHtml += '			</div>';
	boxHtml += '		</div>';
	boxHtml += '		<div class="contentField field" >';
	boxHtml += '			<textarea id="commentContent"></textarea>';
	boxHtml += '			<label class="commentContentLabel" for="commentContent">Content</label>';
	boxHtml += '		</div>';
	boxHtml += '		<div id="submitComment" class="ui button teal submit labeled icon">';
	boxHtml += '			<i class="icon edit"></i> 提交评论';
	boxHtml += '		</div>';
	boxHtml += '	</div>';
	boxHtml += '</form>';
	$("#commentFrom").append(boxHtml);
	
	// 初始化html之后绑定点击事件
	 addEvent(self);
};

function addEvent(self){
	// 绑定item上的回复事件
	replyClickEvent(self);
	
	// 绑定item上的取消回复事件
	cancelReplyClickEvent(self);
	
	// 绑定回复框的事件
	addFormEvent(self);
};
/**
 * 功能: 绑定item上的回复事件
 * 参数: 无
 * 返回: 无
 */
function replyClickEvent(self){
	// 绑定回复按钮点击事件
	$(self).find(".actions .reply").live("click", function(){
		// 设置当前回复的评论的id
		fCode = $(this).attr("selfid");
		
		// 1.移除之前的取消回复按钮
		$(self).find(".cancel").remove();
		
		// 2.移除所有回复框
		removeAllCommentFrom(self);
		
		// 3.添加取消回复按钮
		$(this).parent(".actions").append('<a class="cancel" href="javascript:void(0)">取消回复</a>');
		
		// 4.添加回复下的回复框
		addReplyCommentFrom(self,$(this).attr("selfID"));
		
		// 绑定提交事件
		$("#publicComment").die("click");
		$("#publicComment").live("click",function(){
			var param = {
					"c.author":$("#userName").val(),
					"c.content":$("#commentContent").val(),
					"c.wfrom":Number(fCode),
					"c.weiboid":1,
					"c.wtype":"comment"
					// "name":$("#userName").val(),
					// "email":$("#userEmail").val(),
					// "content":$("#commentContent").val()
			}
			
			$.ajax({
				type:"post",
				url:"test2.action",
				data:param,
				success:function(data){
					if(data.success){
						alert(data.msg);
						window.location.reload();
					}
					else{
						alert(data.msg);
					}
				}
			})
		});
	});
	
};

/**
 * 功能: 绑定item上的取消回复事件
 * 参数: 无
 * 返回: 无
 */
function cancelReplyClickEvent (self){
	$(self).find(".actions .cancel").die("click");
	$(self).find(".actions .cancel").live("click", function(){
		// 1.移除之前的取消回复按钮
		$(self).find(".cancel").remove();
		
		// 2.移除所有回复框
		removeAllCommentFrom(self);
		
		// 3.添加根下的回复框
		addRootCommentFrom(self);
	});
};

/**
 * 功能: 绑定回复框的事件
 * 参数: 无
 * 返回: 无
 */
function addFormEvent  (self){
	// 先解除绑定
	$("textarea,input").die("focus");
	$("textarea,input").die("blur");
	// 绑定回复框效果
	$("textarea,input").live("focus",function(){
		// 移除 失去焦点class样式，添加获取焦点样式
		$(this).next("label").removeClass("blur-foucs").addClass("foucs"); 
	}).live("blur",function(){
		// 如果文本框没有值
		if($(this).val()==''){ 
			// 移除获取焦点样式添加原生样式
			if($(this).attr("id")=="commentContent"){
				$(this).next("label").removeClass("foucs").addClass("areadefault"); 
			}else{
				$(this).next("label").removeClass("foucs").addClass("inputdefault"); 
			}
		}else{  // 有值 添加失去焦点class样式
			$(this).next("label").addClass("blur-foucs");
		}
	});
	
	// 绑定提交事件
	$("#submitComment").die("click");
	$("#submitComment").live("click",function(){
		var param = {
			"c.author":$("#userName").val(),
			"c.content":$("#commentContent").val(),
			"c.wfrom":1,
			"c.weiboid":1,
			"c.wtype":"weibo"
			// "name":$("#userName").val(),
			// "email":$("#userEmail").val(),
			// "content":$("#commentContent").val()
	}
	$.ajax({
		type:"post",
		url:"test2.action",
		data:param,
		success:function(data){
			if(data.success){
				alert(data.msg);
				window.location.reload();
			}
			else{
				alert(data.msg);
			}
		}
	})
	});
};

// 移除所有回复框
function removeAllCommentFrom(self){
	// 移除评论下的回复框
	if($(self).find("#replyBox")[0]){
		// 删除评论回复框
		$(self).find("#replyBox").remove();
	}
	
	// 删除文章回复框
	if($(self).find("#replyBoxAri")[0]){
		$(self).find("#replyBoxAri").remove();
	}
};

// 添加回复下的回复框
function addReplyCommentFrom (self,id){
	var boxHtml = '';
	boxHtml += '<form id="replyBox" class="ui reply form">';
	boxHtml += '	<div class="ui  form ">';
	//boxHtml += '		<div class="two fields">'
	boxHtml += '			<div class="field" >';
	boxHtml += '				<input type="text" id="userName" />';
	boxHtml += '				<label class="userNameLabel" for="userName">Your Name</label>';
	boxHtml += '			</div>';
	boxHtml += '			<div class="field" >';
	boxHtml += '				<input type="text" id="userEmail" />';
	boxHtml += '				<label class="userEmailLabel" for="userName">E-mail</label>';
	boxHtml += '			</div>';
	//boxHtml += '		</div>';
	boxHtml += '		<div class="contentField field" >';
	boxHtml += '			<textarea id="commentContent"></textarea>';
	boxHtml += '			<label class="commentContentLabel" for="commentContent">Content</label>';
	boxHtml += '		</div>';
	boxHtml += '		<div id="publicComment" class="ui button teal submit labeled icon">';
	boxHtml += '			<i class="icon edit"></i> 提交评论';
	boxHtml += '		</div>';
	boxHtml += '	</div>';
	boxHtml += '</form>';
	
	$(self).find("#comment"+id).find(">.content").after(boxHtml);
	
};

// 添加根下的回复框
function addRootCommentFrom (self){
	var boxHtml = '';
	boxHtml += '<form id="replyBoxAri" class="ui reply form">';
	boxHtml += '	<div class="ui large form ">';
	boxHtml += '		<div class="two fields">';
	boxHtml += '			<div class="field" >';
	boxHtml += '				<input type="text" id="userName" />';
	boxHtml += '				<label class="userNameLabel" for="userName">Your Name</label>';
	boxHtml += '			</div>';
	boxHtml += '			<div class="field" >';
	boxHtml += '				<input type="text" id="userEmail" />';
	boxHtml += '				<label class="userEmailLabel" for="userName">E-mail</label>';
	boxHtml += '			</div>';
	boxHtml += '		</div>';
	boxHtml += '		<div class="contentField field" >';
	boxHtml += '			<textarea id="commentContent"></textarea>';
	boxHtml += '			<label class="commentContentLabel" for="commentContent">Content</label>';
	boxHtml += '		</div>';
	boxHtml += '		<div id="submitComment" class="ui button teal submit labeled icon">';
	boxHtml += '			<i class="icon edit"></i> 提交评论';
	boxHtml += '		</div>';
	boxHtml += '	</div>';
	boxHtml += '</form>';
	
	$(self).find("#commentFrom").append(boxHtml);
};
