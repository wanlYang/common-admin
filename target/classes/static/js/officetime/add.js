layui.use(['form','layer','laydate','colorpicker'],function(){
    var form = layui.form
    layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;
    var laydate = layui.laydate;
    laydate.render({
        elem: '#starttime'
        ,format: 'HH:mm:ss'
        ,type: 'time'
    });
    laydate.render({
        elem: '#endtime'
        ,format: 'HH:mm:ss'
        ,type: 'time'

    });
    var colorpicker = layui.colorpicker;
    colorpicker.render({
        elem: '#test-form'
        ,color: '#1c97f5'
        ,done: function(color){
            $('#test-form-input').val(color);
        }
    });
    form.on("submit(addOfficetime)",function(data){

        //弹出loading
        var index = top.layer.msg('数据保存中，请稍候...',{icon: 16,time:false,shade:0.8});
        console.log(data)
        $.post("/officetime/insert",data.field,function(res){
            if (res.data){
                layer.close(index);
                layer.msg("添加成功！");
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            } else {
                layer.msg(data.msg);
            }
        })
        return false;
    })

})