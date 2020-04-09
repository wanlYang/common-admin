
layui.use(['form','layer','table','laydate'],function(){
    var $ = layui.jquery,
        table = layui.table,
        laydate = layui.laydate;

    //客户列表
    var tableIns = table.render({
        elem: '#courseList',
        url : '/course/list/data',
        cellMinWidth : 95,
        height : "full-125",
        id : "courseListTable",
        cols : [[
            {type:'radio',fixed:'left'},
            {field: 'name', title: '课程名称', minWidth:100, align:"center"},
            {field: 'briefIntroduction', title: '课程简介', minWidth:100, align:'center'},
            {field: 'store', title: '所属分店', minWidth:100, align:'center'},
            {field: 'unitPrice', title: '课程单价', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.unitPrice == null || d.unitPrice == ''){
                        return ""
                    }
                    return "￥" +d.unitPrice
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

    //搜索
    $(".search_btn").on("click",function(){
        table.reload("customerListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                name: $(".name").val(),
                phone: $(".phone").val()
            }
        })
    });

    table.on('row(courseList)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })
    //添加按钮
    function addCourse() {
        var index = layui.layer.open({
            title: "新增课程",
            type: 2,
            content: "/course/add",
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
        addCourse();
    })

    //编辑按钮
    function editCourse(data) {
        var index = layui.layer.open({
            title: "编辑课程",
            type: 2,
            content: "/course/edit",
            success: function(layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                var iframeWindow = window[layero.find('iframe')[0]['name']];
                body.find("#id").val(data.id);
                body.find(".name").val(data.name);
                body.find(".unitPrice").val(data.unitPrice);
                body.find(".store").val(data.store);
                body.find(".briefIntroduction").val(data.briefIntroduction);
                body.find(".remark").val(data.remark);
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
    //编辑
    $(".edit_btn").click(function(){
        var checkStatus = table.checkStatus('courseListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要修改的课程");
        }else if(data.length == 0){
            layer.msg("请选择需要修改的课程");
        }else{
            editCourse(data[0]);
        }
    });

    //删除
    $(".delAll_btn").click(function(){
        var checkStatus = table.checkStatus('courseListTable'),
            data = checkStatus.data,
            idArr = [];
        if(data.length > 0) {
            for (var i in data) {
                idArr.push(data[i].id);
            }
            layer.confirm('确定删除选中的课程？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/course/del/submit",{
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