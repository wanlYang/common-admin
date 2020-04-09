layui.config({
    base: "/static/js/modules/"
}).extend({
    treeSelect: "treeSelect/treeSelect"
});
layui.use(['form','layer','table','laydate','treeSelect'],function(){
    var $ = layui.jquery,
        table = layui.table,
        laydate = layui.laydate;
    var treeSelect = layui.treeSelect;

    //客户列表
    var tableIns = table.render({
        elem: '#userList',
        url : '/activity/management/userlist/data',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "userListTable",
        cols : [[
            {type:'radio',fixed:'left'},
            {field: 'name', title: '姓名', minWidth:100, align:"center"},
            {field: 'phone', title: '电话', minWidth:100, align:'center'},
            {field: 'userCous', title: '拥有券', minWidth:100, align:'center',
                templet:function (d) {
                    var html = '';
                    $.each(d.userCous,function (index,item) {
                        if (item.state == 1){
                            html += '<div class="layui-btn layui-btn-xs">'+item.coupons.name+'</div>';
                        }
                        if (item.state == 0){
                            html += '<div class="layui-btn layui-btn-xs layui-bg-red">'+item.coupons.name+' 未审核</div>';
                        }
                    });
                    return html;

                }
            }
        ]],
        text: {
            none: '暂无相关数据' // 默认：无数据。注：该属性为 layui 2.2.5 开始新增
        },
        response: {
            statusName: 'status', // 规定数据状态的字段名称，默认：code
            statusCode: 200, // 规定成功的状态码，默认：0
            msgName: 'message', // 规定状态信息的字段名称，默认：msg
            countName: 'count', // 规定数据总数的字段名称，默认：count
            dataName: 'data' // 规定数据列表的字段名称，默认：data
        },
        toolbar: true
    });
    //搜索
    $(".search_btn").on("click",function(){
        table.reload("userListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                name: $(".name").val(),
                phone: $(".phone").val()
            }
        })
    });

    table.on('row(userList)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })
    //录入客户
    $(".addUser").click(function(){
        var index = layui.layer.open({
            title: "用户录入",
            type: 2,
            area: ['60%', '80%'],
            content: "/activity/management/add",
            success: function(layero, index) {
                setTimeout(function() {
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            },
            end: function() {
                $(window).unbind("resize");
            }
        })
    });
    //查看设定
    $(".winnerView").click(function(){
        var index = layui.layer.open({
            title: "设定用户",
            type: 2,
            area: ['60%', '80%'],
            content: "/activity/management/inside/select",
            success: function(layero, index) {
                setTimeout(function() {
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            },
            end: function() {
                $(window).unbind("resize");
            }
        })
    });
    //设定
    $(".setWinner").click(function(){
        /*var index = layui.layer.open({
            title: "设定录入",
            type: 2,
            area: ['60%', '80%'],
            content: "/activity/management/inside",
            success: function(layero, index) {
                setTimeout(function() {
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            },
            end: function() {
                $(window).unbind("resize");
            }
        })*/
        var checkStatus = table.checkStatus('userListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要设定的客户");
        }else if(data.length == 0){
            layer.msg("请选择需要设定的客户");
        }else{
            inside(data[0]);
        }
    });
    function inside(data){
        $.ajax({
            type: "POST",
            url: "/activity/management/inside/submit",
            data: {"name":data.name,"phone":data.phone},
            success: function(result) {
                if (result.data){
                    layer.msg("设定成功！");
                    layer.closeAll("iframe");
                    //刷新父页面
                    //parent.location.reload();
                } else {
                    layer.msg(result.message);
                }
            }
        });
    }
    //删除设定
    $(".winnerDel").click(function(){
        $.ajax({
            type: "GET",
            dataType:"jsonp",
            url: "/activity/management/del/inside",
            success: function(result) {
                if (result.data){
                    layer.msg("设定删除成功！");
                    //layer.closeAll("iframe");
                    //刷新父页面
                    //parent.location.reload();
                } else {
                    layer.msg(result.message);
                }
            }
        });
    });
    //审核客户
    $(".examine").click(function(){
        var checkStatus = table.checkStatus('userListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要审核的客户");
        }else if(data.length == 0){
            layer.msg("请选择需要审核的客户");
        }else{
            examine(data[0]);
        }
    });
    //反审核
    $(".reverseAudit").click(function(){
        var checkStatus = table.checkStatus('userListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要反审核的客户");
        }else if(data.length == 0){
            layer.msg("请选择需要反审核的客户");
        }else{
            reverseAudit(data[0]);
        }
    });
    function examine(data) {
        var index = layui.layer.open({
            title: data.name + "优惠券审核",
            type: 2,
            area: ['60%', '80%'],
            content: "/activity/management/examine",
            success: function(layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                var iframeWindow = window[layero.find('iframe')[0]['name']];
                body.find("#id").val(data.id);
                $.ajax({
                    type: "POST",
                    async:false,
                    url: "/activity/management/get/user/cou",
                    data:{"userId":data.id},
                    success: function(result) {
                        var cous = result.data;
                        if(result.status == 200) {
                            for (var i = 0; i < cous.length; i++) {
                                var couCheckbox = body.find("#checkBox input[name='coupons']");
                                for (var j = 0; j < couCheckbox.length; j++) {
                                    if (couCheckbox[j].value == cous[i].coupons.id) {
                                        couCheckbox[j].checked = true;
                                    }
                                }
                            }
                            if (typeof(iframeWindow.layui.form) != "undefined") {
                                iframeWindow.layui.form.render();
                            }

                        } else {
                            top.layer.close(index);
                            top.layer.msg("获取失败！" + result.message);
                        }
                    }
                });
                setTimeout(function() {
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            },
            end: function() {
                $(window).unbind("resize");
            }
        })

    }
    function reverseAudit(data) {
        layer.confirm('确定反审核？反审核回将用户优惠券全部为未审核状态!', {icon: 3, title: '提示信息'}, function (index) {
            $.ajax({
                type: "POST",
                async:false,
                url: "/activity/management/examine/reverse/submit",
                data:{"userId":data.id},
                success: function(result) {
                    if(result.status == 200) {
                        layer.msg(result.message);
                        //刷新父页面
                        location.reload();
                    } else {
                        top.layer.close(index);
                        top.layer.msg("获取失败！" + result.message);
                    }
                }
            });
        })

    }

})