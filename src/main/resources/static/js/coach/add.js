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


    //拉取教练姓名
    $.ajax({
        type: "POST",
        url: "/user/list/get",
        success: function(result) {
            if(result.status == 200) {
                var html = '';
                $.each(result.data,function (index,item) {
                    html += '<option value="'+item.id+'">'+item.name+'</option>';
                })

                $(".userName").append(html);
                layui.form.render()
            } else {
                top.layer.close(index);
                top.layer.msg("获取失败！" + result.message);
            }
        }
    });

    //
    $.ajax({
        type: "POST",
        url: "/course/list/data",
        success: function(result) {
            if(result.status == 200) {
                var html = '';
                $.each(result.data,function (index,item) {
                    html += '<input type="checkbox" lay-skin="primary" title="'+item.name+'" name="course" value="'+item.id+'"/>';
                })

                $("#course").html(html);
                layui.form.render()
            } else {
                top.layer.close(index);
                top.layer.msg("获取失败！" + result.message);
            }
        }
    });
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

    //是否可用
    form.on('checkbox(status)', function(data){
        if(data.elem.checked){      //是否被选中，true或者false
            $(".status").val(1);
        }else{
            $(".status").val(0);
        }
    });

    form.on("submit(addCoach)",function(data){
        var courseArr = [];
        $("input:checkbox[name='course']:checked").each(function(j,item) {
            courseArr.push(item.value);
        });

        data.field.course = courseArr;
        console.log(data.field);
        var index = top.layer.msg('数据提交中,请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });

        $.ajax({
            type: "POST",
            url: "/coach/insert",
            data: data.field,
            success: function(result) {
                if (result.data){
                    layer.msg("添加成功！");
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