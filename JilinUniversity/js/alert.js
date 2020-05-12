//确定的弹出框
function send(txt) {
        window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
}
function sendAndRefresh(txt, refresh) {
    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error, {
        onOk: function () {
            window.location.href = document.URL;
        }
    });
}
function sendAndgoto(txt, go) {
    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error, {
        onOk: function () {
            window.location.href = history.go(go);history.go(0);
        }
    })
}
  //
function sendAndgotoPage(txt, page) {
    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error, {
        onOk: function () {
            window.location.href = page;
        }
    })
}

//带取消的弹出框
function cancel(txt,funcname)
{
    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.confirm, {
        onOk: function () {
            funcname();
        }
    }); 
}

//待取消的弹出框（有参数）
//第一个为需要弹出的提示
//第二个为函数的名字(不需要加单引号)
//第三个为函数的参数集合(需要加单引号)
function cancel(txt,funcname,para) {
    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.confirm, {
        onOk: function () {
            funcname(para);
        }
    });
}