<style type="text/css">
div#wewillcallyou-bottombar{
font-family: "Helvetica Neue","Liberation Sans",Helvetica,Arial,sans-serif;
font-size:12px;background-color: #fff;border: 1px solid #ccc;border-radius: 4px 4px 0 0;bottom: -290px;height: 330px;padding: 5px;position: fixed;
right:0;width:310px;transition:all 0.3s ease-out 0s;z-index:999;text-align: center;
}
div#wewillcallyou-bottombar span.show-button{           cursor:pointer;font-weight:bold;}
div#wewillcallyou-bottombar div.wewillcallyou-top{      height:32px;font-size:18px;margin-bottom:20px;padding:7px;}
div#wewillcallyou-bottombar div.wewillcallyou-top i.call{
background-image:url(data:image/gif;base64,R0lGODdhHwAfAMZAADh1mTp2mj14m0F7nUF7nkJ8nkN9n0R9n0iAoUmBokqBok+FpVCGpVSIp1WJqGGSrmKSr2SUsGeVsWiWsWiXsm2atHKdt3qiu4GnvoKov4SqwIitwo2wxY+xxZGzx5O0yJW1yZq5y6G9z6O/0KbB0afC0qzG1a3G1bLJ17rP3MHU38XX4cfY4sna48vb5Mvb5dLg6NPg6Nfj69nk69zn7ebu8ujv8/D19/L2+fP3+fT3+fX4+vn7/P39/v3+/v7+/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////ywAAAAAHwAfAAAH/oBAgoOEhYaHiIQ8MyAPCAACCBQfL4mJPCUKAJucnQsiPJaEKQydpqYOKKJAH6eunQIhlhevtZwViBy2uwAfhiqnCBIBvJsCK4qanSM+QB3Fmws4gyGmFoM3B9AAIoPKnC6EJNsIgi+nO4Q9DdsxQLqmOYQ02tC+EKcsgy310BBABU5lGMRuG4ByAk4N0CHIhEFIQBKeGiHoR4SHQB6dOmBDUI0E5IDgczWhhyAZIDkdKHiKApANtTQMqnERwAEaPUj049QByLlaHgb5MNGgBbYOxDhV4mHAlgaTiSRwUjCoxK4JHQ/50MhtEI9vrw6MYFhoxNRQg1IUG5CBRY4dNi4sdFJhqNrDTr4M8aB1FwCGS3YN5rVEChoDZKuA8DgB9tSCE2gTC+LxogMFBAIEEHjwAYaoQAA7);                
background-position:0 -1px;display:inline-block;float:left;height:30px;width:30px;
/*background-color: #387599;border-radius: 18px;font-size: 22px;color: #ffffff;*/
}
div#wewillcallyou-bottombar div.send-ok{		display:none;color:#387599;font-size:20px;margin-top:26px;padding:10px;text-align:center;}
div#wewillcallyou-bottombar input[type=text]{   	background-color:#f7f7f7;border:1px solid #ccc;margin-bottom:2px;color:#333;}
div#wewillcallyou-bottombar input[type=button]{ 	background:#387599 none repeat scroll 0 0;color:#fff;margin-top:12px;}
div#wewillcallyou-bottombar input[type=checkbox]{       margin:0;padding:0;}
div#wewillcallyou-bottombar input[type=text],div#wewillcallyou-bottombar input[type=button]{ border-radius:5px;display:inline-block;font-size:16px;line-height:20px;margin-bottom:10px;padding:10px;width:90%;}
div#wewillcallyou-bottombar .acept{                     display: inline-block;font-size:16px;line-height:20px;color:#999999;padding:10px;width:90%;line-height:14px;}
div#wewillcallyou-bottombar .acept a{   		color:#999999;text-decoration:underline;}
div#wewillcallyou-bottombar .error{                     border:2px solid red !important;}
</style>
<div id="wewillcallyou-bottombar">
<div class="wewillcallyou-top">
<!-- icon-phone -->
<i class="call"></i>
<span>__#title_text#__</span>
<span class='show-button'>^</span>
</div>
<form action="#" onsubmit="return false;">
<input type="hidden" name="action" value="wewillcallyou_ajax_save">
<input type="text" name="name" placeholder="__#name#__" title="__#name#__"><br>
<input type="text" name="email" placeholder="__#email#__" class="email" title="__#email#__"><br>
<input type="text" name="phone" placeholder="__#phone#__" title="__#phone#__"><br>
<div class="acept"><input type="checkbox" name="acept" value="1"> __#acept#__ <a target="_blank" href="__#conditions_url#__">__#conditions#__</a></div>
<input type="button" name="send" value="__#send#__">
</form><div class="send-ok">__#send_thanks#__</div>
</div>