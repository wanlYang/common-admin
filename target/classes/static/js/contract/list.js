layui.config({
    base: "/static/js/modules/"
}).extend({
    treeSelect: "treeSelect/treeSelect"
});
layui.use(['form', 'layer', 'table', 'laydate', 'treeSelect'], function () {
    var $ = layui.jquery,
        table = layui.table,
        laydate = layui.laydate;
    var treeSelect = layui.treeSelect;

    //私教合同列表
    var tableIns = table.render({
        elem: '#contractList',
        url: '/pe/contract/list/data',
        cellMinWidth: 80,
        page: true,
        height: "full-125",
        limits: [10, 20, 30],
        limit: 10,
        id: "contractListTable",
        cols: [[
            {type: 'radio', fixed: 'left'},
            {
                field: 'contractNumber', title: '合同编号', minWidth: 145, align: "center",
                templet: function (d) {
                    return d.contractNumber;
                }
            },
            {
                field: 'store', title: '分店', minWidth: 120, align: "center",
                templet: function (d) {
                    return d.store;
                }
            },
            {
                field: 'customerName', title: '客户姓名',  align: 'center',
                templet: function (d) {
                    return d.customer.name;
                }
            },
            {
                field: 'status', title: '状态', align: 'center',
                templet: function (d) {
                    if (d.status == 0) {
                        return '<div class="layui-btn layui-btn-xs">有效</div>'
                    }
                    if (d.status == 1) {
                        return '<div class="layui-btn layui-btn-xs  layui-btn-danger">无效</div>'
                    }
                    if (d.status == 2) {
                        return '<div class="layui-btn layui-btn-xs layui-bg-orange">过期</div>'
                    }
                    if (d.status == 3) {
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">退费</div>'
                    }
                }
            },
            {
                field: 'auditStatus', title: '审核状态', align: 'center',
                templet: function (d) {
                    if (d.auditStatus == 0) {
                        return '<div class="layui-btn layui-btn-xs layui-btn-danger">未审核</div>'
                    }
                    if (d.auditStatus == 1) {
                        return '<div class="layui-btn layui-btn-xs">已审核</div>'
                    }
                }
            },
            {
                field: 'postponement', title: '延期状态', align: 'center',
                templet: function (d) {
                    if (d.postponement == 0) {
                        return '<div class="layui-btn layui-btn-xs">正常</div>'
                    }
                    if (d.postponement == 1) {
                        return '<div class="layui-btn layui-btn-xs layui-btn-danger">延1</div>'
                    }
                    if (d.postponement == 2) {
                        return '<div class="layui-btn layui-btn-xs layui-bg-orange">延2</div>'
                    }
                    if (d.postponement == 3) {
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">延3</div>'
                    }
                }
            },
            {
                field: 'course', title: '私教课程', align: 'center',
                templet: function (d) {
                    return d.course.name;
                }
            },
            {
                field: 'coach', title: '上课教练', align: 'center',
                templet: function (d) {
                    return d.coach.name;
                }
            },
            {
                field: 'mt', title: '销售顾问',  align: 'center',
                templet: function (d) {
                    if (d.mt == null) {
                        return "无销售"
                    }
                    return d.mt.name
                }
            },
            {
                field: 'totalPaymentAmount', title: '付款金额', align: 'center',
                templet: function (d) {
                    return "￥" + d.payfor
                }
            },
            {
                field: 'totalSum', title: '总金额', align: 'center',
                templet: function (d) {
                    return "￥" + d.totalSum
                }
            },
            {
                field: 'unitPrice', title: '单价', align: 'center',
                templet: function (d) {
                    return "￥" + d.totalSum
                }
            },
            {
                field: 'residualTimes', title: '剩余次数', align: 'center',
                templet: function (d) {
                    return d.residualTimes
                }
            },
            {
                field: 'effectiveDate', title: '生效日期',  align: 'center',
                templet: function (d) {
                    return Format(d.effectiveDate, "yyyy/MM/dd");
                }
            },
            {
                field: 'closingDate', title: '截止日期',align: 'center',
                templet: function (d) {
                    return Format(d.closingDate, "yyyy/MM/dd");
                }
            },
            {
                field: 'createTime', title: '创建日期',  align: 'center',
                templet: function (d) {
                    return Format(d.createTime, "yyyy/MM/dd");
                }
            },
            {
                field: 'checkUser', title: '审核人', align: 'center',
                templet: function (d) {
                    if (d.checkUser == null){
                        return '<div class="layui-btn layui-btn-xs layui-btn-danger">未审核</div>'
                    }
                    return d.checkUser.name;
                }
            },
            {
                field: 'operator', title: '操作员', align: 'center',
                templet: function (d) {
                    return d.operator.name;
                }
            }
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

    table.on('row(contractList)', function (obj) {
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })

    //搜索
    $(".search_btn").on("click", function () {
        table.reload("contractListTable", {
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
            title: "新增合同",
            type: 2,
            content: "/pe/contract/add",
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            },
            end: function () {
                $(window).unbind("resize");
            }
        })
        layui.layer.full(index);
        window.sessionStorage.setItem("index", index);
        // 改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize", function () {
            layui.layer.full(window.sessionStorage.getItem("index"));
        })
    }

    //添加按钮
    $(".add_btn").click(function () {
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
        window.open(getRealPath() + "/pe/contract/printview/page?contractNumber=" + data.contractNumber);
    }

    //打印预览
    $(".printview").click(function () {
        var checkStatus = table.checkStatus('contractListTable'),
            data = checkStatus.data;
        if (data.length > 1) {
            layer.msg("请选择一个需要打印的合同");
        } else if (data.length == 0) {
            layer.msg("请选择需要打印的合同");
        } else {
            if (data[0].auditStatus != 1) {
                layer.msg("未审核的卡项无法打印!")
                return;
            }
            printview(data[0]);
        }
    })

    //审核
    $(".examine").click(function () {
        var checkStatus = table.checkStatus('contractListTable'),
            data = checkStatus.data;
        if (data.length > 1) {
            layer.msg("请选择一个需要审核的合同");
        } else if (data.length == 0) {
            layer.msg("请选择需要审核的合同");
        } else {
            examine(data[0]);
        }
    })

    function examine(data) {

        var index = layui.layer.open({
            title: "审核私教合同",
            type: 2,
            btn: ['审核', '取消'],
            area: ['60%', '80%'],
            btnAlign: 'c',
            content: "/pe/contract/examine/page?contractNumber=" + data.contractNumber,
            yes: function (index, layero) {
                if (data.auditStatus == 1) {
                    layer.msg("不得重复审核!")
                    return;
                }
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/pe/contract/examine",
                    data: {"id": data.id},
                    success: function (result) {
                        if (result.status == 200) {
                            top.layer.msg(result.message);
                            setTimeout(function () {
                                top.layer.close(index);
                                location.reload();
                            }, '500')

                        } else {
                            top.layer.close(index);
                            top.layer.msg("失败！" + result.message);
                        }
                    }
                });

            },
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            },
            end: function () {
                $(window).unbind("resize");
            }
        })

    }

    //编辑按钮
    function editClubcard(data) {
        if (data.examine == 1) {
            layer.msg("审核后的会员卡项不允许修改!")
            return;
        }
        var index = layui.layer.open({
            title: "编辑会员卡",
            type: 2,
            content: "/clubcard/edit",
            success: function (layero, index) {
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
                    async: false,
                    url: "/cardsetting/select",
                    success: function (result) {
                        var html = '';
                        $.each(result.data, function (index, item) {
                            html += '<option value="' + item.id + '">' + item.name + '</option>';
                        })

                        body.find("#cardsetting").append(html);
                        //var myDate = new Date();
                        //body.find("#startTime").val(myDate.toLocaleDateString())
                        layui.form.render()
                    }

                });
                body.find("#cardsetting").each(function () {
                    // this代表的是<option></option>，对option再进行遍历
                    $(this).children("option").each(function () {
                        // 判断需要对那个选项进行回显
                        if (this.value == data.cardsetting.id) {
                            // 进行回显
                            $(this).attr("selected", "selected");
                        }
                    });
                    layui.form.render()
                })
                body.find("#startTime").val(Format(data.startTime, "yyyy/MM/dd"));
                body.find("#endTime").val(Format(data.endTime, "yyyy/MM/dd"));
                body.find(".CardSetMoney").val(data.cardsetting.money);
                window.sessionStorage.setItem("fromsource_id_edit", data.fromsource.id);
                body.find(".storeScope").val(data.storeScope);
                $.ajax({
                    type: "POST",
                    async: false,
                    data: {"num": data.menmbercardNumber},
                    url: "/integral/select/get/num",
                    success: function (result) {
                        body.find(".integral").val(result.data.amount);
                        layui.form.render()
                    }

                });
                body.find(".remark").val(data.remark);
                //销售顾问
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/user/list/get",
                    success: function (result) {
                        if (result.status == 200) {
                            var html = '';
                            $.each(result.data, function (index, item) {
                                html += '<option value="' + item.id + '">' + item.name + '</option>';
                            })
                            body.find(".user_id").append(html);
                            body.find("#mt").each(function () {
                                // this代表的是<option></option>，对option再进行遍历
                                $(this).children("option").each(function () {
                                    // 判断需要对那个选项进行回显
                                    if (this.value == data.mt.id) {
                                        // 进行回显
                                        $(this).attr("selected", "selected");
                                    }
                                });
                            })
                            if (typeof (iframeWindow.layui.form) != "undefined") {
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
                    async: false,
                    url: "/clubcard/paytypes",
                    data: {"id": data.id},
                    success: function (result) {
                        console.log(result);
                        var html = '';
                        $.each(result.data, function (index, item) {
                            html += '<div class="layui-form-item" >';
                            html += '<div class="layui-inline">';
                            html += '<label class="layui-form-label">付款方式' + (index + 1) + '</label>';
                            html += '<div class="layui-input-inline">';
                            html += '<input type="text" class="layui-input money firstMoney_i default" value="' + item.paytype.name + '" readonly="readonly" title="无法修改" lay-filter="money" name="paytypeMoney" >';
                            html += '</div>';
                            html += '</div>';
                            html += '<div class="layui-inline">';
                            html += '<label class="layui-form-label" style="padding-left: 4px;">付款金额' + (index + 1) + '</label>';
                            html += '<div class="layui-input-inline">';
                            html += '<input type="text" class="layui-input money default" title="无法修改" lay-filter="money" readonly="readonly" value="' + item.money + '" name="paytypeMoney">';
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
                            if (index == 0) {
                                html += '<div class="layui-inline">';
                                html += '<label class="layui-form-label">付款单据</label>';
                                html += '<div class="layui-input-inline">';
                                html += '<input type="text" class="layui-input payReceipts" value="' + data.payReceipts + '" name="payReceipts" placeholder="">';
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


                if (typeof (iframeWindow.layui.form) != "undefined") {
                    iframeWindow.layui.form.render();
                }
                setTimeout(function () {
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            },
            end: function () {
                $(window).unbind("resize");
            }
        })
        layui.layer.full(index);
        window.sessionStorage.setItem("index", index);
        // 改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize", function () {
            layui.layer.full(window.sessionStorage.getItem("index"));
        })
    }

    //编辑会员卡
    $(".edit_btn").click(function () {
        var checkStatus = table.checkStatus('clubcardListTable'),
            data = checkStatus.data;
        if (data.length > 1) {
            layer.msg("请选择一个需要修改的会员卡");
        } else if (data.length == 0) {
            layer.msg("请选择需要修改的会员卡");
        } else {
            editClubcard(data[0]);
        }
    });

    $(".delAll_btn").click(function () {
        var checkStatus = table.checkStatus('clubcardListTable'),
            data = checkStatus.data;
        if (data.length > 1) {
            layer.msg("请选择一个需要删除的会员卡");
        } else if (data.length == 0) {
            layer.msg("请选择需要删除的会员卡");
        } else {
            delClubCard(data[0]);
        }
    })

    //删除
    function delClubCard(data) {
        if (data.examine == 1) {
            layer.msg("审核后的会员卡项不允许删除!")
            return;
        }
        layer.confirm('确定删除选中的会员卡？', {icon: 3, title: '提示信息'}, function (index) {
            $.post("/clubcard/del/submit", {
                id: data.id
            }, function (data) {
                layer.close(index);
                tableIns.reload();
                if (data.status == 200) {
                    layer.msg(data.message);
                } else {
                    layer.msg(data.message);
                }
            })
        })
    }
})