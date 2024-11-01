<style type="text/css">
	div#wewillcallyou-bottombar{
		font-family: "Helvetica Neue","Liberation Sans",Helvetica,Arial,sans-serif;
                font-size:12px;
		background-color: #fff;
		border: 1px solid #ccc;
		border-radius: 4px 4px 0 0;
		bottom: -260px;
		height: 300px;
		padding: 5px;
		position: fixed;
		right: 0;
		width: 300px;
		transition: all 0.3s ease-out 0s;
                z-index:999;
	}
        
        div#wewillcallyou-bottombar span.show-button{cursor:pointer;font-weight:bold;}
        
        div#wewillcallyou-bottombar div.wewillcallyou-top{
                height: 32px;
                font-size: 19px;
                margin-bottom: 10px;
                padding: 7px;
        }
        
        div#wewillcallyou-bottombar div.send-ok{
                display:none;
                text-align: center;
                margin-top: 26px;
        }
        div#wewillcallyou-bottombar input[type=text]{
                background-color:#f7f7f7;
                border:1px solid #ccc;
                margin-bottom: 2px;
                color:#333;
        }
        div#wewillcallyou-bottombar input[type=button]{
                background:#333;
                color:#fff;
        }
        div#wewillcallyou-bottombar input[type=checkbox]{
                margin:0;
                padding:0;
        }
	div#wewillcallyou-bottombar input[type=text],div#wewillcallyou-bottombar input[type=button]{
		display:inline-block;
		width:100%;
                line-height: 26px;
                padding:8px;
                font-size: 19px;
	}
        div#wewillcallyou-bottombar .error{
                border:2px solid red !important;
        }
</style>
<div id="wewillcallyou-bottombar">
        <div class="wewillcallyou-top">
                <span>__#title_text#__</span>
                <span class='show-button'>^</span>
        </div>
        <form action="#" onsubmit="return false;">
                <input type="hidden" name="action" value="wewillcallyou_ajax_save">
                <input type="text" name="name" placeholder="__#name#__" title="__#name#__"><br>
                <input type="text" name="email" placeholder="__#email#__" class="email" title="__#email#__"><br>
                <input type="text" name="phone" placeholder="__#phone#__" title="__#phone#__"><br>
                <div>
                        <input type="checkbox" name="acept" value="1"> __#acept#__ <a target="_blank" href="__#conditions_url#__">__#conditions#__</a>
                </div>
                <input type="button" name="send" value="__#send#__">
        </form>
        <div class="send-ok">__#send_thanks#__</div>
</div>