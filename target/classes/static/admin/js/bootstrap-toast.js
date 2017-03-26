(function($, undefined){
    var Toast = function(element, options){
        var that = this, 
            opts = options;

        for(var p in opts) {
            that[p] = opts[p]; 
        }

        that.__toast(element);
    };

    Toast.prototype = {
        constructor: Toast,
        __toast: function(element){
            var that = this,
                cls = 'alert-' + that.type;

            $(element).find('p').text(that.info);

            $(element).addClass(cls).addClass('toast-animation');
            setTimeout(function(){
                $(element).removeClass(cls).removeClass('toast-animation');
                $(element).find('p').text('');
            }, 5000);
        }
    };

    var ToastPlugin = function(options){
        return new Toast(this, options)
    };

    $.fn.toast = ToastPlugin;
})(window.jQuery);
