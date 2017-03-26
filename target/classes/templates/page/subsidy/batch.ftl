<#assign pageConfig = {
    "title": "批量补贴"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/subsidy/batch.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>批量补贴</h1>

			<div class="search-order">

				<div class="alert">
					<p>Excel格式：设备id | 门店id | 门店名称 | 赔付类型 | 赔付子类型 | 赔付金额 | 备注 | 账号 | 户名 | 分行id | 公私 </p>
					<p class="warn">注：1.赔付类型为6， 账号 | 户名 | 分行id | 公私是必填的，其他情况可以空着，但是要有这几列。</p>
                    <p class="warn"> 2.赔付类型目前 </p>
				</div>
				<div class="form-horizontal order-search-box clearfix">
					<input type="text" class="file-name" placeHolder="文件名称" disabled>
					<input type="file" id="upload" class="hide">
				</div>

				<a href="javascript:;" class="search-btn">选择文件</a>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	    require(['/js/page/subsidy/batch.js'], function(page){
	        page.init();
	    });
	</script>
</@html>











