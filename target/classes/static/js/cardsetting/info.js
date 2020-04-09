layui.use(['form','layer'],function(){
    var form = layui.form
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;

    form.on("submit(addSet)",function(data){

        console.log(data.field.like1);
        //弹出loading
        var index = top.layer.msg('数据保存中，请稍候...',{icon: 16,time:false,shade:0.8});
            $.post("/cardsetting/insert",data.field,function(res){
                console.log(res);
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