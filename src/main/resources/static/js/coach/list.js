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
        elem: '#coachList',
        url : '/coach/select',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "coachListTable",
        cols : [[
            {type:'radio',fixed:'left'},
            {field: 'coachNumber', title: '教练编号', minWidth:100, align:"center"},
            {field: 'name', title: '教练姓名', minWidth:100, align:"center"},
            {field: 'phone', title: '电话', minWidth:100, align:'center'},
            {field: 'sex', title: '性别', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.sex == 1){
                        return "男"
                    }
                    if (d.sex == 0){
                        return "女"
                    }
                }
            },
            {
                field: 'courses',
                title: '舞种信息',
                event: 'course',
                align: 'center',
                templet: function(d) {
                    return '<button class="layui-btn layui-btn-xs courses">点击查看</button>';
                }
            },
            {field: 'status', title: '状态', minWidth:100, align:'center',
                templet:function (d) {
                    if (d.status == 0){
                        return '<div class="layui-btn layui-btn-xs">正常</div>'
                    }
                    if (d.status == 1){
                        return '<div class="layui-btn layui-btn-xs  layui-btn-danger">请假</div>'
                    }
                    if (d.status == 2){
                        return '<div class="layui-btn layui-btn-xs layui-bg-black">离职</div>'
                    }
                }
            },
            {field: 'freeCoach', title: '是否自由教练', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.freeCoach == 1){
                        return "是"
                    }else {
                        return "否"
                    }
                }
            },
            {field: 'isManager', title: '是否经理', minWidth:100, align:'center',
                templet:function (d) {
                    if(d.isManager == 1){
                        return "是"
                    }else {
                        return "否"
                    }
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

    table.on('row(coachList)', function (obj) {
        obj.tr.addClass("layui-table-click").siblings().removeClass("layui-table-click");
        obj.tr.find("div.layui-unselect.layui-form-radio")[1].click();
    })
    //搜索
    $(".search_btn").on("click",function(){
        table.reload("coachListTable",{
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
    function addCoach() {
        var index = layui.layer.open({
            title: "新增教练",
            type: 2,
            content: "/coach/add",
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
    $(".add_btn").click(function() {
        addCoach();
    })

    //编辑按钮
    function editCoach(data) {
        var index = layui.layer.open({
            title: "编辑教练",
            type: 2,
            content: "/coach/edit",
            success: function(layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                var iframeWindow = window[layero.find('iframe')[0]['name']];
                body.find("#id").val(data.id);
                body.find(".userName").val(data.user.name);
                body.find(".name").val(data.name);
                body.find(".phone").val(data.phone);
                body.find(".coachNumber").val(data.coachNumber);
                body.find(".briefIntroduction").val(data.briefIntroduction);
                body.find(".remark").val(data.remark);
                body.find("input:radio[name='sex']").each(function() {
                    // 判断需要对那个选项进行回显
                    if (this.value == data.sex) {
                        // 进行回显
                        $(this).attr("checked","checked");
                    }

                })
                    // 判断需要对那个选项进行回显
                if (data.isManager == 1) {
                    // 进行回显
                    body.find("input:checkbox[name='isManager']").attr("checked","checked");
                    body.find("input:checkbox[name='isManager']").val(1)
                }
                if (data.freeCoach == 1) {
                    // 进行回显
                    body.find("input:checkbox[name='freeCoach']").attr("checked","checked");
                    body.find("input:checkbox[name='isManager']").val(1)
                }
                body.find("#status").each(function() {
                    // this代表的是<option></option>，对option再进行遍历
                    $(this).children("option").each(function() {
                        // 判断需要对那个选项进行回显
                        if (this.value == data.status) {
                            // 进行回显
                            $(this).attr("selected","selected");
                        }
                    });
                })
                $.ajax({
                    type: "POST",
                    async:false,
                    url: "/course/list/data",
                    success: function(result) {
                        if(result.status == 200) {
                            var html = '';
                            $.each(result.data,function (index,item) {
                                html += '<input type="checkbox" lay-skin="primary" title="'+item.name+'" name="course" value="'+item.id+'"/>';
                            })
                            body.find("#course").html(html);
                            if (typeof(iframeWindow.layui.form) != "undefined") {
                                iframeWindow.layui.form.render();
                            }
                        } else {
                            top.layer.close(index);
                            top.layer.msg("获取失败！" + result.message);
                        }
                    }
                });
                var courseArr = [];
                $.ajax({
                    type: "POST",
                    async:false,
                    url: "/course/get/course",
                    data:{"id":data.id},
                    success: function(result) {
                        if(result.status == 200) {
                            $.each(result.data,function (j,item) {
                                courseArr.push(item.course.id)
                            })
                            
                        } else {
                            top.layer.close(index);
                            top.layer.msg("获取失败！" + result.message);
                        }
                    }
                });
                body.find("input:checkbox[name='course']").each(function() {
                    // 判断需要对那个选项进行回显
                    var flag = this;
                    $.each(courseArr,function (i,item) {
                        if (flag.value == item) {
                            // 进行回显
                            $(flag).attr("checked","checked");
                        }
                    })


                })

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
    //编辑客户
    $(".edit_btn").click(function(){
        var checkStatus = table.checkStatus('coachListTable'),
            data = checkStatus.data;
        if(data.length > 1){
            layer.msg("请选择一个需要修改的教练");
        }else if(data.length == 0){
            layer.msg("请选择需要修改的教练");
        }else{
            editCoach(data[0]);
        }
    });
    //删除
    $(".del_btn").click(function(){
        var checkStatus = table.checkStatus('coachListTable'),
            data = checkStatus.data;
        if(data.length > 0) {
            layer.confirm('确定删除选中的教练？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/coach/delete",{
                    id : data[0].id
                },function(data){
                    layer.close(index);
                    tableIns.reload();
                    if (data.data){
                        layer.msg("删除成功！");
                    } else {
                        layer.msg(data.msg);
                    }
                })
            })
        }else{
            layer.msg("请选择需要删除的项");
        }
    })

    table.on('tool(coachList)', function(obj) {
        var layEvent = obj.event,
            data = obj.data;
        //监听单元格事件
        if(obj.event === "course") {
            //定义变量
            var coursesHtml = '';
            $.ajax({
                type: "POST",
                async:false,
                data:{"id":data.id},
                url: "/coach/get/course",
                success: function(result) {
                    if(result.status == 200) {
                        $.each(result.data, function(index,value) {
                            //追加变量
                            coursesHtml +='<tr>' +
                                '<td>' +
                                value.course.name
                                + '</td>' +
                                '</tr>';
                        });

                    } else {
                        top.layer.close(index);
                        top.layer.msg("获取失败！" + result.message);
                    }
                }
            });
            $.get("/coach/get/course",{
                id : data.id
            },function(result){
                if (result.status == 200){

                } else {
                    layer.msg(data.message);
                }
            })



            //打开权限窗
            layer.open({
                type: 1,
                title: data.name + ' 舞种信息',
                closeBtn: 0, //不显示关闭按钮
                anim: 2,
                shadeClose: true, //开启遮罩关闭
                area: ['380px', '200px'],
                content:'<div style="padding:20px;">' +
                    '<ul id="htmlroles">' +
                    '<table class="layui-table">' +
                    '<thead>' +
                    '<tr>' +
                    '<th>' +
                    '舞种名称' +
                    '</th>'  +
                    '</tr>' +
                    '</thead>' +
                    '<tbody>' +
                    coursesHtml
                    + '</tbody>' +
                    '</table>' +
                    '</ul>' +
                    '</div>'
            });
        };

    })
})