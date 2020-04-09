layui.config({
    base: "/static/js/modules/"
}).extend({
    treeSelect: "treeSelect/treeSelect"
});
layui.use(['form','layer','laydate','treeSelect','colorpicker'],function(){
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
    setTimeout(function() {
        var showcolour = window.sessionStorage.getItem("showcolour");
        window.sessionStorage.removeItem("showcolour")
        console.log(showcolour)
        colorpicker.render({
            elem: '#test-form'
            ,color: showcolour
            ,done: function(color){
                $('#test-form-input').val(color);

            }

        });
        window.sessionStorage.removeItem("showcolour")
    }, 800)

    layui.form.render();

    //是否有效
    form.on('checkbox(status)', function(data){
        if(data.elem.checked){      //是否被选中，true或者false
            $(".status").val(1);
        }else{
            $(".status").val(0);
        }




    })
    form.on("submit(editOfficetime)",function(data){
        // var courseArr = [];
        // $("input:checkbox[name='course']:checked").each(function(j,item) {
        //     courseArr.push(item.value);
        // });
        //
        // //复选框(舞种)必选
        // if (courseArr.length==0) {
        //     layer.msg("请选择舞种！");
        //     return
        // }
        //
        // data.field.course = courseArr;
        // console.log(data.field);
        var index = top.layer.msg('数据提交中,请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });

        $.ajax({
            type: "POST",
            url: "/officetime/update",
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