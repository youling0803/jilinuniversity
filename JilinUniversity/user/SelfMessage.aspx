<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelfMessage.aspx.cs" Inherits="JilinUniversity.user.SelfMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/gridviewStyle.css" rel="stylesheet" />
    <link href="../css/gridview.css" rel="stylesheet" />
    <link href="../css/tableBase.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/xcConfirm.css" rel="stylesheet" />
    <link href="../css/searchStyle.css" rel="stylesheet" />
    <link href="../css/WdatePicker.css" rel="stylesheet" />
    <%--<link type="text/css" href="../css/login/password.css" rel="stylesheet" />--%>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/tablebase.js"></script>
    <script src="../js/xcConfirm.js"></script>
    <script src="../js/alert.js"></script>
    <script src="../js/cookie.js"></script>
    <script src="../js/showHide.js"></script>
    <script src="../js/WdatePicker.js"></script>

    <%-- 中英文切换--%>
    <script src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/i18next-1.6.3.min.js"></script>
    <%-- 控制表格中全选按钮的位置--%>
    <script type="text/javascript">
        function SelectAlles(spanChk) {
            elm = document.forms[0];

            for (i = 0; i < elm.length; i++) {
                if (elm[i].type == "checkbox" && elm[i].id != spanChk.id) {
                    if (elm.elements[i].checked != spanChk.checked)
                        elm.elements[i].click();
                }
            }
        }

        //function deleteclick() {
        //    var hiddenbuttonOffdata = document.getElementById("hiddenbuttonOffdata");
        //    hiddenbuttonOffdata.click();
        //}

    </script>
    <script type="text/javascript">
        var btns = document.getElementsByClassName("top-navs");
        var subnavs = document.getElementsByClassName("top-navlist");
        var titleNavs = document.getElementsByClassName("title-navs");
        var titleOptions = document.getElementsByClassName("title-option");
        var tableSort = document.getElementsByClassName("table-sort");
        //var imgs = document.getElementById('imgs').src;
        window.onload = function () {
            showHide(btns, subnavs);
            showHide(titleNavs, titleOptions);
            Onclick(tableSort);

        }
    </script>
