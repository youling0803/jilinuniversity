/**
 * Created by Zhangyue on 2016/8/19.
 */
/*$(function () {
 var elm = $('#left');
 var startPos = $(elm).offset().top;
 $.event.add(window, "scroll", function () {
 var p = $(window).scrollTop();
 $(elm).css('position', ((p) > startPos) ? 'fixed' : 'static');
 $(elm).css('top', ((p) > startPos) ? '0px' : '');
 });
 });*/
; (function ($, window, document, undefined) {
    var pluginName = "jqueryAccordionMenu";
    var defaults = {
        speed: 300,
        showDelay: 0,
        hideDelay: 0,
        singleOpen: true,
        clickEffect: true
    };
    function Plugin(element, options) {
        this.element = element;
        this.settings = $.extend({},
            defaults, options);
        this._defaults = defaults;
        this._name = pluginName;
        this.init()
    };
    $.extend(Plugin.prototype, {
        init: function () {
            this.openSubmenu();
            this.submenuIndicators();
            if (defaults.clickEffect) {
                this.addClickEffect()
            }
        },
        openSubmenu: function () {
            $(this.element).children("ul").find("li").bind("click",
                function (e) {
                    e.stopPropagation();
                    e.preventDefault();
                    if ($(this).children(".submenu").length > 0) {
                        if ($(this).children(".submenu").css("display") == "none") {
                            $(this).children(".submenu").delay(defaults.showDelay).slideDown(defaults.speed);
                            $(this).children(".submenu").siblings("a").addClass("submenu-indicator-minus");
                            if (defaults.singleOpen) {
                                $(this).siblings().children(".submenu").slideUp(defaults.speed);
                                $(this).siblings().children(".submenu").siblings("a").removeClass("submenu-indicator-minus")
                            }
                            return false
                        } else {
                            $(this).children(".submenu").delay(defaults.hideDelay).slideUp(defaults.speed)
                        }
                        if ($(this).children(".submenu").siblings("a").hasClass("submenu-indicator-minus")) {
                            $(this).children(".submenu").siblings("a").removeClass("submenu-indicator-minus")
                        }
                    }
                })
        },
        submenuIndicators: function () {
            if ($(this.element).find(".submenu").length > 0) {
                $(this.element).find(".submenu").siblings("a").append("<span class='submenu-indicator'>+</span>")
            }
        },
        addClickEffect: function () {
            var ink, d, x, y;
            $(this.element).find("a").bind("click touchstart",
                function (e) {
                    $(".ink").remove();
                    if ($(this).children(".ink").length === 0) {
                        $(this).prepend("<span class='ink'></span>")
                    }
                    ink = $(this).find(".ink");
                    ink.removeClass("animate-ink");
                    if (!ink.height() && !ink.width()) {
                        d = Math.max($(this).outerWidth(), $(this).outerHeight());
                        ink.css({
                            height: d,
                            width: d
                        })
                    }
                    x = e.pageX - $(this).offset().left - ink.width() / 2;
                    y = e.pageY - $(this).offset().top - ink.height() / 2;
                    ink.css({
                        top: y + 'px',
                        left: x + 'px'
                    }).addClass("animate-ink")
                })
        }
    });

    $.fn[pluginName] = function (options) {
        this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName, new Plugin(this, options))
            }
        });
        return this
    }
})(jQuery, window, document);
jQuery(document).ready(function () {

    jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
});
/*$(function(){
 //顶部导航切换
 $("#demo-list li").click(function(){
 $("#demo-list li.active").removeClass("active");
 $(this).addClass("active");
 })
 })*/
$(function () {
    //顶部导航切换
    $("#demo_list li").click(function () {
        var a = $(this).parents().hasClass("submenu");
        var b = $(this).parents().parents().parents().hasClass("submenu");
        if (!a && !b) {
            $("#demo_list li.active").removeClass("active");
            $(this).addClass("active");
        }
        else if (a && !b) {
            $("#demo_list li ul li.active").removeClass("active");
            $(this).parents().addClass("active");
            $(this).addClass("active");
        }
        else if (a && b) {
            $("#demo_list li ul li ul li.active").removeClass("active");
            $(this).parents().parents().parents().addClass("active");
            $(this).parents().addClass("active");
            $(this).addClass("active");
        }
    })
})





