
layui.use(['form','layer','table','laydate'],function(){
    var $ = layui.jquery,
        table = layui.table,
        laydate = layui.laydate;

    //订单列表
    var tableIns = table.render({
        elem: '#orderList',
        url : '/order/booking/list/data',
        cellMinWidth : 95,
        height : "full-125",
        id : "orderListTable",
        cols : [[
            {type:'radio',fixed:'left'},
            {field: 'courseName', title: '课程名称', minWidth:100, align:"center",
                templet:function (d) {
                    if(d.contract.course.name != null && d.contract.course.name != ''){
                        return d.contract.course.name
                    }
                    return "空"
                }
            },
            {field: 'store', title: '所属分店', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.contract.store != null && d.contract.store != ''){
                        return d.contract.store
                    }
                    return "空"
                },
            },
            {field: 'customName', title: '用户姓名', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.customer.name != null && d.customer.name != ''){
                        return d.customer.name
                    }
                    return "空"
                }
            },
            {field: 'customPhone', title: '用户电话', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.customer.phone != null && d.customer.phone != ''){
                        return d.customer.phone
                    }
                    return "空"
                }
            },
            {field: 'coachName', title: '教练姓名', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.coach.name != null && d.coach.name != ''){
                        return d.coach.name
                    }
                    return "空"
                }
            },
            {field: 'coachPhone', title: '教练电话', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.coach.phone != null && d.coach.phone != ''){
                        return d.coach.phone
                    }
                    return "空"
                }
            },
            {field: 'status', title: '预定状态', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.status == 0) {
                        return '<div class="layui-btn layui-btn-xs">待上课</div>'
                    }
                    if (d.status == 1) {
                        return '<div class="layui-btn layui-btn-xs layui-bg-blue">已完成</div>'
                    }
                    if (d.status == 2) {
                        return '<div class="layui-btn layui-btn-xs">教练已登记</div>'
                    }
                    if (d.status == 3) {
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">缺席</div>'
                    }
                    if (d.status == 5) {
                        return '<div class="layui-btn layui-btn-xs layui-bg-orange">取消</div>'
                    }
                    if (d.status == 7) {
                        return '<div class="layui-btn layui-btn-xs">上课中</div>'
                    }
                    if (d.status == 8) {
                        return '<div class="layui-btn layui-btn-xs">课程结束待下课</div>'
                    }
                    if (d.status == 6) {
                        return '<div class="layui-btn layui-btn-xs layui-bg-blue">课程结束已下课</div>'
                    }
                }
            },
            {field: 'signing', title: '签课信息', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.status == 1) {
                        return '<div class="layui-btn layui-btn-xs layui-bg-blue">已完成签课</div>'
                    }else if(d.status == 6){
                        return '<div class="layui-btn layui-btn-xs layui-bg-blue">会员签课</div>'
                    }else{
                        return '<div class="layui-btn layui-btn-xs">未签课</div>'
                    }
                }
            },
            {field: 'starttime', title: '课程开始时间', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.starttime != null) {
                        return Format(d.thisday, "yyyy/MM/dd") + "  " +d.starttime;
                    }
                }
            },
            {field: 'sing', title: '签课', minWidth:100, align:'center'},
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
    //搜索
    $(".search_btn").on("click",function(){
        table.reload("customerListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                name: $(".name").val(),
                phone: $(".phone").val()
            }
        })
    });
    table.on('row(courseList)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })

})