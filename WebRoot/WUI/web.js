var web = {};

// donate tip
web.donate = {};
web.donate.init = function(){
	qiao.on('.todonate', 'click', web.donate.tip);
};
web.donate.tip = function(){
	var url = $(this).data('url');
	qiao.bs.dialog({
		url 	: '/donate/tip',
		title 	: '捐助',
		okbtn	: '多谢支持~',
		callback: function(){$('#todonatea').attr('href', url);}
	});
};

// login
web.login = {};
web.login.init = function(options){
	qiao.on('.loginbtn', 'click', web.login.login);
	qiao.on('.loginform', 'keydown', function(e){if(e.keyCode == 13) web.login.login();});
};
web.login.show = function(){
	qiao.bs.dialog({
		url 	: '/login',
		title 	: '登录',
		head	: false,
		foot	: false,
		backdrop: true,
		mstyle	: 'width:300px;margin:40px auto;'
	});
};
web.login.login = function(){
	var $form = $('.loginform');
	var $h5 = $form.find('h5');
	
	qiao.ajax({
		url : '/login/login',
		data : $form.qser()
	}, function(res){
		if(res){
			if(res.type == 'success'){
				$h5.text('登录成功，正在跳转。。。');
				if(res.msg == '/'){
					location.reload(true);
				}else{
					location.href = base + res.msg;
				}
			}else{
				$h5.text(res.msg);
			}
		}else{
			$h5.text('ajax fail');
		}
	});
};

// modify pwd
web.modifypwd = {};
web.modifypwd.init = function(){
	qiao.on('.modifyPwd', 'click', web.modifypwd.modifypwdp);
};
web.modifypwd.modifypwdp = function(){
	qiao.bs.dialog({
		url : '/login/modifyPwdp',
		title : '修改密码',
		okbtn : '修改'
	}, web.modifypwd.modifypwd);
};
web.modifypwd.modifypwd = function(){
	var newpwd = $.trim($('input[name="newpwd"]').val());
	if(!newpwd){
		qiao.bs.msg({msg:'请输入新密码！',type:'danger'});
		return false;
	}else{
		var res; 
		qiao.ajax({
			async: false,
			url: '/login/modifyPwd',
			data:{password:newpwd}
		}, function(json){
			res = json;
		});
		
		qiao.bs.msg(res);
		if(res && res.type == 'success'){
			setTimeout(function(){
				location.href = base + '/login/logout';
			}, 1000);
		}
		return false;
	}
};

// role
web.role = {};
web.role.init = function(){
	qiao.on('.roleadduserbtn',	'click', web.role.setuser);
	qiao.on('.roleaddurlbtn', 	'click', web.role.seturl);
	qiao.on('.mytr',			'click', function(){$(this).toggleClass('info');});
};
web.role.setuser = function(){
	var id = $(this).parents('tr').qdata().id;
	qiao.bs.dialog({
		url : '/ucenter/role/setUser/' + id,
		title : '设置用户',
		okbtn : '关闭'
	});
};
web.role.addUser = function(){
	var ids = [];
	$('tr.outtr').each(function(){if($(this).hasClass('info')) ids.push($(this).attr('data'));});
	
	qiao.ajax({
		url: '/ucenter/role/addUser',
		data:{userids:ids.join(','),roleid:$('input[name="roleid"]').val()}
	}, function(res){
		if(res && res.type == 'success'){
			$('tr.outtr').each(function(){if($(this).hasClass('info')) $(this).removeClass('outtr').addClass('intr').prependTo('table.intable');});
		}else{
			qiao.bs.msg(res);
		}
	});
};
web.role.removeUser = function(){
	var ids = [];
	$('tr.intr').each(function(){if($(this).hasClass('info')) ids.push($(this).attr('data'));});
	
	qiao.ajax({
		url: '/ucenter/role/removeUser',
		data:{rlids:ids.join(','),roleid:$('input[name="roleid"]').val()}
	}, function(res){
		if(res && res.type == 'success'){
			$('tr.intr').each(function(){if($(this).hasClass('info')) $(this).removeClass('intr').addClass('outtr').prependTo('table.outtable');});
		}else{
			qiao.bs.msg(res);
		}
	});
};
web.role.seturl = function(){
	var id = $(this).parents('tr').qdata().id;
	qiao.bs.dialog({
		url : '/ucenter/role/setUrl/' + id,
		title : '设置Url',
		okbtn : '保存'
	}, web.role.addUrl);
};
web.role.addUrl = function(){
	var ids = [];
	$('#treeul input:checked').each(function(){ids.push($(this).parent().qdata().id);});
	
	var res;
	qiao.ajax({
		async: false,
		url: '/ucenter/role/saveUrl',
		data:{ids:ids.join(','),roleid:$('input[name="roleid"]').val()}
	}, function(json){
		res = json;
	});
	
	if(res && res.type == 'success'){
		return true;
	}else{
		qiao.bs.msg(res);
		return false;
	}
};
web.role.removeUrl = function(){
	var urls = [];
	$('tr.intr').each(function(){if($(this).hasClass('info')) urls.push($(this).attr('data'));});
	
	qiao.ajax({
		url: '/ucenter/role/removeUrl',
		data:{urls:urls.join(','),roleid:$('input[name="roleid"]').val()}
	}, function(res){
		if(res && res.type == 'success'){
			$('tr.intr').each(function(){if($(this).hasClass('info')) $(this).removeClass('intr').addClass('outtr').prependTo('table.outtable');});
		}else{
			qiao.bs.msg(res);
		}
	});
};