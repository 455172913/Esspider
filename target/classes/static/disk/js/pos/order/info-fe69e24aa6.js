define(["/disk/js/common/initEcomm-b09d432c2f.js"],function(t){function e(){t("finance_history"),n(),i(),a()}function a(){var t=$(".wrap");t.on("click",".search-btn",s).on("click",".download",r)}function i(){var t=$(".cur-shop").val();$(".choose-shop").attr("value",t)}function n(){m.datetimepicker({language:"zh-CN",format:"yyyy-mm-dd",weekStart:1,todayBtn:1,autoclose:1,todayHighlight:1,startView:2,minView:2,forceParse:0}).on("changeDate",function(t){o(m,$(".start-time-stamp")),d.datetimepicker("setStartDate",new Date($(".start-time-stamp").val()))}),d.datetimepicker({language:"zh-CN",format:"yyyy-mm-dd",weekStart:1,todayBtn:1,autoclose:1,todayHighlight:1,startView:2,minView:2,forceParse:0}).on("changeDate",function(t){o(d,$(".end-time-stamp")),m.datetimepicker("setEndDate",new Date($(".end-time-stamp").val()))});var t=new Date($(".default-start-date").val());m.datetimepicker("setDate",t);var e=new Date($(".default-end-date").val());d.datetimepicker("setDate",e),o(m,$(".start-time-stamp")),o(d,$(".end-time-stamp")),m.datetimepicker("setEndDate",new Date($(".end-time-stamp").val())),d.datetimepicker("setStartDate",new Date($(".start-time-stamp").val()))}function o(t,e){var a=t.val();e.val(a)}function s(){var t=$(".start-time-stamp").val(),e=$(".end-time-stamp").val(),a=$(".choose-shop").val();window.location.href="/payinfo/billList?shopId="+a+"&begin="+t+"&end="+e}function r(){var t=$(".start-time-stamp").val(),e=$(".end-time-stamp").val(),a=$(".choose-shop").val();window.location.href="/payinfo/exportBillList?shopId="+a+"&begin="+t+"&end="+e}var m=$("#start-date"),d=$("#end-date");return{init:e}});