layui.config({
    base: "/static/js/modules/"
}).extend({
    treeSelect: "treeSelect/treeSelect"
});
layui.use(['form','layer','laydate','treeSelect'],function(){
    var form = layui.form
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;
    var laydate = layui.laydate;



//监听复选框
    //是否经理
    form.on('checkbox(isManager)', function(data){
        if(data.elem.checked){      //是否被选中，true或者false
            $(".isManager").val(1);
        }else{
            $(".isManager").val(0);
        }
    });

    //是否自由教练
    form.on('checkbox(freeCoach)', function(data){
        if(data.elem.checked){      //是否被选中，true或者false
            $(".freeCoach").val(1);
        }else{
            $(".freeCoach").val(0);
        }
    });

    form.on("submit(editCoach)",function(data){
        var courseArr = [];
        $("input:checkbox[name='course']:checked").each(function(j,item) {
            courseArr.push(item.value);
        });

        //复选框(舞种)必选
        if (courseArr.length==0) {
            layer.msg("请选择舞种！");
            return
        }

        data.field.course = courseArr;
        console.log(data.field);
        var index = top.layer.msg('数据提交中,请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });

        $.ajax({
            type: "POST",
            url: "/coach/update",
            data: data.field,
            success: function(result) {
                if (result.data){
                    layer.msg("修改成功！");
                    layer.closeAll("iframe"); //刷新父页面
                    parent.location.reload();
                } else {
                    layer.msg(result.msg);
                }
            }
        });
        return false;
    });

})