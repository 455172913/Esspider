(function($, undefined){
    var Validator = function(element, options){
        var that = this, 
            opts = options;

        for(var p in opts) {
            that[p] = opts[p]; 
        } 

        $(element).off();
        $(element).click(function(){
            if(that.__validation()){
                if(that.success) that.success.call(that, element);
            }else{
                if(that.failed) that.failed.call(that, element);
            }
        });
    };

    Validator.prototype = {
        constructor: Validator,
        __validation: function(){
            var that = this;

            if(!that.items) return true;

            var len = that.items.length;

            for(var i = 0;i < len;i++){
                var item = $(that.items[i]),
                    reg = item.attr('data-rule'),
                    info = item.attr('data-toast'),
                    val = item.val(),
                    reg = new RegExp(reg);

                if(!reg.test(val)){
                    $(that.plugins.toast).toast({
                        type: 'danger',
                        info: info
                    });

                    item.parent().parent().addClass('has-error');

                    item.get(0).focus();

                    item.one('input', function(){
                        item.parent().parent().removeClass('has-error');
                    });

                    return false;
                }
            }

            return true;
        }
    };

    var ValidatorPlugin = function(options){
        return new Validator(this, options);
    };

    $.fn.validator = ValidatorPlugin;
})(window.jQuery);
