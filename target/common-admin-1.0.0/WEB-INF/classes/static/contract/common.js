//全局配置文件。来源于JavascriptServer->Home/ConfigJS
//var _YMGlobal;
//(function (_YMGlobal) {
//    var Config = (function () {
//        function Config() {

//        }
//        Config.currentCulture = "";
//        Config.apiUrl = "";
//        Config.token = "";
//        return Config;
//    })();
//    _YMGlobal.Config = Config;
//})(_YMGlobal || (_YMGlobal = {}));
//量取Json对象的数
//页面渲染时间格式数据进行时间格式化 例如 {{'2017-09-19 15:24:36' | formatTime('yyyy-MM-dd')}} 渲染显示结果 2017-09-19
Vue.filter("formatTime", function (v, format) {
    if (!v) return "";
    var d = v;
    if (typeof v === 'string') {
        if (v.indexOf("/Date(") > -1)
            d = new Date(parseInt(v.replace("/Date(", "").replace(")/", ""), 10));
        else
            d = new Date(Date.parse(v.replace(/-/g, "/").replace("T", " ").split(".")[0]));//.split(".")[0] 用来处理出现毫秒的情况，截取掉.xxx，否则会出错
    }
    var o = {
        "M+": d.getMonth() + 1,  //month
        "d+": d.getDate(),       //day
        "h+": d.getHours(),      //hour
        "m+": d.getMinutes(),    //minute
        "s+": d.getSeconds(),    //second
        "q+": Math.floor((d.getMonth() + 3) / 3),  //quarter
        "S": d.getMilliseconds() //millisecond
    };
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (d.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
});
function JSONLength(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};
//对于现实True和False的显示效果
function formatterCheckBox(value) {
    if (value) {
        return "<span class='fa fa-check-square-o'></span>";
    }
    else {
        return "<span class='fa fa-square-o'></span>";
    }
}
//圆点状态设置，只有蓝和绿色
function YesOrNoFormatter(value) {
    if (value) {
        return "<span class='label label-success'>是</span>";
    } else {
        return "<span class='label label-info'>否</span>";
    }
}
function CheckFormatter(value) {
    if (value) {
        return "<span class='label label-success'>已审核</span>";
    } else {
        return "<span class='label label-info'>未审核</span>";
    }
}
function DisableFormatter(value) {
    if (!value) {
        return "<span class='label label-success'>启用</span>";
    } else {
        return "<span class='label label-info'>禁用</span>";
    }
}
function OffFormatter(value) {
    if (value) {
        return "<span class='label label-success'>启用</span>";
    } else {
        return "<span class='label label-info'>禁用</span>";
    }
}
function ValidFormatter(value) {
    if (value == 1) {
        return "<span class='label label-success'>有效</span>";
    } else {
        return "<span class='label label-info'>无效</span>";
    }
}
function decimalPoint(value) {
    if (value != null) {
        if (value.toString().indexOf('.') == -1) {
            return value.toFixed(2);
        } else {
            return value;
        }
    }
};
function memCardStatusFormatter(value) {
    if (value == 0) {
        return "<span class='label label-error'>无效</span>";
    }
    else if (value == 1) {
        return "<span class='label label-success'>有效</span>";
    }
    else if (value == 2) {
        return "<span class='label label-warning'>挂失</span>";
    }
    else if (value == 3) {
        return "<span class='label label-danger'>转让</span>";
    }
    else if (value == 4) {
        return "<span class='label label-info'>续会</span>";
    }
    else if (value == 5) {
        return "<span class='label label-cancel'>退费</span>";
    }
    else if (value == 6) {
        return "<span class='label label-info'>待续会</span>";
    }
    else if (value == 7) {
        return "<span class='label label-info'>升级</span>";
    }
    else if (value == 8) {
        return "<span class='label label-warning'>过期</span>";
    }
}

//return formatDate(value, 'yyyy-MM-dd hh:mm:ss');
// return formatDate(value, 'yyyy-MM-dd');
//格式化时间
function formatDate(value) {
    return Dateformat(value, 'yyyy-MM-dd');
}
function formatTime(value) {
    return Dateformat(value, 'yyyy-MM-dd hh:mm:ss');
}
function formatTimeShort(value) {
    return Dateformat(value, 'hh:mm');
}
function Dateformat(v, format) {
    if (!v) return "";
    var d = v;
    if (typeof v === 'string') {
        if (v.indexOf("/Date(") > -1)
            d = new Date(parseInt(v.replace("/Date(", "").replace(")/", ""), 10));
        else
            d = new Date(Date.parse(v.replace(/-/g, "/").replace("T", " ").split(".")[0]));//.split(".")[0] 用来处理出现毫秒的情况，截取掉.xxx，否则会出错
    }
    var o = {
        "M+": d.getMonth() + 1,  //month
        "d+": d.getDate(),       //day
        "h+": d.getHours(),      //hour
        "m+": d.getMinutes(),    //minute
        "s+": d.getSeconds(),    //second
        "q+": Math.floor((d.getMonth() + 3) / 3),  //quarter
        "S": d.getMilliseconds() //millisecond
    };
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (d.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
};
//要获取的Url参数值
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return r[2];
    }
    return "";
}
//===========================字符串辅助================================
//生成唯一的GUID
function GetGuid() {
    var s4 = function () {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    };
    return s4() + s4() + s4() + "-" + s4();
}

