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
        elem: '#firstmoneyList',
        url : '/first/money/list/data',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "firstmoneyListTable",
        cols : [[
            {type:'radio',fixed:'left'},
            {field: 'firstMoney', title: '金额', minWidth:100, align:'center',
                templet:function (d) {
                    return "￥" + d.firstMoney;
                }
            },
            {field: 'payType', title: '付款方式', minWidth:100, align:'center',
                templet:function (d) {
                    return d.payType.name;
                }
            },
            {field: 'payTime', title: '付款时间', minWidth:100, align:'center',
                templet:function (d) {
                    return Format(d.payTime,"yyyy-MM-dd");
                }
            },
            {field: 'mt', title: '绑定销售', minWidth:100, align:'center',
                templet:function (d) {
                    return d.mt.name;
                }
            },
            {field: 'number', title: '定金编号', minWidth:100, align:'center',
                templet:function (d) {
                    return d.number;
                }
            },
            {field: 'endTime', title: '截止时间', minWidth:100, align:'center',
                templet:function (d) {
                    return Format(d.endTime,"yyyy-MM-dd");
                }
            },
            {field: 'status', title: '状态', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.status == 0){
                        return '<div class="layui-btn layui-btn-xs layui-bg-red">未冲账</div>'
                    }
                    if (d.status == 1){
                        return '<div class="layui-btn layui-btn-xs">已冲账</div>'
                    }
                    if (d.status == 2){
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">已退回</div>'
                    }
                    if (d.status == 3){
                        return '<div class="layui-btn layui-btn-xs layui-bg-gray">已过期</div>'
                    }
                }
            },
            {field: 'store', title: '店面名称', minWidth:100, align:'center'},
            {field: 'customer', title: '所属客户', minWidth:100, align:'center',
                templet:function (d) {
                    return d.customer.name;
                }
            },
            {field: 'remark', title: '备注', minWidth:100, align:'center'}
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

    table.on('row(firstmoneyList)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })
    //搜索
    $(".search_btn").on("click",function(){
        table.reload("firstmoneyListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                name: $(".name").val(),
                phone: $(".phone").val()
            }
        })
    });

    //添加按钮
    function addFirstmoney() {
        var index = layui.layer.open({
            title: "新增定金",
            type: 2,
            content: "/first/money/add",
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
        addFirstmoney();
    })

    //编辑按钮
    function editFirstmoney(data) {
        var index = layui.layer.open({
            title: "编辑定金",
            type: 2,
            content: "/first/money/edit",
            success: function(layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                var iframeWindow = window[layero.find('iframe')[0]['name']];
                body.find("#id").val(data.id);
                body.find(".customer_id").val(data.customer.id);
                body.find(".clubNumber").val(data.customer.icCardId);
                body.find(".customer_name").val(data.customer.name);
                body.find(".phone").val(data.customer.phone);
                body.find(".number").val(data.number);
                body.find("#status").each(function() {
                    // this代表的是<option></option>，对option再进行遍历
                    $(this).children("option").each(function() {
                        // 判断需要对那个选项进行回显
                        if (this.value == data.status) {
                            // 进行回显
                            $(this).attr("selected","selected");
                        }
                    });
                })
                body.find(".insertTime").val(Format(data.insertTime,"yyyy/MM/dd"));
                body.find(".endTime").val(Format(data.endTime,"yyyy/MM/dd"));
                body.find(".firstMoney").val(data.firstMoney);
                body.find(".remark").val(data.remark);
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
                //付款方式获取
                $.ajax({
                    type: "POST",
                    async:false,
                    url: "/paytype/select/all",
                    success: function(result) {
                        var html = '';
                        $.each(result.data,function (index,item) {
                            html += '<option value="'+item.id+'">'+item.name+'</option>';
                        })
                        body.find("#paytype").append(html);
                        body.find("#paytype").each(function() {
                            // this代表的是<option></option>，对option再进行遍历
                            $(this).children("option").each(function() {
                                // 判断需要对那个选项进行回显
                                if (this.value == data.payType.id) {
                                    // 进行回显
                                    $(this).attr("selected","selected");
                                }
                            });
                        })
                        layui.form.render()
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

    //打印预览
    function printview(data) {

        window.open(getRealPath()+"/first/money/printview/page?number="+data.number);
    }
    //打印预览
    $(".printview").click(function() {
        var checkStatus = table.checkStatus('firstmoneyListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要打印的定金");
        }else if(data.length == 0){
            layer.msg("请选择需要打印的定金");
        }else{
            printview(data[0]);
        }
    })
    //编辑
    $(".edit_btn").click(function(){
        var checkStatus = table.checkStatus('firstmoneyListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要修改的项目");
        }else if(data.length == 0){
            layer.msg("请选择需要修改的项目");
        }else{
            editFirstmoney(data[0]);
        }
    });

    //批量删除
    $(".delAll_btn").click(function(){
        var checkStatus = table.checkStatus('customerListTable'),
            data = checkStatus.data,
            idArr = [];
        if(data.length > 0) {
            for (var i in data) {
                idArr.push(data[i].id);
            }
            layer.confirm('确定删除选中的客户？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/customer/del/submit",{
                    idArr : idArr.toString()
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