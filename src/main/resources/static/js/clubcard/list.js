layui.config({
    base: "/static/js/modules/"
}).extend({
    treeSelect: "treeSelect/treeSelect"
});
layui.use(['form','layer','table','laydate','treeSelect'],function(){
    var $ = layui.jquery,
        table = layui.table,
        laydate = layui.laydate;
    var treeSelect = layui.treeSelect;

    //客户列表
    var tableIns = table.render({
        elem: '#clubcardList',
        url : '/clubcard/listData',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "clubcardListTable",
        cols : [[
            {type:'radio',fixed:'left'},
            {field: 'name', title: '客户姓名', minWidth:100, align:"center",
                templet:function (d) {
                    return d.customer.name;
                }
            },
            {field: 'phone', title: '手机号码', minWidth:100, align:"center",
                templet:function (d) {
                    return d.customer.phone;
                }
            },
            {field: 'menmbercardNumber', title: '合同编号', minWidth:100, align:'center'},
            {field: 'storeScope', title: '所属分店', minWidth:100, align:'center'},
            {field: 'memberStatus', title: '卡状态', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.memberStatus == 0){
                        return '<div class="layui-btn layui-btn-xs">有效</div>'
                    }
                    if (d.memberStatus == 1){
                        return '<div class="layui-btn layui-btn-xs  layui-btn-danger">有效</div>'
                    }
                    if (d.memberStatus == 2){
                        return '<div class="layui-btn layui-btn-xs layui-bg-orange">挂失</div>'
                    }
                    if (d.memberStatus == 3){
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">转让</div>'
                    }
                    if (d.memberStatus == 4){
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">续会</div>'
                    }
                    if (d.memberStatus == 5){
                        return '<div class="layui-btn layui-btn-xs  layui-btn-danger">退费</div>'
                    }
                    if (d.memberStatus == 6){
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">待续会</div>'
                    }
                    if (d.memberStatus == 7){
                        return '<div class="layui-btn layui-btn-xs layui-bg-gray">已过期</div>'
                    }
                }
            },
            {field: 'examine', title: '审核状态', minWidth:100, align:'center',
                templet:function (d) {
                    if (typeof(d.examine) == undefined || d.examine == null || d.examine == ''){
                        return '<div class="layui-btn layui-btn-xs layui-btn-danger">未审核</div>'
                    }
                    if (d.examine == 0){
                        return '<div class="layui-btn layui-btn-xs layui-btn-danger">未审核</div>'
                    }
                    if (d.examine == 1){
                        return '<div class="layui-btn layui-btn-xs">已审核</div>'
                    }
                }
            },
            {field: 'cardsetting', title: '卡种类', minWidth:100, align:'center',
                templet:function (d) {
                    return d.cardsetting.name;
                }
            },
            {field: 'cardsetting', title: '卡面额', minWidth:100, align:'center',
                templet:function (d) {
                    return "￥"+d.cardsetting.money;
                }
            },
            {field: 'careteTime', title: '创建日期', minWidth:100, align:'center',
                templet:function (d) {
                    return Format(d.careteTime,"yyyy/MM/dd");
                }
            },
            {field: 'mt', title: '销售顾问', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.mt == null){
                        return "无销售"
                    }
                    return d.mt.name
                }
            },
            {field: 'payfor', title: '合同金额', minWidth:100, align:'center',
                templet:function (d) {
                    return "￥"+d.payfor
                }
            },
            {field: 'remark', title: '备注', minWidth:100, align:'center'},
        ]],
        text: {
            none: '暂无相关数据' // 默认：无数据。注：该属性为 layui 2.2.5 开始新增
        },
        response: {
            statusName: 'status', // 规定数据状态的字段名称，默认：code
            statusCode: 200, // 规定成功的状态码，默认：0
            msgName: 'message', // 规定状态信息的字段名称，默认：msg
            countName: 'count', // 规定数据总数的字段名称，默认：count
            dataName: 'data' // 规定数据列表的字段名称，默认：data
        },
        toolbar: true
    });

    table.on('row(clubcardList)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })

    //搜索
    $(".search_btn").on("click",function(){
        table.reload("clubcardListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                name: $(".name").val(),
                phone: $(".phone").val()
            }
        })
    });

    //添加按钮
    function addClubCard() {
        var index = layui.layer.open({
            title: "新增会员卡",
            type: 2,
            content: "/clubcard/add",
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
        layui.layer.full(index);
        window.sessionStorage.setItem("index", index);
        // 改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize", function() {
            layui.layer.full(window.sessionStorage.getItem("index"));
        })
    }
    //添加按钮
    $(".add_btn").click(function() {
        addClubCard();
    })
    /*function aencrypt(key, iv, word){
        var _word = CryptoJS.enc.Utf8.parse(word),
            _key = CryptoJS.enc.Utf8.parse(key),
            _iv = CryptoJS.enc.Utf8.parse(iv);
        var encrypted = CryptoJS.AES.encrypt(_word, _key, {
            iv: _iv,
            mode: CryptoJS.mode.CBC,
            padding: CryptoJS.pad.Pkcs7
        });
        return encrypted.toString();
    }*/
    //key ihaierForTodoKey  IV ihaierForTodo_Iv
    //console.log()
    //打印预览
    function printview(data) {

        window.open(getRealPath()+"/clubcard/printview/page?clubcardNum="+data.menmbercardNumber);
    }
    //打印预览
    $(".printview").click(function() {
        var checkStatus = table.checkStatus('clubcardListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要打印的会员卡");
        }else if(data.length == 0){
            layer.msg("请选择需要打印的会员卡");
        }else{
            printview(data[0]);
        }
    })

    //审核
    $(".examine").click(function() {
        var checkStatus = table.checkStatus('clubcardListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要审核的会员卡");
        }else if(data.length == 0){
            layer.msg("请选择需要审核的会员卡");
        }else{
            examine(data[0]);
        }
    })

    function examine(data) {
        if (data.examine == 1){
            layer.msg("不得重复审核!")
            return;
        }
        var index = layui.layer.open({
            title: "审核会员卡",
            type: 2,
            btn:['审核','取消'],
            area: ['60%', '80%'],
            btnAlign:'c',
            content: "/clubcard/examine/page?clubcardNum=" + data.menmbercardNumber,
            yes:function(index, layero){
                $.ajax({
                    type: "POST",
                    async:false,
                    url: "/clubcard/examine",
                    data:{"id":data.id},
                    success: function(result) {
                        if(result.status == 200) {
                            top.layer.msg(result.message);
                            setTimeout(function(){
                                top.layer.close(index);
                                location.reload();
                            },'500')

                        } else {
                            top.layer.close(index);
                            top.layer.msg("失败！" + result.message);
                        }
                    }
                });

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

    }
    //编辑按钮
    function editClubcard(data) {
        if (data.examine == 1){
            layer.msg("审核后的会员卡项不允许修改!")
            return;
        }
        var index = layui.layer.open({
            title: "编辑会员卡",
            type: 2,
            content: "/clubcard/edit",
            success: function(layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                var iframeWindow = window[layero.find('iframe')[0]['name']];
                console.log(data);
                body.find(".clubNumber").val(data.customer.icCardId);
                body.find("#id").val(data.id);
                body.find(".customer_id").val(data.customer.id);
                body.find(".customer_name").val(data.customer.name);
                body.find(".menmbercardNumber").val(data.menmbercardNumber);
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

                        body.find("#cardsetting").append(html);
                        //var myDate = new Date();
                        //body.find("#startTime").val(myDate.toLocaleDateString())
                        layui.form.render()
                    }

                });
                body.find("#cardsetting").each(function() {
                    // this代表的是<option></option>，对option再进行遍历
                    $(this).children("option").each(function() {
                        // 判断需要对那个选项进行回显
                        if (this.value == data.cardsetting.id) {
                            // 进行回显
                            $(this).attr("selected","selected");
                        }
                    });
                    layui.form.render()
                })
                body.find("#startTime").val(Format(data.startTime,"yyyy/MM/dd"));
                body.find("#endTime").val(Format(data.endTime,"yyyy/MM/dd"));
                body.find(".CardSetMoney").val(data.cardsetting.money);
                window.sessionStorage.setItem("fromsource_id_edit", data.fromsource.id);
                body.find(".storeScope").val(data.storeScope);
                $.ajax({
                    type: "POST",
                    async:false,
                    data:{"num":data.menmbercardNumber},
                    url: "/integral/select/get/num",
                    success: function(result) {
                        body.find(".integral").val(result.data.amount);
                        layui.form.render()
                    }

                });
                body.find(".remark").val(data.remark);
                //销售顾问
                $.ajax({
                    type: "POST",
                    async:false,
                    url: "/user/list/get",
                    success: function(result) {
                        if(result.status == 200) {
                            var html = '';
                            $.each(result.data,function (index,item) {
                                html += '<option value="'+item.id+'">'+item.name+'</option>';
                            })
                            body.find(".user_id").append(html);
                            body.find("#mt").each(function() {
                                // this代表的是<option></option>，对option再进行遍历
                                $(this).children("option").each(function() {
                                    // 判断需要对那个选项进行回显
                                    if (this.value == data.mt.id) {
                                        // 进行回显
                                        $(this).attr("selected","selected");
                                    }
                                });
                            })
                            if (typeof(iframeWindow.layui.form) != "undefined") {
                                iframeWindow.layui.form.render();
                            }
                        } else {
                            top.layer.close(index);
                            top.layer.msg("获取失败！" + result.message);
                        }
                    }
                });
                $.ajax({
                    type: "POST",
                    async:false,
                    url: "/clubcard/paytypes",
                    data:{"id":data.id},
                    success: function(result) {
                        console.log(result);
                        var html = '';
                        $.each(result.data,function (index,item) {
                            html += '<div class="layui-form-item" >';
                            html += '<div class="layui-inline">';
                            html += '<label class="layui-form-label">付款方式'+(index+1)+'</label>';
                            html += '<div class="layui-input-inline">';
                            html += '<input type="text" class="layui-input money firstMoney_i default" value="'+item.paytype.name+'" readonly="readonly" title="无法修改" lay-filter="money" name="paytypeMoney" >';
                            html += '</div>';
                            html += '</div>';
                            html += '<div class="layui-inline">';
                            html += '<label class="layui-form-label" style="padding-left: 4px;">付款金额'+(index+1)+'</label>';
                            html += '<div class="layui-input-inline">';
                            html += '<input type="text" class="layui-input money default" title="无法修改" lay-filter="money" readonly="readonly" value="'+item.money+'" name="paytypeMoney">';
                            html += '</div>';
                            /**
                             * <div class="layui-inline">
                             <label class="layui-form-label">付款单据</label>
                             <div class="layui-input-inline">
                             <input type="text" class="layui-input payReceipts" name="payReceipts" placeholder="">
                             </div>
                             </div>
                             * @type {string}
                             */
                            html += '</div>';
                            if (index == 0){
                                html += '<div class="layui-inline">';
                                html += '<label class="layui-form-label">付款单据</label>';
                                html += '<div class="layui-input-inline">';
                                html += '<input type="text" class="layui-input payReceipts" value="'+data.payReceipts+'" name="payReceipts" placeholder="">';
                                html += '</div>';
                                html += '</div>';
                            }
                            html += '</div>';
                            html += '</div>';
                            layui.form.render();
                        })
                        body.find("#paymentBox").html(html);
                        layui.form.render()
                    }

                });


                if (typeof(iframeWindow.layui.form) != "undefined") {
                    iframeWindow.layui.form.render();
                }
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
        layui.layer.full(index);
        window.sessionStorage.setItem("index", index);
        // 改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize", function() {
            layui.layer.full(window.sessionStorage.getItem("index"));
        })
    }
    //编辑会员卡
    $(".edit_btn").click(function(){
        var checkStatus = table.checkStatus('clubcardListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要修改的会员卡");
        }else if(data.length == 0){
            layer.msg("请选择需要修改的会员卡");
        }else{
            editClubcard(data[0]);
        }
    });

    $(".delay_btn").click(function () {
        var checkStatus = table.checkStatus('clubcardListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要延期的会员卡");
        }else if(data.length == 0){
            layer.msg("请选择需要延期的会员卡");
        }else{
            delayClubcard(data[0]);
        }
    });
    function delayClubcard(data){
        var index = layui.layer.open({
            title: "会员卡延期",
            type: 2,
            area : ["500px","420px"],
            content: "/clubcard/delay",
            success: function(layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                var iframeWindow = window[layero.find('iframe')[0]['name']];
                body.find(".id").val(data.id);

            },
            end: function() {
                $(window).unbind("resize");
            }
        })


    }

    $(".delAll_btn").click(function() {
        var checkStatus = table.checkStatus('clubcardListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要删除的会员卡");
        }else if(data.length == 0){
            layer.msg("请选择需要删除的会员卡");
        }else{
            delClubCard(data[0]);
        }
    })
    //删除
    function delClubCard(data){
        if (data.examine == 1){
            layer.msg("审核后的会员卡项不允许删除!")
            return;
        }
        layer.confirm('确定删除选中的会员卡？', {icon: 3, title: '提示信息'}, function (index) {
            $.post("/clubcard/del/submit",{
                id : data.id
            },function(data){
                layer.close(index);
                tableIns.reload();
                if (data.status == 200){
                    layer.msg(data.message);
                } else {
                    layer.msg(data.message);
                }
            })
        })
    }
})