//JQGrid行保存后成功返回结果分解对象
function JsonMessage(data) {
    /*
    适用于jQuery('#List').jqGrid('saveRow', id,successfunc(data){});
    */
    var msg = data.responseText.replace(/\"/g, "");
    var msgs = msg.split(',');
    this.type = msgs[0].split(':')[1];
    this.message = msgs[1].split(':')[1];
    this.value = msgs[2].split(':')[1];
    this.obj = msgs[3].split(':')[1];
};

//格式化日期2012-9-10 10:25:14=>2012-9-10
function DateFormat(name) {
    var date = $("#" + name).val();
    var dateArray = date.split(" ");
    $("#" + name).val(dateArray[0].replace("/", "-").replace("/", "-"));
}
//去掉最后一个逗号
function RemoveLastChar(str) {
    return str.substring(0, str.length - 1);
}
//根据字符将字符串分解成数组
function AnalyzeArr(str) {
    var arr_id = new Array();
    arr_id = str.split(",");
    return arr_id
}
/**
*取得字符的字节长度（汉字占2，字母占1）
*
*/
function strLen(s) {
    var len = 0;
    for (var i = 0; i < s.length; i++) {

        if (!ischinese(s.charAt(i))) {
            len += 1;
        } else {
            len += 2;
        }
    }
    return len;

}
/**
*判断是否中文函数
*/
function ischinese(s) {
    var ret = false;

    for (var i = 0; i < s.length; i++) {
        if (s.charCodeAt(i) >= 256) {
            ret = true;
            break;
        }
    }

    return ret;
}

//===========================系统管理JS函数================================
//Tab控制函数
function customTabs(tabId, tabNum) {
    //设置点击后的切换样式
    $(tabId + " .tab_nav li").removeClass("selected");
    $(tabId + " .tab_nav li").eq(tabNum).addClass("selected");
    //根据参数决定显示内容
    $(tabId + " .tab_con").hide();
    $(tabId + " .tab_con").eq(tabNum).show();
}

//接收人,接收人名称，信息 组需要加_ 
//返回信息ID
function SendMessage(receiver, receiverTitle, mes) {
    var returnResult = showModalDialog("/MIS/WebIM/CeleritySend", [receiver, receiverTitle, mes], "dialogLeft:150px;dialogTop:200px;dialogwidth:726px; dialogheight:206px;");
    return returnResult;
}
//返回选择人员列表
//返回人员ID列表   人员ID:^人员名称" ,格式：a,b,_c^[a],[b],[+c]
//没有选择返回一个""
function SelMemberList() {
    var value = 1;
    var returnResult = showModalDialog("/MIS/WebIM/SelMember", [value], "dialogLeft:150px;dialogTop:200px;dialogwidth:420px; dialogheight:440px;");
    return returnResult;
}
//================上传文件JS函数开始，需和jquery.form.js一起使用===============
//文件上传
function Upload(action, repath, uppath, iswater, isthumbnail, form) {

    var sendUrl = "/Core/upload_ajax.ashx?action=" + action + "&ReFilePath=" + repath + "&UpFilePath=" + uppath;
    //判断是否打水印
    if (arguments.length == 4) {
        sendUrl = "/Core/upload_ajax.ashx?action=" + action + "&ReFilePath=" + repath + "&UpFilePath=" + uppath + "&IsWater=" + iswater;
    }
    //判断是否生成宿略图
    if (arguments.length == 5 || arguments.length == 6) {
        //不是图片
        if (iswater != "" && isthumbnail != "") {
            sendUrl = "/Core/upload_ajax.ashx?action=" + action + "&ReFilePath=" + repath + "&UpFilePath=" + uppath + "&IsWater=" + iswater + "&IsThumbnail=" + isthumbnail;
        }
    }
    if (form == undefined || form == "") {
        form = "form";
    }
    //开始提交
    $(form).ajaxSubmit({
        beforeSubmit: function (formData, jqForm, options) {
            //隐藏上传按钮
            $("#" + repath).nextAll(".files").eq(0).hide();
            //显示LOADING图片
            $("#" + repath).nextAll(".uploading").eq(0).show();
        },
        success: function (data, textStatus) {
            if (data.msg == 1) {

                $("#" + repath).val(data.msgbox.split(",")[0]);

                $("#" + repath).next("img").attr("src", data.msgbox.split(",")[0]);
            } else {
                alert(data.msgbox);
            }
            $("#" + repath).nextAll(".files").eq(0).show();
            $("#" + repath).nextAll(".uploading").eq(0).hide();
        },
        error: function (data, status, e) {
            alert("上传失败，错误信息：" + e);
            $("#" + repath).nextAll(".files").eq(0).show();
            $("#" + repath).nextAll(".uploading").eq(0).hide();
        },
        url: sendUrl,
        type: "post",
        dataType: "json",
        timeout: 600000
    });
};
//附件上传
function AttachUpload(repath, uppath) {
    var submitUrl = "/Core/upload_ajax.ashx?action=AttachFile&UpFilePath=" + uppath;
    //开始提交
    $("form").ajaxSubmit({
        beforeSubmit: function (formData, jqForm, options) {
            //隐藏上传按钮
            $("#" + uppath).parent().hide();
            //显示LOADING图片
            $("#" + uppath).parent().nextAll(".uploading").eq(0).show();
        },
        success: function (data, textStatus) {
            if (data.msg == 1) {
                var listBox = $("#" + repath + " ul");
                var newLi = '<li>'
                    + '<input name="hidFileName" type="hidden" value="0|' + data.mstitle + "|" + data.msgbox + '" />'
                    + '<b class="close" title="删除" onclick="DelAttachLi(this);"></b>'
                    + '<span class="right">下载积分：<input name="txtPoint" type="text" class="input2" value="0" onkeydown="return checkNumber(event);" /></span>'
                    + '<span class="title">附件：' + data.mstitle + '</span>'
                    + '<span>人气：0</span>'
                    + '<a href="javascript:;" class="upfile"><input type="file" name="FileUpdate" onchange="AttachUpdate(\'hidFileName\',this);" /></a>'
                    + '<span class="uploading">正在更新...</span>'
                    + '</li>';
                listBox.append(newLi);
                //alert(data.mstitle);
            } else {
                alert(data.msgbox);
            }
            $("#" + uppath).parent().show();
            $("#" + uppath).parent().nextAll(".uploading").eq(0).hide();
        },
        error: function (data, status, e) {
            alert("上传失败，错误信息：" + e);
            $("#" + uppath).parent().show();
            $("#" + uppath).parent().nextAll(".uploading").eq(0).hide();
        },
        url: submitUrl,
        type: "post",
        dataType: "json",
        timeout: 600000
    });
};
//更新附件上传
function AttachUpdate(repath, uppath) {
    var btnOldName = $(uppath).attr("name");
    var btnNewName = "NewFileUpdate";
    $(uppath).attr("name", btnNewName);
    var submitUrl = "/Core/upload_ajax.ashx?action=AttachFile&UpFilePath=" + btnNewName;
    //开始提交
    $("form").ajaxSubmit({
        beforeSubmit: function (formData, jqForm, options) {
            //隐藏上传按钮
            $(uppath).parent().hide();
            //显示LOADING图片
            $(uppath).parent().nextAll(".uploading").eq(0).show();
        },
        success: function (data, textStatus) {
            if (data.msg == 1) {
                var ArrFileName = $(uppath).parent().prevAll("input[name='" + repath + "']").val().split("|");
                $(uppath).parent().prevAll("input[name='" + repath + "']").val(ArrFileName[0] + "|" + data.mstitle + "|" + data.msgbox);
                $(uppath).parent().prevAll(".title").html("附件：" + data.mstitle);
            } else {
                alert(data.msgbox);
            }
            $(uppath).parent().show();
            $(uppath).parent().nextAll(".uploading").eq(0).hide();
            $(uppath).attr("name", btnOldName);
        },
        error: function (data, status, e) {
            alert("上传失败，错误信息：" + e);
            $(uppath).parent().show();
            $(uppath).parent().nextAll(".uploading").eq(0).hide();
            $(uppath).attr("name", btnOldName);
        },
        url: submitUrl,
        type: "post",
        dataType: "json",
        timeout: 600000
    });
};
//===========================上传文件JS函数结束================================


//===========================计算辅助================================
//保留2位小数 3.14159 =3.14
function changeTwoDecimal(x) {
    if (x == "Infinity") {
        return;
    }
    var f_x = parseFloat(x);
    if (isNaN(f_x)) {
        return
    } else {
        var f_x = Math.round(x * 100) / 100;
        var s_x = f_x.toString();
        var pos_decimal = s_x.indexOf('.');
        if (pos_decimal < 0) {
            pos_decimal = s_x.length;
            s_x += '.';
        }
        while (s_x.length <= pos_decimal + 2) {
            s_x += '0';
        }
        return s_x;
    }
}
function isDate_yyyyMMdd(str) {
    var reg = /^([0-9]{1,4})(-|\/)([0-9]{1,2})\2([0-9]{1,2})$/;
    var r = str.match(reg);
    if (r == null) return false;
    var d = new Date(r[1], r[3] - 1, r[4]);
    var newstr = d.getFullYear() + r[2] + (d.getMonth() + 1) + r[2] + d.getDate();
    var yyyy = parseInt(r[1], 10);
    var mm = parseInt(r[3], 10);
    var dd = parseInt(r[4], 10);
    var compstr = yyyy + r[2] + mm + r[2] + dd;
    return newstr == compstr;
}
//16进制转字符
function hex2String(str) {
    var StrHex = "";
    var strInput = str;
    var nInputLength = strInput.length;
    if (nInputLength % 2 == 0) //当输入够偶数位；
    {
        for (var i = 0; i < nInputLength; i = i + 2) {
            var str = strInput.substr(i, 2); //16进制；
            //StrHex = StrHex + .toString(16);
            var n = parseInt(str, 16);//10进制；
            StrHex = StrHex + String.fromCharCode(n);
        }
    }
    return StrHex;
}

//字符转16进制
function stringToHex(str) {
    var val = "";
    var str = str;
    for (var i = 0; i < str.length; i++) {
        if (val == "")
            val = str.charCodeAt(i).toString(16);
        else
            val += str.charCodeAt(i).toString(16);
    }
    return val
}
//===========================上传文件JS函数结束================================
//是否存在指定函数 
function isExitsFunction(funcName) {
    try {
        if (typeof (eval(funcName)) == "function") {
            return true;
        }
    } catch (e) { }
    return false;
}
//是否存在指定变量 
function isExitsVariable(variableName) {
    try {
        if (typeof (variableName) == "undefined") {
            //alert("value is undefined"); 
            return false;
        } else {
            //alert("value is true"); 
            return true;
        }
    } catch (e) { }
    return false;
}
/*******************优化JS中加减乘除运算的时候出现的精度损失的BUG******************/

//加法优化方法
function addNumber(a, b) {
    var c, d, e;
    try {
        c = a.toString().split(".")[1].length;
    } catch (f) {
        c = 0;
    }
    try {
        d = b.toString().split(".")[1].length;
    } catch (f) {
        d = 0;
    }
    return e = Math.pow(10, Math.max(c, d)), (mulNumber(a, e) + mulNumber(b, e)) / e;
}
//减法优化方法
function subNumber(a, b) {
    var c, d, e;
    try {
        c = a.toString().split(".")[1].length;
    } catch (f) {
        c = 0;
    }
    try {
        d = b.toString().split(".")[1].length;
    } catch (f) {
        d = 0;
    }
    return e = Math.pow(10, Math.max(c, d)), (mulNumber(a, e) - mulNumber(b, e)) / e;
}
//乘法优化方法
function mulNumber(a, b) {
    var c = 0,
        d = a.toString(),
        e = b.toString();
    try {
        c += d.split(".")[1].length;
    } catch (f) { }
    try {
        c += e.split(".")[1].length;
    } catch (f) { }
    return Number(d.replace(".", "")) * Number(e.replace(".", "")) / Math.pow(10, c);
}
//除法优化方法
function divNumber(a, b) {
    var c, d, e = 0,
        f = 0;
    try {
        e = a.toString().split(".")[1].length;
    } catch (g) { }
    try {
        f = b.toString().split(".")[1].length;
    } catch (g) { }
    return c = Number(a.toString().replace(".", "")), d = Number(b.toString().replace(".", "")), mulNumber(c / d, Math.pow(10, f - e));
}
//格式化输出性别信息
function formatSex(val) {
    switch (val) {
        case "M" || 0 || "01":
            return "男";
            break;
        case "F" || 1 || "02":
            return "女";
            break;
        default:
            return "未知";
            break
    }
}
//根据传入的日期信息获取星期
function getWeekName(dateInfo, language) {
    var weekName = "";
    switch ((new Date(dateInfo)).getDay()) {
        case 0:
            weekName = language == "CN" ? "星期日" : "Sunday";
            break;
        case 1:
            weekName = language == "CN" ? "星期一" : "Monday";
            break;
        case 2:
            weekName = language == "CN" ? "星期二" : "Tuesday";
            break;
        case 3:
            weekName = language == "CN" ? "星期三" : "Wednesday";
            break;
        case 4:
            weekName = language == "CN" ? "星期四" : "Thursday";
            break;
        case 5:
            weekName = language == "CN" ? "星期五" : "Friday";
            break;
        case 6:
            weekName = language == "CN" ? "星期六" : "Saturday";
            break;
    }
    return weekName;
}

//CheckBox显示True或false
function formatCheckBox(val) {
    if (val) {
        return "<input type='checkbox' checked='checked' disabled='disabled'  />"
    } else {
        return "<input type='checkbox'  disabled='disabled'/>"
    }
}

function SetBussDate() {
    $.modalOpen({
        id: "SetBusinessDate",
        title: "设置营业日期",
        url: "/Pos/TotalBill/SetBusinessDate?hidSetDate=" + $("#hidSetDate").val(),
        width: "300px",
        height: "320px",
        btn: null
    });
}
function SetWorkShop(c_id) {
    $.modalOpen({
        id: "SetWorkShop",
        title: "选择分店",
        url: "/Pos/TotalBill/SetWorkShop?cid=" + c_id,
        width: "400px",
        height: "400px",
        btn: null
    });
}


//定时推送
function SendMessage() {
    var id = setInterval(function () {
        $.ajax({
            url: "/Customer/IfRemind",
            success: function (result) {
                if (result == "True") {
                    $.modalConfirm("有需要处理的会员信息，现在处理吗？", function (r) {
                        if (r) {
                            $.modalOpen({
                                id: "信息提醒",
                                title: "信息提醒",
                                url: "/Customer/CustomerRemind",
                                width: "1000px",
                                height: "700px"
                            });
                            top.layer.closeAll('dialog');
                        }
                    });

                }
            }
        })
        success: window.clearInterval(id);
    }, 2000);
}

/**
* EasyUI DataGrid根据字段动态合并单元格
* 参数 tableID 要合并table的id
* 参数 colList 要合并的列,用逗号分隔(例如："name,department,office");
*/
function mergeCellsByField(tableID, colList) {
    var ColArray = colList.split(",");
    var tTable = $("#" + tableID);
    var TableRowCnts = tTable.datagrid("getRows").length;
    var tmpA;
    var tmpB;
    var PerTxt = "";
    var CurTxt = "";
    var alertStr = "";
    for (j = ColArray.length - 1; j >= 0; j--) {
        PerTxt = "";
        tmpA = 1;
        tmpB = 0;

        for (i = 0; i <= TableRowCnts; i++) {
            if (i == TableRowCnts) {
                CurTxt = "";
            }
            else {
                CurTxt = tTable.datagrid("getRows")[i][ColArray[j]];
            }
            if (PerTxt == CurTxt) {
                tmpA += 1;
            }
            else {
                tmpB += tmpA;

                tTable.datagrid("mergeCells", {
                    index: i - tmpA,
                    field: ColArray[j],　　//合并字段
                    rowspan: tmpA,
                    colspan: null
                });
                tTable.datagrid("mergeCells", { //根据ColArray[j]进行合并
                    index: i - tmpA,
                    field: "Ideparture",
                    rowspan: tmpA,
                    colspan: null
                });

                tmpA = 1;
            }
            PerTxt = CurTxt;
        }
    }
}


function DateAdd(interval, number, date) {
    /* 
      *   功能:实现VBScript的DateAdd功能. 
      *   参数:interval,字符串表达式，表示要添加的时间间隔. 
      *   参数:number,数值表达式，表示要添加的时间间隔的个数. 
      *   参数:date,时间对象. 
      *   返回:新的时间对象. 
      *   var   now   =   new   Date(); 
      *   var   newDate   =   DateAdd( "d ",5,now); 
      *---------------   DateAdd(interval,number,date)   ----------------- 
      */
    var dateTemp = date.split("-");
    var nDate = new Date(dateTemp[0], (dateTemp[1] - 1), dateTemp[2]); //转换为MM-DD-YYYY格式  (dateTemp[1] - 1) + '-' + dateTemp[2] + '-' + dateTemp[0]    
    var millSeconds = Math.abs(nDate);
    var date = new Date(millSeconds);
    switch (interval) {
        case "y ": {
            date.setFullYear(date.getFullYear() + number);
            return date;
            break;
        }
        case "q ": {
            date.setMonth(date.getMonth() + number * 3);
            return date;
            break;
        }
        case "m ": {
            date.setMonth(date.getMonth() + number);
            return date;
            break;
        }
        case "w ": {
            date.setDate(date.getDate() + number * 7);
            return date;
            break;
        }
        case "d ": {
            date.setDate(date.getDate() + number);
            return date;
            break;
        }
        case "h ": {
            date.setHours(date.getHours() + number);
            return date;
            break;
        }
        case "m ": {
            date.setMinutes(date.getMinutes() + number);
            return date;
            break;
        }
        case "s ": {
            date.setSeconds(date.getSeconds() + number);
            return date;
            break;
        }
        default: {
            date.setDate(d.getDate() + number);
            return date;
            break;
        }
    }
}

Date.prototype.pattern = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //小时 
        "H+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    var week = {
        "0": "\u65e5",
        "1": "\u4e00",
        "2": "\u4e8c",
        "3": "\u4e09",
        "4": "\u56db",
        "5": "\u4e94",
        "6": "\u516d"
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    if (/(E+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f" : "\u5468") : "") + week[this.getDay() + ""]);
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}

//保存加载中 2018-4-28 zl
function loading(){
   return layer.msg('正在保存,请稍候...', { icon: 16, shade: 0.3, time: false })
}