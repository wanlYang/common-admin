
layui.use(['form', 'layer','upload', 'laydate'], function() {
	var form = layui.form
	layer = parent.layer === undefined ? layui.layer : top.layer,
		$ = layui.jquery,
		upload = layui.upload,
		laydate = layui.laydate;
	
	form.verify({});
    upload.render({
    	 elem: '#table_img'
         , url: getRealPath() + "/admin/cources/table/add/upload/img" //必填项
         , method: ''  //可选项。HTTP类型，默认post
         ,size:300
         ,data:{
            storename:function () {

                 return $(".storename").val();
             }
         }
         , accept: 'images'
         , acceptMime: 'image/*'
         , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
             //预读本地文件示例，不支持ie8
         }
         ,done: function(result){
    	     if (result.code != 0){
                 layer.msg(result.msg)
             }else{
                 var tableImg = $("#tableImg");
                 tableImg[0].src = result.data.src;
                 layer.msg(result.msg,{icon: 1});
                 setTimeout(function() {
                     top.layer.msg("添加成功！");
                     var index=parent.layer.getFrameIndex(window.name); //获取当前窗口的name
                     parent.layer.close(index);
                     parent.location.reload();
                 }, 500);

             }

          }
          ,error: function(){
               layer.msg("上传失败");
         }
    });
})