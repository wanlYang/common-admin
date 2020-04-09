layui.config({
    base: "/static/js/modules/"
}).extend({
    treeSelect: "treeSelect/treeSelect"
});
var count = 2;
layui.use(['form','layer','laydate','treeSelect'],function(){
    var form = layui.form
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;
    var laydate = layui.laydate;
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
            treeSelect.checkNode('fromsource_tree',window.sessionStorage.getItem("fromsource_id_edit"));
            window.sessionStorage.removeItem("fromsource_id_edit")
//                获取zTree对象，可以调用zTree方法
            var treeObj = treeSelect.zTree('fromsource_tree');
//                刷新树结构
            treeSelect.refresh('fromsource_tree');
        }
    });

    //点击选择客户
   $("#customer_name").click(function () {
       layui.layer.open({
           title: "选择客户",
           type: 2,
           area: ['60%', '80%'],
           btn:['确定','取消'],
           btnAlign:'c',
           content: "/customer/select/list",
           yes:function(index, layero){
               var iframeWindow = window['layui-layer-iframe' + index];
               var checkStatus  = iframeWindow.layui.table.checkStatus("customerListTable");
               var checkData = checkStatus.data;
               if (checkData.length == 0){
                   layui.layer.msg("请选择客户!");
               }else{
                    $(".clubNumber").val(checkData[0].icCardId);
                    $(".customer_id").val(checkData[0].id);
                    $(".customer_name").val(checkData[0].name);
                    layui.layer.close(index); //再执行关闭
               }
           },
           success: function(layero, index) {
               setTimeout(function() {
                   layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                       tips: 3
                   });
               }, 500)
           },
           end: function() {
               $(window).unbind("resize");
           }
       })

   })



    //选择卡项设置
    form.on('select(cardsetting)', function(data){
        $.ajax({
            type: "POST",
            async:false,
            data:{"id":data.value},
            url: "/cardsetting/validity",
            success: function(result) {
                var cu = Date.parse(new Date())/1000;
                var va = result.data.validity*24*60*60;
                var endTime = cu + va;
                $("#endTime").val(DateToTime(endTime,"Y/m/d"));
                $("#cardsetting_money").val(result.data.money);
            }

        });

    });

    form.on("submit(editClubCard)",function(data){
        console.log(data);
        var index = top.layer.msg('数据提交中,请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });
        $.ajax({
            type: "POST",
            url: "/clubcard/edit/submit",
            data: data.field,
            success: function(result) {
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
function delPayment(obj){
    $(".paymentBox > div.layui-form-item:last").remove();
    count --;
    if (count == 2){
        $(".delPayType").hide();
    }
}