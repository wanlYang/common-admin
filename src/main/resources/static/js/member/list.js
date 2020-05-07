
layui.use(['form','layer','table','laydate'],function(){
    var $ = layui.jquery,
        table = layui.table,
        laydate = layui.laydate;

    laydate.render({
        elem: '#startTime',
        type: 'date',
        format: 'yyyy-MM-dd'
    })
    laydate.render({
        elem: '#endTime',
        type: 'date',
        format: 'yyyy-MM-dd'
    })
    //订单列表
    var tableIns = table.render({
        elem: '#memberList',
        url : '/member/list/data',
        cellMinWidth : 95,
        page:true,
        limit:10,
        limits:[10,20,30,40],
        id : "memberListTable",
        cols : [[
            {field: 'name', title: '姓名', minWidth:80, align:"center",
                templet:function (d) {
                    if(d.name != null && d.name != ''){
                        return d.name
                    }
                    return "空"
                }
            },
            {field: 'nickName', title: '昵称', minWidth:80, align:'center',
                templet:function (d) {
                    if(d.nickName != null && d.nickName != ''){
                        return d.nickName
                    }
                    return "空"
                },
            },
            {field: 'phone', title: '电话', minWidth:80, align:'center',
                templet:function (d) {
                    if(d.phone != null && d.phone != ''){
                        return d.phone
                    }
                    return "空"
                }
            },
            {field: 'phone', title: '头像',style:"height:100px;", minWidth:80, align:'center',
                templet:function (d) {
                    if(d.userHeaderImg != null && d.userHeaderImg != ''){
                        return "<img src='"+d.userHeaderImg+"'style='width: 100px;height: 100px' />"
                    }
                    return "空"
                }
            },
            {field: 'status', title: 'VIP状态', minWidth:80, align:'center',
                templet:function (d) {
                    if (d.vipStatus == 1 && d.videoStatus == 1) {
                        return '<span class="layui-btn layui-btn-xs layui-bg-blue">团课VIP '+timestampToTime(d.vipTime)+'</span>' + '<span class="layui-btn layui-btn-xs layui-bg-orange">大课VIP ' + timestampToTime(d.videoTime) + '</span>'
                    }
                    if (d.videoStatus == 1) {
                        return '<span class="layui-btn layui-btn-xs layui-bg-orange">大课VIP ' + timestampToTime(d.videoTime) + '</span>'
                    }
                    if (d.vipStatus == 1) {
                        return '<span class="layui-btn layui-btn-xs layui-bg-blue">团课VIP ' + timestampToTime(d.vipTime) + '</span>'
                    }
                    return '<span class="layui-btn layui-btn-xs layui-bg-blue">无</span>'
                }
            },
            {field: 'addTime', title: '添加日期', minWidth:80, align:'center',
                templet:function (d) {
                    if (d.addTime != null) {
                        return timestampToTime(d.addTime);
                    }
                    return "空"
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
    //搜索
    $(".search_btn").on("click",function(){
        var startTime = $(".startTime").val();
        var endTime = $(".endTime").val();
        table.reload("memberListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                status: $(".status").val(),
                startTime: startTime != "" ? new Date(startTime).getTime()/1000 : "",
                endTime:endTime !="" ? new Date(endTime).getTime()/1000 :""
            }
        })
    });
    table.on('row(memberList)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })


})