</head>
<body>
    <div class="content_top">
        <div class="position">
            <div class="position_content">
                <i class="glyphicon glyphicon-home" style="cursor: pointer;"></i>
                <span>></span>
                <span>个人信息</span>
            </div>
            <div class="position_bottom">
                <a onclick="renovates()" data-i18n="General.refresh">刷新</a>
                <i class="glyphicon glyphicon-repeat" style="cursor: pointer; color: #32e184" onclick="renovates()"></i>&nbsp&nbsp&nbsp
           <a onclick="close_tab()" data-i18n="General.close">关闭</a>
                <i class="glyphicon glyphicon-remove" style="cursor: pointer; color: #e13233" onclick="close_tab()"></i>
            </div>
        </div>
    </div>
    <form id="Form" runat="server" method="post">
        <div class="tab-content table_num">

            <asp:HiddenField ID="HiddenFieldDetail" runat="server" />
            <%--<input type="button" id="hiddenbuttonOffdata" runat="server" onserverclick="hiddenbuttonOffdata_Click" style="display: none" />--%>
            <div class="person-list-con">
                <table class="person-table" cellpadding="0" cellspacing="0" style="border-top: 1px solid #ddd;">
                    <tbody>
                        <tr>
                            <input id="id" type="hidden" name="id" value="0d75047c71ce43e98eb0276616ce648c">
                            <td align="right">用户名:</td>
                            <td colspan="4" align="center">
                                <input id="username" type="text" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;" name="username" readonly="readonly" /></td>
                            <td align="right">身份证/护照号码:</td>
                            <td colspan="4" align="center">
                                <input id="card" type="text" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;" name="card" /></td>
                        </tr>
                        <tr>

                            <td align="right">姓名:</td>
                            <td colspan="4" align="center">
                                <input id="realname" type="text" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;" name="realname" /></td>

                            <td align="right">Email:</td>
                            <td colspan="4" align="center">
                                <input id="email" type="text" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;" name="email" /></td>
                        </tr>
                        <tr>
                            <td align="right">电话:</td>
                            <td colspan="4" align="center">
                                <input id="mobilePhone" type="text" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;" name="mobilePhone" /></td>

                            <td align="right">生日:</td>
                            <td colspan="4" align="center">
                                <input id="birthday" name="birthday" type="text" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;" /></td>
                        </tr>
                        <tr>
                            <td align="right">单位名称:</td>
                            <td colspan="4" align="center">
                                <input id="danwei" type="text" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;" name="danwei" /></td>

                            <td align="right">单位类型:</td>
                            <td colspan="4" align="center">
                                <select name="dwlx" id="dwlx" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;">
                                    <option value="--请选择--">--请选择--</option>
                                    <option value="中科院院属单位">中科院院属单位</option>
                                    <option value="高校" selected="">高校</option>
                                    <option value="其他研究院所">其他研究院所</option>
                                    <option value="政府机构">政府机构</option>
                                    <option value="企业">企业</option>
                                    <option value="医院">医院</option>
                                    <option value="国外机构">国外机构</option>
                                    <option value="其他">其他</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td align="right">地址:</td>
                            <td colspan="4" align="center">
                                <input id="txdz" type="text" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;" name="txdz" /></td>

                            <td align="right">学历:</td>
                            <td colspan="4" align="center">
                                <select name="xwlx" id="xwlx" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;">
                                    <option value="--请选择--">--请选择--</option>
                                    <option value="专科">专科</option>
                                    <option value="本科">本科</option>
                                    <option value="硕士" selected="">硕士</option>
                                    <option value="博士">博士</option>
                                    <option value="其他">其他</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td align="right">性别:</td>
                            <td colspan="4" align="center">
                                <select name="gender" id="gender" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;">
                                    <option value="--请选择--">--请选择--</option>
                                    <option value="男" selected="">男</option>
                                    <option value="女">女</option>
                                </select>
                            </td>

                            <td align="right">职称:</td>
                            <td colspan="4" align="center">
                                <select name="zczw" id="zczw" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;">
                                    <option value="--请选择--">--请选择--</option>
                                    <option value="研究员">研究员</option>
                                    <option value="副研究员">副研究员</option>
                                    <option value="助理研究员" selected="">助理研究员</option>
                                    <option value="正高级工程师">正高级工程师</option>
                                    <option value="高级工程师">高级工程师</option>
                                    <option value="工程师">工程师</option>
                                    <option value="助理工程师">助理工程师</option>
                                    <option value="技术员">技术员</option>
                                    <option value="教授">教授</option>
                                    <option value="副教授">副教授</option>
                                    <option value="讲师">讲师</option>
                                    <option value="助教">助教</option>
                                    <option value="博士后">博士后</option>
                                    <option value="主任医师">主任医师</option>
                                    <option value="副主任医师">副主任医师</option>
                                    <option value="主治医师">主治医师</option>
                                    <option value="医师">医师</option>
                                    <option value="高级实验师">高级实验师</option>
                                    <option value="实验师">实验师</option>
                                    <option value="助理实验师">助理实验师</option>
                                    <option value="其他">其他</option>
                                    <option value="学生">学生</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td align="right">国籍:</td>
                            <td colspan="4" align="center">
                                <select name="gj" id="gj" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;">
                                    <option value="--请选择--">--请选择--</option>
                                    <option value="中国" selected="">中国</option>
                                    <option value="朝鲜">朝鲜</option>
                                    <option value="老挝">老挝</option>
                                    <option value="越南">越南</option>
                                    <option value="印度">印度</option>
                                    <option value="印尼">印尼</option>
                                    <option value="约旦">约旦</option>
                                    <option value="沙特">沙特</option>
                                    <option value="缅甸">缅甸</option>
                                    <option value="日本">日本</option>
                                    <option value="蒙古">蒙古</option>
                                    <option value="巴林">巴林</option>
                                    <option value="不丹">不丹</option>
                                    <option value="韩国">韩国</option>
                                    <option value="泰国">泰国</option>
                                    <option value="文莱">文莱</option>
                                    <option value="阿曼">阿曼</option>
                                    <option value="也门">也门</option>
                                    <option value="伊朗">伊朗</option>
                                    <option value="以色列">以色列</option>
                                    <option value="阿富汗">阿富汗</option>
                                    <option value="阿联酋">阿联酋</option>
                                    <option value="卡塔尔">卡塔尔</option>
                                    <option value="柬埔寨">柬埔寨</option>
                                    <option value="科威特">科威特</option>
                                    <option value="土耳其">土耳其</option>
                                    <option value="土库曼">土库曼</option>
                                    <option value="尼泊尔">尼泊尔</option>
                                    <option value="黎巴嫩">黎巴嫩</option>
                                    <option value="孟加拉">孟加拉</option>
                                    <option value="伊拉克">伊拉克</option>
                                    <option value="哈萨克">哈萨克</option>
                                    <option value="格鲁吉亚">格鲁吉亚</option>
                                    <option value="马尔代夫">马尔代夫</option>
                                    <option value="马来西亚">马来西亚</option>
                                    <option value="菲律宾">菲律宾</option>
                                    <option value="叙利亚">叙利亚</option>
                                    <option value="新加坡">新加坡</option>
                                    <option value="塔吉克">塔吉克</option>
                                    <option value="吉尔吉斯">吉尔吉斯</option>
                                    <option value="塞浦路斯">塞浦路斯</option>
                                    <option value="斯里兰卡">斯里兰卡</option>
                                    <option value="阿塞拜疆">阿塞拜疆</option>
                                    <option value="巴基斯坦">巴基斯坦</option>
                                    <option value="乌兹别克">乌兹别克</option>
                                    <option value="巴勒斯坦">巴勒斯坦</option>
                                    <option value="亚美尼亚">亚美尼亚</option>
                                    <option value="埃及">埃及</option>
                                    <option value="贝宁">贝宁</option>
                                    <option value="多哥">多哥</option>
                                    <option value="刚果">刚果</option>
                                    <option value="加纳">加纳</option>
                                    <option value="加蓬">加蓬</option>
                                    <option value="马里">马里</option>
                                    <option value="中非">中非</option>
                                    <option value="乍得">乍得</option>
                                    <option value="苏丹">苏丹</option>
                                    <option value="卢旺达">卢旺达</option>
                                    <option value="安哥拉">安哥拉</option>
                                    <option value="布隆迪">布隆迪</option>
                                    <option value="佛得角">佛得角</option>
                                    <option value="冈比亚">冈比亚</option>
                                    <option value="吉布提">吉布提</option>
                                    <option value="几内亚">几内亚</option>
                                    <option value="利比亚">利比亚</option>
                                    <option value="喀麦隆">喀麦隆</option>
                                    <option value="科摩罗">科摩罗</option>
                                    <option value="肯尼亚">肯尼亚</option>
                                    <option value="莱索托">莱索托</option>
                                    <option value="尼日尔">尼日尔</option>
                                    <option value="突尼斯">突尼斯</option>
                                    <option value="塞舌尔">塞舌尔</option>
                                    <option value="赞比亚">赞比亚</option>
                                    <option value="马拉维">马拉维</option>
                                    <option value="乌干达">乌干达</option>
                                    <option value="索马里">索马里</option>
                                    <option value="摩洛哥">摩洛哥</option>
                                    <option value="博茨瓦纳">博茨瓦纳</option>
                                    <option value="利比里亚">利比里亚</option>
                                    <option value="阿尔及利亚">阿尔及利亚</option>
                                    <option value="科特迪瓦">科特迪瓦</option>
                                    <option value="毛里求斯">毛里求斯</option>
                                    <option value="民主刚果">民主刚果</option>
                                    <option value="纳米比亚">纳米比亚</option>
                                    <option value="尼日利亚">尼日利亚</option>
                                    <option value="塞拉利昂">塞拉利昂</option>
                                    <option value="南非">南非</option>
                                    <option value="塞内加尔">塞内加尔</option>
                                    <option value="莫桑比克">莫桑比克</option>
                                    <option value="津巴布韦">津巴布韦</option>
                                    <option value="西撒哈拉">西撒哈拉</option>
                                    <option value="斯威士兰">斯威士兰</option>
                                    <option value="厄立特里亚">厄立特里亚</option>
                                    <option value="坦桑尼亚">坦桑尼亚</option>
                                    <option value="赤道几内亚">赤道几内亚</option>
                                    <option value="布基纳法索">布基纳法索</option>
                                    <option value="几内亚比绍">几内亚比绍</option>
                                    <option value="圣多美和普林西比">圣多美和普林西比</option>
                                    <option value="埃塞俄比亚">埃塞俄比亚</option>
                                    <option value="马达加斯加">马达加斯加</option>
                                    <option value="毛里塔尼亚">毛里塔尼亚</option>
                                    <option value="冰岛">冰岛</option>
                                    <option value="波黑">波黑</option>
                                    <option value="丹麦">丹麦</option>
                                    <option value="德国">德国</option>
                                    <option value="波兰">波兰</option>
                                    <option value="法国">法国</option>
                                    <option value="芬兰">芬兰</option>
                                    <option value="捷克">捷克</option>
                                    <option value="荷兰">荷兰</option>
                                    <option value="瑞士">瑞士</option>
                                    <option value="挪威">挪威</option>
                                    <option value="英国">英国</option>
                                    <option value="希腊">希腊</option>
                                    <option value="瑞典">瑞典</option>
                                    <option value="俄罗斯">俄罗斯</option>
                                    <option value="爱尔兰">爱尔兰</option>
                                    <option value="安道尔">安道尔</option>
                                    <option value="奥地利">奥地利</option>
                                    <option value="卢森堡">卢森堡</option>
                                    <option value="比利时">比利时</option>
                                    <option value="梵蒂冈">梵蒂冈</option>
                                    <option value="马耳他">马耳他</option>
                                    <option value="摩纳哥">摩纳哥</option>
                                    <option value="西班牙">西班牙</option>
                                    <option value="乌克兰">乌克兰</option>
                                    <option value="葡萄牙">葡萄牙</option>
                                    <option value="立陶宛">立陶宛</option>
                                    <option value="意大利">意大利</option>
                                    <option value="匈牙利">匈牙利</option>
                                    <option value="白俄罗斯">白俄罗斯</option>
                                    <option value="所罗门群岛">所罗门群岛</option>
                                    <option value="南斯拉夫">南斯拉夫</option>
                                    <option value="克罗地亚">克罗地亚</option>
                                    <option value="拉脱维亚">拉脱维亚</option>
                                    <option value="爱沙尼亚">爱沙尼亚</option>
                                    <option value="保加利亚">保加利亚</option>
                                    <option value="罗马尼亚">罗马尼亚</option>
                                    <option value="摩尔多瓦">摩尔多瓦</option>
                                    <option value="斯洛伐克">斯洛伐克</option>
                                    <option value="斯洛文尼亚">斯洛文尼亚</option>
                                    <option value="阿尔巴尼亚">阿尔巴尼亚</option>
                                    <option value="列支敦士登">列支敦士登</option>
                                    <option value="智利">智利</option>
                                    <option value="古巴">古巴</option>
                                    <option value="美国">美国</option>
                                    <option value="海地">海地</option>
                                    <option value="巴西">巴西</option>
                                    <option value="圭亚那">圭亚那</option>
                                    <option value="委内瑞拉">委内瑞拉</option>
                                    <option value="安提瓜和巴布达">安提瓜和巴布达</option>
                                    <option value="阿根廷">阿根廷</option>
                                    <option value="伯利兹">伯利兹</option>
                                    <option value="巴哈马">巴哈马</option>
                                    <option value="巴拿马">巴拿马</option>
                                    <option value="巴拉圭">巴拉圭</option>
                                    <option value="墨西哥">墨西哥</option>
                                    <option value="苏里南">苏里南</option>
                                    <option value="加拿大">加拿大</option>
                                    <option value="乌拉圭">乌拉圭</option>
                                    <option value="厄瓜多尔">厄瓜多尔</option>
                                    <option value="格林纳达">格林纳达</option>
                                    <option value="洪都拉斯">洪都拉斯</option>
                                    <option value="多米尼加">多米尼加</option>
                                    <option value="玻利维亚">玻利维亚</option>
                                    <option value="秘鲁">秘鲁</option>
                                    <option value="牙买加">牙买加</option>
                                    <option value="危地马拉">危地马拉</option>
                                    <option value="圣卢西亚">圣卢西亚</option>
                                    <option value="多米尼克">多米尼克</option>
                                    <option value="哥斯达黎加">哥斯达黎加</option>
                                    <option value="圣基茨和尼维斯">圣基茨和尼维斯</option>
                                    <option value="尼加拉瓜">尼加拉瓜</option>
                                    <option value="哥伦比亚">哥伦比亚</option>
                                    <option value="特立尼达和多巴哥">特立尼达和多巴哥</option>
                                    <option value="圣文森特和格林纳丁斯">圣文森特和格林纳丁斯</option>
                                    <option value="巴巴多斯">巴巴多斯</option>
                                    <option value="瑙鲁">瑙鲁</option>
                                    <option value="纽埃">纽埃</option>
                                    <option value="巴新">巴新</option>
                                    <option value="斐济">斐济</option>
                                    <option value="汤加">汤加</option>
                                    <option value="帕劳">帕劳</option>
                                    <option value="萨摩亚">萨摩亚</option>
                                    <option value="新西兰">新西兰</option>
                                    <option value="瓦努阿图">瓦努阿图</option>
                                    <option value="图瓦卢">图瓦卢</option>
                                    <option value="澳大利亚">澳大利亚</option>
                                    <option value="基里巴斯">基里巴斯</option>
                                    <option value="库克群岛">库克群岛</option>
                                    <option value="马绍尔群岛">马绍尔群岛</option>
                                    <option value="密克罗尼西亚">密克罗尼西亚</option>
                                </select>
                            </td>
                            <td align="right">归属地:</td>
                            <td colspan="4" align="center">
                                <select name="gsd" id="gsd" style="width: 80%; height: 30px; line-height: 30px; border: 1px solid #ddd; outline: none; padding: 0 10px; color: #333;">
                                    <option value="--请选择--">--请选择--</option>
                                    <option value="其他">其他</option>
                                    <option value="北京">北京</option>
                                    <option value="上海">上海</option>
                                    <option value="广州">广州</option>
                                    <option value="天津市">天津市</option>
                                    <option value="重庆市">重庆市</option>
                                    <option value="广西壮族自治区">广西壮族自治区</option>
                                    <option value="内蒙古自治区">内蒙古自治区</option>
                                    <option value="西藏自治区">西藏自治区</option>
                                    <option value="宁夏回族自治区">宁夏回族自治区</option>
                                    <option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
                                    <option value="辽宁省">辽宁省</option>
                                    <option value="吉林省" selected="">吉林省</option>
                                    <option value="黑龙江省">黑龙江省</option>
                                    <option value="河北省">河北省</option>
                                    <option value="山西省">山西省</option>
                                    <option value="江苏省">江苏省</option>
                                    <option value="浙江省">浙江省</option>
                                    <option value="安徽省">安徽省</option>
                                    <option value="福建省">福建省</option>
                                    <option value="江西省">江西省</option>
                                    <option value="山东省">山东省</option>
                                    <option value="河南省">河南省</option>
                                    <option value="湖北省">湖北省</option>
                                    <option value="湖南省">湖南省</option>
                                    <option value="广东省">广东省</option>
                                    <option value="海南省">海南省</option>
                                    <option value="四川省">四川省</option>
                                    <option value="贵州省">贵州省</option>
                                    <option value="云南省">云南省</option>
                                    <option value="陕西省">陕西省</option>
                                    <option value="甘肃省">甘肃省</option>
                                    <option value="青海省">青海省</option>
                                    <option value="台湾省">台湾省</option>
                                    <option value="香港">香港</option>
                                    <option value="澳门">澳门</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <div style="text-align: center; margin: 30px 0;">
                    <button class="btn-bg move Upper" onclick="javascript:saveMessage()">保存</button>
                    <button class="btn-bg move Upper resetPassword">重置密码</button>
                </div>
            </div>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" runat="server" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog" style="width: 40%; margin-top: 100px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- 右侧 退出 按钮-->
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;</button>
                            <h4 class="modal-title" id="myModalLabel">填写申请作废的原因
                            </h4>
                        </div>
                        <div id="divDepart" class="modal-body" runat="server">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="tit" style="height: 50px;">作废原因<span class="star">*</span></td>
                                    <td>
                                        <input type="text" class="reg_sign" runat="server" style="height: 100px;" id="InvalidReason" name="backReason" />
                                    </td>
                                </tr>
                            </table>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                    关闭
                                </button>
                                <button type="button" class="btn btn-primary" runat="server" id="savebutton" onserverclick="GetReason_Invalid">
                                    提交
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal -->
                </div>
            </div>
            <script src="../js/jquery.min.js"></script>
            <script src="../js/bootstrap.min.js"></script>
            <script type="text/javascript">
                function show_modal() {
                    //alert(1);
                    $('#myModal').modal("show");

                    //禁用enter键
                    $(document).keydown(function (event) {
                        if (event.keyCode == 13) {
                            $('form').each(function () {
                                event.preventDefault();
                            });
                        }
                    });
                }
            </script>
        </div>
    </form>
</body>
</html>
