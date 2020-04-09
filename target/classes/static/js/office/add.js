layui.use(['form','layer','laydate','colorpicker'],function(){
    var form = layui.form
    layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;
    var laydate = layui.laydate;
    laydate.render({
        elem: '#starttime'
        ,format: 'yyyy/MM/dd'
        ,type: 'date'
    });
    laydate.render({
        elem: '#endtime'
        ,format: 'yyyy/MM/dd'
        ,type: 'date'

    });
    //教练
    $.ajax({
        type: "POST",
        url: "/coach/select/all",
        success: function(result) {
            if(result.status == 200) {
                var html = '';
                $.each(result.data,function (index,item) {
                    html += '<option value="'+item.id+'">'+item.name+'</option>';
                })

                $("#coach").append(html);
                layui.form.render()
            } else {
                top.layer.close(index);
                top.layer.msg("获取失败！" + result.message);
            }
        }
    });
    //班次
    $.ajax({
        type: "POST",
        url: "/officetime/select/all",
        success: function(result) {
            if(result.status == 200) {
                var html = '';
                $.each(result.data,function (index,item) {
                    html += '<option value="'+item.id+'">'+item.name+'  '+item.starttime+'~'+item.endtime+'</option>';
                })

                $("#time").append(html);
                layui.form.render()
            } else {
                top.layer.close(index);
                top.layer.msg("获取失败！" + result.message);
            }
        }
    });
    form.on("submit(addOffice)",function(data){
        console.log(data)
        //弹出loading
        var index = top.layer.msg('数据保存中，请稍候...',{icon: 16,time:false,shade:0.8});
        console.log(data)
        $.post("/office/add/submit",data.field,function(res){
            if (res.data){
                layer.close(index);
                layer.msg("添加成功！");
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            } else {
                layer.msg(data.message);
            }
        })
        return false;
    })

})