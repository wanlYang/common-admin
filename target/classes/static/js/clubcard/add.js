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
    laydate.render({
        elem: '#startTime',
        type: 'date',
        format: 'yyyy/MM/dd'
    })
    laydate.render({
        elem: '#endTime',
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
            //treeSelect.checkNode('tree', 3);
//                获取zTree对象，可以调用zTree方法
            var treeObj = treeSelect.zTree('fromsource_tree');
//                刷新树结构
            treeSelect.refresh('fromsource_tree');
        }
    });
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
    //卡项获取
    $.ajax({
        type: "POST",
        async:false,
        url: "/cardsetting/select",
        success: function(result) {
            var html = '';
            $.each(result.data,function (index,item) {
                html += '<option value="'+item.id+'">'+item.name+'</option>';
            })

            $("#cardsetting").append(html);
            var myDate = new Date();
            $("#startTime").val(myDate.toLocaleDateString())
            layui.form.render()
        }

    });

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

    //付款方式定金的监听
    form.on('select(paytypeFirstMoney)', function(data){
        if (data.value == 11){
            if ($(".clubNumber").val() == ''){
                layer.msg("请选择客户!再重新选择!");
                return;
            }
            window.sessionStorage.setItem("customer_id", $(".customer_id").val());
            layui.layer.open({
                title: "选择定金",
                type: 2,
                area: ['60%', '80%'],
                btn:['确定','取消'],
                btnAlign:'c',
                content: "/first/money/select/list",
                yes:function(index, layero){
                    var iframeWindow = window['layui-layer-iframe' + index];
                    var checkStatus  = iframeWindow.layui.table.checkStatus("firstmoneyListTable");
                    var checkData = checkStatus.data;
                    if (checkData.length == 0){
                        layui.layer.msg("请选择定金!");
                    }else{
                        $(".firstMoney_i").val(checkData[0].firstMoney).attr("readonly","readonly").addClass("default");
                        $(".firstmoneyId").val(checkData[0].id);
                        /*$(".customer_id").val(checkData[0].id);
                        $(".customer_name").val(checkData[0].name);*/
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
        }else{
            $(".firstMoney_i").val('').removeClass("default").removeAttr("readonly");
        }


    });
    //付款方式
    $("#addPayType").click(function () {
        $(".delPayType").show();
        var html = '';
        html += '<div class="layui-form-item" >';
        html += '<div class="layui-inline">';
        html += '<label class="layui-form-label">付款方式'+count+'</label>';
        html += '<div class="layui-input-inline">';
        html += '<select name="paytypeId" lay-verify="required" class="paytype paytype_id" lay-search="">';
        $.ajax({
            type: "POST",
            async:false,
            url: "/paytype/select/all",
            success: function(result) {
                $.each(result.data,function (index,item) {
                    //html += '<option value="">直接选择或搜索选择</option>';
                    //添加付款方式时筛选掉定金
                    if (item.id != 11){
                        html += '<option value="'+item.id+'">'+item.name+'</option>';
                    }

                })
                layui.form.render();
            }

        });
        html += '</select>';
        html += '</div>';
        html += '</div>';
        html += '<div class="layui-inline">';
        html += '<label class="layui-form-label" style="padding-left: 4px;">付款金额'+count+'</label>';
        html += '<div class="layui-input-inline">';
        html += '<input type="text" class="layui-input money" lay-filter="money" name="paytypeMoney" lay-verify="required" placeholder="">';
        html += '</div>';
        html += '</div>';
        html += '</div>';
        html += '</div>';
        layui.form.render();
        $(".paymentBox > div.layui-form-item:last").after(html);
        layui.form.render();
        count ++ ;

    })


    form.on("submit(addClubCard)",function(data){
        var paytypeIdArr = [];
        var paytypeMoneyArr = [];
        $("select[name='paytypeId']").each(function(j,item){
            paytypeIdArr.push(item.value);
        });
        $("input[name='paytypeMoney']").each(function(j,item){
            paytypeMoneyArr.push(item.value);
        });
        data.field.paytypeIds = paytypeIdArr;
        data.field.paytypeMonies = paytypeMoneyArr;
        console.log(data);
        var index = top.layer.msg('数据提交中,请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });
        $.ajax({
            type: "POST",
            url: "/clubcard/add/submit",
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