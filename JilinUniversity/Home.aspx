<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="JilinUniversity.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>主页</title>
    <link href="css/home.css" rel="stylesheet" />
    <link href="css/easyui.css" rel="stylesheet" />
    <link href="css/jquery-accordion-menu.css" rel="stylesheet" />
     <link href="../css/searchStyle.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/html5shiv.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script src="js/jquery-accordion-menu.js"></script>
    <script src="../js/tablebase.js"></script>
    <script src="../js/xcConfirm.js"></script>
    <script src="../js/alert.js"></script>
    <script src="../js/cookie.js"></script>
    <script src="../js/showHide.js"></script>
    <script>
        function addTab(title, url) {
            if ($('#tt').tabs('exists', title)) {
                $('#tt').tabs('select', title);
            } else {
                var height = $(document).height();
                var content_height = height;
                var lala = content_height - 40;
                var styles = "width:100%;height:" + lala + "px";
                var content = '<iframe scrolling="yes" frameborder="0"  src="' + url + '" style="' + styles + '"></iframe>';
                $('#tt').tabs('add', {
                    title: title,
                    content: content,
                    closable: true
                });
            }
        }
        function tabsClose() {
            var tab = $('#tt').tabs('getSelected');//获取当前选中tabs  
            var index = $('#tt').tabs('getTabIndex', tab);//获取当前选中tabs的index  
            $('#tt').tabs('close', index);//关闭对应index的tabs  
        }
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
    <style type="text/css">
        .auto-style1 {
            left: 0;
            top: 41px;
            bottom: -20px;
        }

        .auto-style2 {
            position: absolute;
            left: 202px; /*top: 35px;*/
            top: 40px;
            right: 0;
            bottom: 0;
            overflow: hidden;
            min-width: 1100px;
            width: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logo3" style="background-color: #3383b4;">
          <div style="margin: 1px auto; width: 300px; color: aqua">
                <%--<img src="image/background" style="width: 400px;position:center" />--%>
            </div>
            <ul class="title-select" style="margin-left:88%;margin-top:-0.4%;" >
                        <li class="title-navs">
                            <input type="text" id="ktStateSort" name="ktStateSort" style="visibility: hidden; display: none" value="0">
                            <a class="title-link" style="color:white;border:0px;background-color:#3383b4;">mengtong
                                
                            </a>
                            <ul class="title-option" style="display: none; z-index:9999">
                                <li><a href="#" onclick="javascript:queryState('1');" >用户信息</a></li>
                                <li><a href="#" onclick="javascript:queryState('2');"">修改密码</a></li>
                            </ul>
                        </li>
                    </ul>
            <a href="Login.aspx" class="rightup" style="color:#FFFFFF;">注销</a>
        </div>
        <div>
            <aside id="box_left">
               <!-- <div class="picture">
                    <img src="image/background.jpg" style="width: 80%; height: 80%; margin-left: 10%;" />
                    <div class="username" style="text-align: center">
                        <h5>用户名：<b><asp:Label runat="server" ID="Label_userName" Text=""></asp:Label></b></h5>
                    </div>
                </div>-->
                <div>
                    <div id="jquery-accordion-menu" class="jquery-accordion-menu red">
                        <ul id="demo_list" runat="server">
                        </ul>
                    </div>
                </div>
            </aside>
            <section class="auto-style2" id="box_right">
                <div class="con">
                    <div id="tt" class="easyui-tabs">
                        <div title="主页">
                        </div>
                    </div>
                    <div style="display: inline-block; float: left; width: 50%; height: inherit">
                        <div style="padding-top: 10px; padding-left: 30px; background-color: #f3f7f9; padding-right: 10px; padding-bottom: 10px; height: 50%;">
                            <div class="layout">
                                <div class="layout-title">
                                    <span>
                                        <img src="en/images/icon-todolist.png" height="30" width="30" alt=""></span>
                                    <h3>待办事宜</h3>
                                </div>
                                <div class="layout-con todo-list">
                                    <p class="text text-link">
                                        <a href="http://lssf.cas.cn:80/dzzEngProjectController.do?goAddProjectFourPage&amp;id=89fa13d1e6994ba69798811bfad78174">提交课题 2020-RSA-PT-00032</a>
                                    </p>
                                    <p class="text text-link">
                                        <a href="http://lssf.cas.cn:80/dzzEngProjectController.do?goAddProjectFourPage&amp;id=7ee01511e8994a3da8f63347f1e5735e">提交课题 2020-HIRFL-PT-000144</a>
                                    </p>
                                    <p class="text text-link">
                                        <a href="http://lssf.cas.cn:80/dzzEngProjectController.do?goAddProjectFourPage&amp;id=98daf44c40484ad38697bbcb6d6ee582">提交课题 2020-SSRF-PT-012861</a>
                                    </p>
                                    <p class="text text-link">
                                        <a href="http://lssf.cas.cn:80/dzzEngProjectController.do?goAddProjectFourPage&amp;id=1d804f6b46dc47798ad9721b6e5a5e1d">提交课题 2019-BEPC-PT-003548</a>
                                    </p>
                                    <p class="text text-link">
                                        <a href="http://lssf.cas.cn:80/dzzEngProjectController.do?goAddProjectFourPage&amp;id=ace18e100bff4402a622c09a8915a546">提交课题 2019-SG-Ⅱ-ZD-00011</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div style="padding-top: 10px; padding-left: 30px; background-color: #f3f7f9; padding-right: 10px; padding-bottom: 10px; height: 50%;">
                            <div class="layout">
					<div class="layout-title">
						<span><img src="en/images/icon-contact.png" height="30" width="30" alt=""></span>
							<h3>联系方式</h3>
					</div>
					<div class="layout-con con-list">
							<p class="text text-s">北京正负电子对撞机</p>
							<p class="text text-s"><span>何伟  hew@ihep.ac.cn	   010-88235027</span></p>
							<p class="text text-s">-----------------------------------------------------------------</p>						
					</div>
				</div>
                        </div>
                    </div>
                    <div style="display: inline-block; float: right; width: 50%; height: inherit;">
                        <div style="padding-top: 10px; padding-left: 30px; background-color: #f3f7f9; padding-right: 10px; padding-bottom: 10px; height: 50%;">
                            <div class="layout">
					<div class="layout-title">
						<span><img src="en/images/icon-links.png" height="30" width="30" alt=""></span>				
							<h3>常用链接</h3>
					</div>
					<div class="layout-con links-list">

						<p class="text text-link text-iblock">
							<a href="http://lssf.cas.cn:80/dzzEngProjectController.do?addproject">
									新增课题申请
							</a>
						</p>
						<p class="text text-link text-iblock">
							<a href="http://lssf.cas.cn:80/dzzEngProjectController.do?goproject">
									我的课题列表
							</a>
						</p>
						<p class="text text-link text-iblock">
							<a href="http://lssf.cas.cn:80/dzzEngSessionsController.do?addsessions">
									新增实验申请
							</a>
						</p>
						<p class="text text-link text-iblock">
							<a href="http://lssf.cas.cn:80/dzzEngSessionsController.do?gosessions">
									我的实验列表
							</a>
						</p>
						<p class="text text-link text-iblock">
							<a href="http://lssf.cas.cn:80/dzzEngResultController.do?goAddResult">
								新增成果申请
							</a>
						</p>
						<p class="text text-link text-iblock">
							<a href="http://lssf.cas.cn:80/dzzEngResultController.do?goResultList">
								我的成果列表
							
							</a>
						</p>
						<p class="text text-link text-iblock">
							<a href="http://lssf.cas.cn:80/dzzSsFileController.do?dzzSsFileUser" target="_blank">
								安全培训资料
							</a>
						</p>
						<p class="text text-link text-iblock">
							<a href="http://lssf.cas.cn:80/oaTestingTestController.do?oaTestingTest" target="_blank">
								参加安全考试
							</a>
						</p>
						<p class="text text-link text-iblock">
							<a href="http://lssf.cas.cn/wx/info/index.html" target="_blank">
								<font color="red">常见问题Q&amp;A</font>
							</a>
						</p>
						<p class="text text-link text-iblock">
							<a onclick="send_submit();" "="" target="_blank">
							仪器共享管理平台
							</a>
						</p>
				</div>	
				</div>
                        </div>
                        <div style="padding-top: 10px; padding-left: 30px; background-color: #f3f7f9; padding-right: 10px; padding-bottom: 10px; height: 50%;">
                            <div class="layout">
					<div class="layout-title">
						<span><img src="en/images/icon-introduction.png" height="30" width="30" alt=""></span>							
								<h3>通知公告</h3>					
					</div>
					<div class="layout-con platform-list"> 						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816e014a86016e01799999007f');">兰州重离子加速器（HIRFL）国家实验室2020年度束流申请通知</a>
							</p>						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816decb10e016ded98144b0bad');">兰州重离子加速器（HIRFL）国家实验室2020年度束流申请通知</a>
							</p>
						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816b788076016b791e693201f6');">散裂中子源普通课题征集</a>
							</p>
						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816b733f10016b73ad06df01bf');">北京同步辐射装置2019年用户学术年会 会议通知</a>
							</p>
						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816b45e2f9016b4930deb603b7');">【20190612】合肥光源2019年用户学术年会通知（第一轮）</a>
							</p>
						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816b25ced9016b2b9af05009eb');">【20190606】BSRF 2019年6-7月份专用光机时申请通知</a>
							</p>
						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816b070e44016b07ebe8030298');">【20190530】新版用户中心已集成培训资料和安全考试功能</a>
							</p>
						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816afdb0e7016b019dcb2f0686');">【提醒】关于用户密码带特殊字符无法登录的说明</a>
							</p>
						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816afdb0e7016b0170f8f305dd');">【提醒】旧版未提交课题需在新版重新录入</a>
							</p>
						
							<p class="text text-link">
								<a class="comment" onclick="javascript:findkfgg('ff8080816afbd008016afc3b34e10288');">【20190528】重大科技基础设施微信公众号推出公告</a>
							</p>
						
					</div>
				</div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
