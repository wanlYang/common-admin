layui.config({
    base: "/static/js/modules/"
}).extend({
    treeSelect: "treeSelect/treeSelect"
});
layui.use(['form','layer','laydate','treeSelect'],function(){
    var form = layui.form
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;
    form.on("submit(examine)",function(data){
        var index = top.layer.msg('数据提交中,请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });
        var couArr = new Array();
        $("input:checkbox[name='coupons']:checked").each(function(i) {
            couArr[i] = $(this).val();
        });
        data.field.coupons = couArr.join(","); // 将数组合并成字符串
        $.ajax({
            type: "POST",

            url: "/activity/management/examine/submit",
            data: data.field,
            success: function(result) {
                if (result.status == 200){
                    layer.msg(result.message);
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