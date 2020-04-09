layui.use(['form','layer','table'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;

    // var roleList;
    // $.post("/paytype/select",{
    //     available : 1
    // },function(data){
    //     roleList = data.data;
    //     roleList.forEach(function(e){
    //         $("#roleSelect").append("<option value='"+e.id+"'>"+e.roleName+"</option>");
    //     });
    //     form.render('select');//刷新select选择框渲染
    // });

    //用户列表
    var tableIns = table.render({
        elem: '#paytype',
        url : '/paytype/select',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "payType",
        cols : [[
            {type: "radio", fixed:"left", width:50},
            {field: 'name', title: '付款方式', minWidth:100, align:'center'},
            {field: 'valid', title: '是否有效', minWidth: 100, align: "center",
                templet: function (d) {
                    if (d.valid == 0) {
                        return "无效"
                    }
                    if (d.valid == 1) {
                        return "有效"
                    }
                }
            },
            {field: 'createTime', title: '操作时间', minWidth:100, align:"center",
                templet: function (d) {
                    return Format(d.createTime,"yyyy-MM-dd hh:mm:ss")
                }
            }

        ]]
    });
    table.on('row(paytype)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })
    //添加支付方式
    function addPay(){
        var h = "440px";
        var title = "添加支付方式";
        layui.layer.open({
            title : title,
            type : 2,
            area : ["420px",h],
            content : "/paytype/info",//页面
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);

                setTimeout(function(){
                    layui.layer.tips('点击此处返回支付方式列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
    }

    //修改支付方式
    function updatePay(edit){
        var h = "440px";
        var title = "编辑支付方式";
        layui.layer.open({
            title : title,
            type : 2,
            area : ["420px",h],
            content : "/paytype/change",//页面
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                if(edit){
                    body.find("#id").val(edit.id);
                    body.find("#name").val(edit.name);
                    body.find("#valid").val(edit.valid);
                    form.render();
                }
                setTimeout(function(){
                    layui.layer.tips('点击此处返回支付方式列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
    }

    $(".add_btn").click(function(){
        addPay();
    });

    $(".edit_btn").click(function(){
        var checkStatus = table.checkStatus('payType'),
            data = checkStatus.data;
        if(data.length > 0){
            updatePay(data[0]);
        }else{
            layer.msg("请选择需要修改的支付方式");
        }
    });

    //批量删除
    $(".delAll_btn").click(function(){
        var checkStatus = table.checkStatus('payType'),
            data = checkStatus.data,
            idArr = [];
        if(data.length > 0) {
            for (var i in data) {
                idArr.push(data[i].id);
            }
            layer.confirm('确定删除选中的支付方式？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/paytype/delete",{
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
            layer.msg("请选择需要删除的支付方式");
        }
    })

})
