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

    // 生日控件
    laydate.render({
        elem: '#birthday',
        type: 'date',
        format: 'yyyy/MM/dd'
    })
    //来源控件
    var treeSelect = layui.treeSelect;
    treeSelect.render({
        // 选择器
        elem: '#fromsource_tree',
        // 数据
        data: '/fromsource/get/tree',
        // 异步加载方式：get/post，默认get
        type: 'get',
        // 占位符
        placeholder: '选择客户来源',
        // 是否开启搜索功能：true/false，默认false
        search: true,
        // 一些可定制的样式
        style: {
            folder: {
                enable: true
            },
            line: {
                enable: true
            }
        },
        // 点击回调
        click: function(d){
            $("#fromsource_tree").val(d.current.id)
        },
        // 加载完成后的回调函数
        success: function (d) {
//                选中节点，根据id筛选
            treeSelect.checkNode('fromsource_tree',window.sessionStorage.getItem("fromsource_id"));
            window.sessionStorage.removeItem("fromsource_id")
//                获取zTree对象，可以调用zTree方法
            var treeObj = treeSelect.zTree('fromsource_tree');
//                刷新树结构
            treeSelect.refresh('fromsource_tree');
        }
    });



    form.on("submit(editCustomer)",function(data){
        var index = top.layer.msg('数据提交中,请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });;
        $.ajax({
            type: "POST",
            url: "/customer/edit/submit",
            data: data.field,
            success: function(result) {
                layer.close(index);
                if (result.status == 200){
                    layer.msg("保存成功！");
                    layer.closeAll("iframe");
                    //刷新父页面
                    parent.location.reload();
                } else {
                    layer.msg(result.message);
                }
            }
        });
        return false;
    });

})