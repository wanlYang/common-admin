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
    var date_ = new Date();
    /*laydate.render({
        elem: '#insertTime',
        type: 'date',
        format: 'yyyy/MM/dd',
        value: Format(date_,"yyyy/MM/dd")
    })

    laydate.render({
        elem: '#endTime',
        type: 'date',
        format: 'yyyy/MM/dd',
        value: DateToTime(endTime,"Y/m/d")
    })*/
    var cu = Date.parse(new Date())/1000;
    var va = 7*24*60*60;
    var endTime = cu + va;

    $("#endTime").val(DateToTime(endTime,"Y/m/d"));
    $("#insertTime").val(Format(date_,"yyyy/MM/dd"));

    //销售顾问
    $.ajax({
        type: "POST",
        url: "/user/list/get",
        success: function(result) {
            if(result.status == 200) {
                var html = '';
                $.each(result.data,function (index,item) {
                    html += '<option value="'+item.id+'">'+item.name+'</option>';
                })

                $(".user_id").append(html);
                layui.form.render()
            } else {
                top.layer.close(index);
                top.layer.msg("获取失败！" + result.message);
            }
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
                    $(".phone").val(checkData[0].phone);
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
    //付款方式获取
    $.ajax({
        type: "POST",
        async:false,
        url: "/paytype/select/all",
        success: function(result) {
            var html = '';
            $.each(result.data,function (index,item) {
                html += '<option value="'+item.id+'">'+item.name+'</option>';
            })
            $("#paytype").append(html);
            layui.form.render()
        }

    });

    form.on("submit(addFirstmoney)",function(data){
        console.log(data);
        var index = top.layer.msg('数据提交中,请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });
        $.ajax({
            type: "POST",
            url: "/first/money/add/submit",
            data: data.field,
            success: function(result) {
                if (result.status == 200){
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
function delPayment(obj){
    $(".paymentBox > div.layui-form-item:last").remove();
    count --;
    if (count == 2){
        $(".delPayType").hide();
    }
}