define(["/disk/js/common/ajax-e10cba1b80.js"],function(a){function i(a){a.pageSize||(a=$.extend(c,a)),t=a,e(a.totalPage,a.currentPage,2),n(a)}function e(a,i,e,l){a=parseInt(a),i=parseInt(i),e=parseInt(e)||1;var n="",t=e+2,c=i-e,s=i+e;if(l=parseInt(l)>2*t-1?2*t-1:5,1==i?n+='<li class="disabled pagefirst"><a>首页</a></li>':i>1&&a>1&&(n+='<li><a class="pagefirst">首页</a></li>',n+='<li class="pageprev"><a>上一页</a></li>'),l>=a)for(var p=1;a>=p;p++)n+=p==i?'<li class="active pagenum"><a>'+p+"</a></li>":'<li class="pagenum"><a>'+p+"</a></li>";else if(t>=i){for(var p=1;s>=p;p++)n+=p==i?'<li class="active pagenum"><a>'+p+"</a></li>":'<li class="pagenum"><a>'+p+"</a></li>";a-1>=s&&(n+="<li><a>...</a></li>"),s!=a&&(n+=a==i?'<li class="active pagenum"><a>'+a+"</a></li>":'<li class="pagenum"><a>'+a+"</a></li>")}else if(i>a-t){1!=c&&(n+=1==i?'<li class="active pagenum"><a>1</a></li>':'<li class="pagenum"><a>1</a></li>'),c>=2&&(n+="<li><a>...</a></li>");for(var p=c;a>=p;p++)n+=p==i?'<li class="active pagenum"><a>'+p+"</a></li>":'<li class="pagenum"><a>'+p+"</a></li>"}else{n+='<li class="pagenum"><a>1</a></li>',n+="<li><a>...</a></li>";for(var p=c;s>=p;p++)n+=p==i?'<li class="active pagenum"><a>'+p+"</a></li>":'<li class="pagenum"><a>'+p+"</a></li>";n+="<li><a>...</a></li>",n+='<li class="pagenum"><a>'+a+"</a></li>"}i==a?n+='<li class="disabled"><a>尾页</a></li>':a>1&&a>i&&(n+='<li class="pagenext"><a>下一页</a></li>',n+='<li class="pagelast"><a>尾页</a></li>'),$(".pagination").html(n)}function l(i,l){var n={};for(var c in l)n[c]=l[c];n.pageNum=i,n.pageSize=t.pageSize,a({type:"get",url:t.url,data:n}).done(function(a){e(t.totalPage,i,2),t.cb&&t.cb(a)}).fail(function(a){t.error&&t.error(a)})}function n(a){$(document).off("click",".pagefirst").on("click",".pagefirst",function(){var i=parseInt($(this).parent().find(".active").find("a").text());1!=i&&l(1,a.param)}),$(document).off("click",".pagelast").on("click",".pagelast",function(){var i=parseInt($(this).parent().find(".active").find("a").text());i!=a.totalPage&&l(a.totalPage,a.param)}),$(document).off("click",".pagenext").on("click",".pagenext",function(){var i=parseInt($(this).parent().find(".active").find("a").text())+1;l(i,a.param)}),$(document).off("click",".pageprev").on("click",".pageprev",function(){var i=parseInt($(this).parent().find(".active").find("a").text())-1;l(i,a.param)}),$(document).off("click",".pagenum").on("click",".pagenum",function(){var i=parseInt($(this).find("a").text()),e=parseInt($(this).parent().find(".active").find("a").text());i!=e&&l(i,a.param)})}var t,c={pageSize:20};return{init:i}});