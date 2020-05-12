// 二级菜单显示和隐藏
function showHide(btns, subnavs) {
    for (var i = 0; i < btns.length; i++) {
        btns[i].index = i;
        btns[i].onmouseover = function () {
            var osubnav = subnavs[this.index];
            osubnav.style.display = "inline-block";
        }
        btns[i].onmouseout = function () {
            var osubnav = subnavs[this.index];
            // var firstNav =  firstNavs[this.index];               
            osubnav.style.display = "none";
            // firstNav.style.backgroundColor = "transparent";
        }
    }
}
// 选项卡效果
function sltOption(btns, subnavs) {
    for (var i = 0; i < btns.length; i++) {
        btns[i].index = i;
        btns[i].onmouseover = function () {
            var h = this.getElementsByTagName("a")[0];
            var osubnav = subnavs[this.index];
            var lis = osubnav.getElementsByTagName("li");
            var len = osubnav.getElementsByTagName("li").length;
            osubnav.style.display = "inline-block";
            for (var j = 0; j < len; j++) {
                lis[j].index = j;
                lis[j].onclick = function () {
                    // console.log(this.innerText);
                    h.innerText = $.trim(this.innerText);
                    osubnav.style.display = "none";
                }
            }
        }
        btns[i].onmouseout = function () {
            var osubnav = subnavs[this.index];
            // var firstNav =  firstNavs[this.index];               
            osubnav.style.display = "none";
            // firstNav.style.backgroundColor = "transparent";
        }
    }
}
// 点击切换不同的图片
function Onclick(tds) {
    for (var j = 0; j < tds.length; j++) {
        tds[j].index = j;
        tds[j].onclick = function () {
            this.style.backgroundColor = '#004f79';
            var Img = this.getElementsByTagName('Img')[0]
            var ImgSrc = Img.src;
            var ImgName = ImgSrc.substring(ImgSrc.lastIndexOf("/") + 1);
            if (ImgName == 'sort.png') {
                Img.src = "images/sort-up.png";
            } else if (ImgName == 'sort-up.png') {
                Img.src = "images/sort-down.png";
            } else {
                Img.src = "images/sort-up.png";
            }
        }
    }
}
// 选项卡切换效果
function tab(tab, tab_list, tabCon, tabCon_list, ent) {
    var tab = $(tab);
    var tab_list = $(tab).children(tab_list);
    var tabCon = $(tabCon);
    var tabCon_list = $(tabCon).children(tabCon_list);
    var len = tab_list.length;
    var i = 0;
    for (i = 0; i < len; i++) {
        tab_list[i].index = i;
        tab_list[i][ent] = function () {
            for (i = 0; i < len; i++) {
                tab_list[i].className = '';
                tabCon_list[i].className = 'hide';
            }
            tab_list[this.index].className = 'act';
            tabCon_list[this.index].className = '';
        }
    }
}