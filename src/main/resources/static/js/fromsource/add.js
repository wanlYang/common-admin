
layui.use(['form','layer','laydate','jquery'],function(){
    var form = layui.form
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;
    var laydate = layui.laydate;
    form.on("submit(addFromsource)",function(data){
        var index = top.layer.msg('数据提交中,请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });
        $.ajax({
            type: "POST",
            url: "/fromsource/add/submit",
            data: data.field,
            success: function(result) {
                if (result.data){
                    layer.msg("保存成功！");
                    layer.closeAll("iframe");
                    //刷新父页面
                    parent.location.reload();
                } else {
                    layer.msg(result.msg);
                }
            }
        });
        return false;
    });

})