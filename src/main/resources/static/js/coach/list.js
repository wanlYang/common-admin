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
        elem: '#coachList',
        url : '/coach/select',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "coachListTable",
        cols : [[
            {type:'radio',fixed:'left'},
            {field: 'name', title: '教练编号', minWidth:100, align:"center"},
            {field: 'name', title: '教练姓名', minWidth:100, align:"center"},
            {field: 'phone', title: '电话', minWidth:100, align:'center'},
            {field: 'sex', title: '性别', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.sex == 1){
                        return "男"
                    }
                    if (d.sex == 0){
                        return "女"
                    }
                }
            },
            {field: 'status', title: '状态', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.status == 0){
                        return '<div class="layui-btn layui-btn-xs">正常</div>'
                    }
                    if (d.status == 1){
                        return '<div class="layui-btn layui-btn-xs  layui-btn-danger">请假</div>'
                    }
                    if (d.status == 2){
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">离职</div>'
                    }
                }
            },
            {field: 'freeCoach', title: '是否自由教练', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.freeCoach == 1){
                        return "是"
                    }else {
                        return "否"
                    }
                }
            },
            {field: 'isManager', title: '是否经理', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.isManager == 1){
                        return "是"
                    }else {
                        return "否"
                    }
                }
            },
            {field: 'remark', title: '备注', minWidth:100, align:'center'},
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

    table.on('row(coachList)', function (obj) {
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })
    //搜索
    $(".search_btn").on("click",function(){
        table.reload("coachListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                name: $(".name").val(),
                phone: $(".phone").val()
            }
        })
    });

    table.on('row(customerList)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })
    //添加按钮
    function addCoach() {
        var index = layui.layer.open({
            title: "新增教练",
            type: 2,
            content: "/coach/add",
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
        layui.layer.full(index);
        window.sessionStorage.setItem("index", index);
        // 改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize", function() {
            layui.layer.full(window.sessionStorage.getItem("index"));
        })
    }
    $(".add_btn").click(function() {
        addCoach();
    })

    //编辑按钮
    function editCustomer(data) {
        var index = layui.layer.open({
            title: "编辑客户",
            type: 2,
            content: "/customer/edit",
            success: function(layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                var iframeWindow = window[layero.find('iframe')[0]['name']];
                body.find("#id").val(data.id);
                body.find(".name").val(data.name);
                body.find(".phone").val(data.phone);
                body.find(".email").val(data.email);
                body.find("#cusType").each(function() {
                    // this代表的是<option></option>，对option再进行遍历
                    $(this).children("option").each(function() {
                        // 判断需要对那个选项进行回显
                        if (this.value == data.cusType) {
                            // 进行回显
                            $(this).attr("selected","selected");
                        }
                    });
                })
                window.sessionStorage.setItem("fromsource_id", data.fromsource.id);
                body.find(".icCardId").val(data.icCardId);
                body.find(".icCardNum").val(data.icCardNum);
                body.find(".store").val(data.store);
                body.find(".birthday").val(Format(data.birthday,"yyyy/MM/dd"));
                body.find(".idCard").val(data.idCard);
                body.find(".remark").val(data.remark);
                body.find("#sex").each(function() {
                    // this代表的是<option></option>，对option再进行遍历
                    $(this).children("option").each(function() {
                        // 判断需要对那个选项进行回显
                        if (this.value == data.sex) {
                            // 进行回显
                            $(this).attr("selected","selected");
                        }
                    });
                })
                //接待人,销售顾问
                $.ajax({
                    type: "POST",
                    async:false,
                    url: "/user/list/get",
                    success: function(result) {
                        if(result.status == 200) {
                            var html = '';
                            $.each(result.data,function (index,item) {
                                html += '<option value="'+item.id+'">'+item.name+'</option>';
                            })
                            body.find(".user_id").append(html);
                            body.find("#reception").each(function() {
                                // this代表的是<option></option>，对option再进行遍历
                                $(this).children("option").each(function() {
                                    // 判断需要对那个选项进行回显
                                    if (this.value == data.reception.id) {
                                        // 进行回显
                                        $(this).attr("selected","selected");
                                    }
                                });
                            })
                            body.find("#mt").each(function() {
                                // this代表的是<option></option>，对option再进行遍历
                                $(this).children("option").each(function() {
                                    // 判断需要对那个选项进行回显
                                    if (this.value == data.mt.id) {
                                        // 进行回显
                                        $(this).attr("selected","selected");
                                    }
                                });
                            })
                            if (typeof(iframeWindow.layui.form) != "undefined") {
                                iframeWindow.layui.form.render();
                            }
                        } else {
                            top.layer.close(index);
                            top.layer.msg("获取失败！" + result.message);
                        }
                    }
                });
                //介绍人获取
                $.ajax({
                    async:false,
                    type: "POST",
                    url: "/customer/list/get",
                    success: function(result) {
                        if(result.status == 200) {
                            var html = '';
                            $.each(result.data,function (index,item) {
                                html += '<option value="'+item.id+'">'+item.name+'</option>';
                            })
                            body.find(".customer_id").append(html);
                            body.find("#customer").each(function() {
                                // this代表的是<option></option>，对option再进行遍历
                                $(this).children("option").each(function() {
                                    // 判断需要对那个选项进行回显
                                    if (data.intro != null){
                                        if (this.value == data.intro.id) {
                                            // 进行回显
                                            $(this).attr("selected","selected");
                                        }
                                    }
                                });
                            })
                            if (typeof(iframeWindow.layui.form) != "undefined") {
                                iframeWindow.layui.form.render();
                            }
                        } else {
                            top.layer.close(index);
                            top.layer.msg("获取失败！" + result.message);
                        }
                    }
                });

                if (typeof(iframeWindow.layui.form) != "undefined") {
                    iframeWindow.layui.form.render();
                }
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
        layui.layer.full(index);
        window.sessionStorage.setItem("index", index);
        // 改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize", function() {
            layui.layer.full(window.sessionStorage.getItem("index"));
        })
    }
    //编辑客户
    $(".edit_btn").click(function(){
        var checkStatus = table.checkStatus('customerListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要修改的客户");
        }else if(data.length == 0){
            layer.msg("请选择需要修改的客户");
        }else{
            editCustomer(data[0]);
        }
    });

    //删除
    $(".del_btn").click(function(){
        var checkStatus = table.checkStatus('coachListTable'),
            data = checkStatus.data
        if(data.length > 0) {
            layer.confirm('确定删除选中的客户？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/coach/delete",{
                    id : data[0].id
                },function(data){
                    layer.close(index);
                    tableIns.reload();
                    if (data.data){
                        layer.msg("删除成功！");
                    } else {
                        layer.msg(data.msg);
                    }
                })
            })
        }else{
            layer.msg("请选择需要删除的项");
        }
    })
})