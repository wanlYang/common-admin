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
        elem: '#officetimeList',
        url : '/officetime/select',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "officetimeListTable",
        cols : [[
            {type:'radio',fixed:'left'},
            {field: 'showcolour', title: '展示颜色', minWidth:100, align:'center',
                templet: function (d) {
                    return '<span style=" background:'+d.showcolour+'; display:block; width:60px; height:20px;"></span>'
                }
            },
            {field: 'name', title: '班次名称', minWidth:100, align:'center'},
            {field: 'starttime', title: '开始时间', minWidth:100, align:'center'},
            {field: 'endtime', title: '结束时间', minWidth:100, align:'center'},
            {field: 'status', title: '是否有效', minWidth:100, align:'center',
                templet: function (d) {
                    if (d.status == 0) {
                        return '<div class="layui-btn layui-btn-xs  layui-btn-danger">无效</div>'
                    }
                    if (d.status == 1) {
                        return '<div class="layui-btn layui-btn-xs">有效</div>'
                    }
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

    table.on('row(officetimeList)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })

    //添加按钮
    function addOfficetime() {
        var index = layui.layer.open({
            title: "新增班次时间",
            type: 2,
            area : ["455px","550px"],
            content: "/officetime/add",
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

    }
    $(".add_btn").click(function() {
        addOfficetime();
    })

    //编辑按钮
    function editOfficetime(data) {
        var index = layui.layer.open({
            title: "编辑班次时间",
            type: 2,
            area : ["455px","550px"],
            content: "/officetime/edit",
            success: function(layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                var iframeWindow = window[layero.find('iframe')[0]['name']];
                body.find(".id").val(data.id)
                body.find(".name").val(data.name);
                body.find(".starttime").val(data.starttime);
                body.find(".endtime").val(data.endtime);
                body.find(".showcolour").val(data.showcolour);
                if (data.status == 1) {
                    // 进行回显
                    body.find("input:checkbox[name='status']").attr("checked","checked");
                    body.find("input:checkbox[name='status']").val(1)
                }
                console.log(data.showcolour)
                window.sessionStorage.setItem("showcolour", data.showcolour);
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
    }

    //编辑
    $(".edit_btn").click(function(){
        var checkStatus = table.checkStatus('officetimeListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要修改的项目");
        }else if(data.length == 0){
            layer.msg("请选择需要修改的项目");
        }else{
            editOfficetime(data[0]);
        }
    });

    //删除
    $(".del_btn").click(function(){
        var checkStatus = table.checkStatus('officetimeListTable'),
            data = checkStatus.data;
        if(data.length > 0) {
            layer.confirm('确定删除选中的班次时间？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/officetime/delete",{
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