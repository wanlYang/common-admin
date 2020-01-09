layui.config({
    base : "/static/js/modules/"
}).extend({
    "treeGrid" : "treetable/treeGrid",
    "common" : "common"
});
layui.use(['form', 'table','treeGrid', 'common'], function () {
    var form = layui.form;
    var $ = layui.jquery;
    var table = layui.table;
    var treeGrid = layui.treeGrid;
    var common = layui.common;
    treeGrid.render({
        id:'permissionTable',
        elem: '#auth-table'
        ,url:'/permission/listData'
        ,cellMinWidth: 100
        ,treeId:'id'//树形id字段名称
        ,treeUpId:'parentId'//树形父id字段名称
        ,treeShowName:'permissionName'//以树形式显示的字段
        ,cols: [[
            // {type:'checkbox'}
            {field:'permissionName', width:'500', title: '名称'}
            ,{field:'id', width:'100', title: 'id'}
            ,{field:'parentId', width:'100', title: 'parentId'}
            ,{field:'permissionCode', width:'150', title: '权限编码'}
            ,{field:'url', width:'300', title: '地址'}
            ,{
                field: 'resourceType', width: 100, align: 'center', templet: function (d) {
                    if(d.resourceType === "top_directory"){
                        return '<span class="layui-badge layui-bg-blue">顶级目录</span>';
                    }else if (d.resourceType === "directory") {
                        return '<span class="layui-badge layui-bg-blue">目录</span>';
                    }else if (d.resourceType === "menu") {
                        return '<span class="layui-badge layui-badge-rim">菜单</span>';
                    } else if (d.resourceType === "button")  {
                        return '<span class="layui-badge layui-bg-gray">按钮</span>';
                    }
                }, title: '资源类型'
            },
            {
                field: 'available',  align: 'center', templet: function (d) {
                    if (d.available === 1) {
                        return '<span class="layui-badge layui-bg-green">启用</span>';
                    } else {
                        return '<span class="layui-badge layui-bg-cyan">禁用</span>';
                    }
                }, title: '权限状态'
            }
            ,{title:'操作',fixed: 'right', align:'center', toolbar: '#barDemo'}
        ]]
        ,page:false
    });
    treeGrid.on('tool(auth-table)',function (obj) {
        var data = obj.data;
        if(obj.event === 'edit'){//编辑
            addPermission(data);
        }else if(obj.event === 'del'){
            layer.confirm('确定删除此权限？', {icon: 3, title: '提示信息'}, function (index) {
                $.ajax({
                    url: "/permission/del",
                    type: "post",
                    data: {id : data.id},
                    success: function(res){
                        layer.close(index);
                        if (res.data){
                            layer.msg("删除成功！");
                        } else {
                            layer.msg(res.msg);
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
        addPermission(null);
    });

    //添加权限
    function addPermission(edit){
        var title = edit===null?"添加权限":"编辑权限";
        layui.layer.open({
            title : title,
            type : 2,
            area : ["545px","500px"],
            content : "info.html",
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



});