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
    var customerId = window.sessionStorage.getItem("customer_id");
    //列表
    var tableIns = table.render({
        elem: '#firstmoneyList',
        url : '/first/money/list/data/other?customer_id=' + customerId,
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "firstmoneyListTable",
        cols : [[
            {type:'radio',fixed:'left'},
            {field: 'firstMoney', title: '金额', minWidth:90, align:'center',
                templet:function (d) {
                    return "￥" + d.firstMoney;
                }
            },
            {field: 'payType', title: '付款方式', minWidth:90, align:'center',
                templet:function (d) {
                    return d.payType.name;
                }
            },
            {field: 'payTime', title: '付款时间', minWidth:90, align:'center',
                templet:function (d) {
                    return Format(d.payTime,"yyyy-MM-dd");
                }
            },
            {field: 'mt', title: '绑定销售', minWidth:90, align:'center',
                templet:function (d) {
                    return d.mt.name;
                }
            },
            {field: 'endTime', title: '截止时间', minWidth:90, align:'center',
                templet:function (d) {
                    return Format(d.endTime,"yyyy-MM-dd");
                }
            },
            {field: 'customer', title: '所属客户', minWidth:90, align:'center',
                templet:function (d) {
                    return d.customer.name;
                }
            },
            {field: 'status', title: '状态', minWidth:90, align:'center',
                templet:function (d) {
                    if (d.status == 0){
                        return '<div class="layui-btn layui-btn-xs layui-bg-red">未冲账</div>'
                    }
                    if (d.status == 1){
                        return '<div class="layui-btn layui-btn-xs">已冲账</div>'
                    }
                    if (d.status == 2){
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">已退回</div>'
                    }
                    if (d.status == 3){
                        return '<div class="layui-btn layui-btn-xs layui-bg-gray">已过期</div>'
                    }
                }
            },
            {field: 'remark', title: '备注', minWidth:100, align:'center'}
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

    table.on('row(firstmoneyList)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })
    //搜索
    $(".search_btn").on("click",function(){
        table.reload("firstmoneyListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                name: $(".name").val(),
                phone: $(".phone").val()
            }
        })
    });

})