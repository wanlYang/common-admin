layui.use(['form','layer','table'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;

    // var roleList;
    // $.post("/paytype/select",{
    //     available : 1
    // },function(data){
    //     roleList = data.data;
    //     roleList.forEach(function(e){
    //         $("#roleSelect").append("<option value='"+e.id+"'>"+e.roleName+"</option>");
    //     });
    //     form.render('select');//刷新select选择框渲染
    // });

    //卡项列表
    var tableIns = table.render({
        elem: '#cardSet',
        url : '/cardsetting/select',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "cardSet",
        cols : [[
            {type: "radio", fixed:"left", width:50},
            {field: 'name', title: '卡项名称', minWidth:100, align:'center'},
            {field: 'cardType', title: '卡项类型', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.cardType==1){
                        return "计时卡";
                    }
                    if (d.cardType==2){
                        return "次卡";
                    }
                    if (d.cardType==3){
                        return "时效性卡";
                    }
                }
            },
            {field: 'money', title: '卡金额', minWidth:100, align:'center'},
            {field: 'validity', title: '有效期', minWidth:100, align:'center'},
            {field: 'daysCan', title: '可用时间', minWidth:160, align:'center'},
            {field: 'status', title: '是否启用', minWidth:50, align:'center',
                templet: function (d) {
                    if (d.status == 0) {
                        return "未启用"
                    }
                    if (d.status == 1) {
                        return "启用"
                    }
                }
            },
            // {field: 'startTime', title: '可使用开始时间', minWidth:160, align:'center',
            //     templet: function (d) {
            //         return Format(d.startTime,"yyyy-MM-dd")
            //     }},
            // {field: 'endTime', title: '可使用结束时间', minWidth:160, align:'center',
            //     templet: function (d) {
            //         return Format(d.endTime,"yyyy-MM-dd")
            //     }
            // },
            {field: 'remark', title: '备注', minWidth:160, align:'center'},
            {field: 'createTime', title: '操作时间', minWidth:160, align:'center',
                templet: function (d) {
                    return Format(d.createTime,"yyyy-MM-dd hh:mm:ss")
                }
            }
        ]]
    });
    table.on('row(cardSet)',function(obj){
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })
    //添加卡项
    function addCard(){
        var h = "650px";
        var title = "添加卡项";
        layui.layer.open({
            title : title,
            type : 2,
            area : ["540px",h],
            content : "/cardsetting/info"//页面
        })
    }



    $(".add_btn").click(function(){
        addCard();
    });



})
