layui.config({
    base : "/static/js/modules/"
}).extend({
    "treeGrid" : "treetable/treeGrid",
    "common" : "common"
});
layui.use(['form','layer','table','laydate','treeGrid','common'],function(){
    var $ = layui.jquery,
        table = layui.table,
        laydate = layui.laydate;
    var treeGrid = layui.treeGrid;
    var common = layui.common;
    var form = layui.form;

    treeGrid.render({
        id:'fromsourceList',
        elem: '#fromsourceList'
        ,url:'/fromsource/select'
        ,treeId:'id'//树形id字段名称
        ,treeUpId:'parentId'//树形父id字段名称
        ,treeShowName:'name'//以树形式显示的字段
        ,cols: [[
            // {type:'checkbox'}
            {field:'name', width:'500', title: '名称'}
            ,{field:'id', width:'100', title: 'id'}
            ,{field:'parentId', width:'100', title: 'parentId'}
            ,{title:'操作',fixed: 'right', align:'center', toolbar: '#barDemo'}
        ]]
        ,page:false
    });
    treeGrid.on('tool(fromsourceList)',function (obj) {
        var data = obj.data;
        if(obj.event === 'edit'){//编辑
            layui.layer.open({
                title : "编辑",
                type : 2,
                area : ["545px","500px"],
                content : "/fromsource/edit",
                success : function(layero, index){
                    var body = layui.layer.getChildFrame('body', index);
                    var iframeWindow = window[layero.find('iframe')[0]['name']];
                    body.find("#id").val(data.id);
                    body.find("#fromName").val(data.name);
                    $.ajax({
                        type: "POST",
                        url: "/fromsource/select/all",
                        success: function(result) {
                            if(result.status == 200) {
                                var html = '';
                                $.each(result.data,function (index,item) {
                                    html += '<option value="'+item.id+'">'+item.name+'</option>';
                                })
                                body.find("#parentFromId").append(html);
                                if (typeof(iframeWindow.layui.form) != "undefined") {
                                    iframeWindow.layui.form.render();
                                }
                                body.find("#parentFromId").each(function() {
                                    // this代表的是<option></option>，对option再进行遍历
                                    $(this).children("option").each(function() {
                                        // 判断需要对那个选项进行回显
                                        console.log(this.value)
                                        if (this.value == data.parentId) {
                                            // 进行回显
                                            $(this).attr("selected","selected");
                                        }
                                    });
                                })
                                if (typeof(iframeWindow.layui.form) != "undefined") {
                                    iframeWindow.layui.form.render();
                                }
                            } else {
                                top.layer.msg("获取失败！" + result.message);
                            }
                        }
                    });
                    if (typeof(iframeWindow.layui.form) != "undefined") {
                        iframeWindow.layui.form.render();
                    }
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回权限列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500)
                }
            })
        }else if(obj.event === 'del'){
            layer.confirm('确定删除此来源吗？', {icon: 3, title: '提示信息'}, function (index) {
                $.ajax({
                    url: "/fromsource/del",
                    type: "post",
                    data: {id : data.id},
                    success: function(res){
                        layer.close(index);
                        if (res.status==200){
                            layer.msg("删除成功！");
                        } else {
                            layer.msg(res.message);
                        }
                    },
                    error: function (xmlHttpRequest) {
                        layer.close(index);
                        common.outErrorMsg(xmlHttpRequest);
                    }
                });
                setTimeout(function(){
                    location.reload();//刷新页面
                },1500);
            });
        }
    });
    //点击添加
    $(".add_btn").click(function(){
        addFromsource(null);
    });

    //添加来源
    function addFromsource(edit){
        var title = edit===null?"添加来源":"编辑来源";
        layui.layer.open({
            title : title,
            type : 2,
            area : ["545px","500px"],
            content : "/fromsource/add",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                if(edit){
                    body.find("#id").val(edit.id);
                    body.find(".permissionName").val(edit.permissionName);
                    body.find(".permissionCode").val(edit.permissionCode);
                    body.find("#url").val(edit.url);
                    body.find("#availableSelect").val(edit.available);
                    body.find("#resourceType").val(edit.resourceType);
                    body.find("#parentId").val(edit.parentId);
                    form.render();
                }
                setTimeout(function(){
                    layui.layer.tips('点击此处返回权限列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
    }
})