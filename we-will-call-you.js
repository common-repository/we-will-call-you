/**
 * JS We Will You Plugin
 * @autor Victor J. Chamorro <victor@ipdea.com>
 * @copyright Ipdea Land, S.L. / Teenivo.com
 */
/*
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

Copyright 2015 Ipdea Land, S.L. / Teenivo.com
*/
var weWillCallYou={
	
	timer:null,
	
	init:function(){
		weWillCallYou.log('WeWillCallYou load!');
		
		jQuery('div#wewillcallyou-bottombar').mouseenter(function(){
			weWillCallYou.show();
		});
		
		jQuery('div#wewillcallyou-bottombar .wewillcallyou-top span:eq(0)').click(function(){
			weWillCallYou.show();
		});
		
		jQuery('div#wewillcallyou-bottombar .show-button').click(function(){
			weWillCallYou.hide();
		});
		
		jQuery('div#wewillcallyou-bottombar input[name=send]').click(function(){
			weWillCallYou.save();
		});
		
		weWillCallYou.timer=window.setInterval(function(){
			weWillCallYou.log('WeWillCallYou timer call');
			weWillCallYou.show();
		},15*1000);
	},
	
	show:function(){
		jQuery('div#wewillcallyou-bottombar .show-button').html('x');
		jQuery('div#wewillcallyou-bottombar').css('bottom',0);
	},
	
	hide:function(){
		jQuery('div#wewillcallyou-bottombar .show-button').html('^');
		jQuery('div#wewillcallyou-bottombar').css('bottom','-290px');
		window.clearInterval(weWillCallYou.timer);
		weWillCallYou.log('WeWillCallYou timer canceled');
	},
	
	log:function(str){
		if (console && console.log){
			console.log(str);
		}
	},
	
	save:function(){
		var error=0;
		
		if(jQuery('div#wewillcallyou-bottombar form input[name=acept]')[0].checked==false){
			error=1;
			jQuery('div#wewillcallyou-bottombar form input[name=acept]').parent().addClass('error');
		}else{
			jQuery('div#wewillcallyou-bottombar form input[name=acept]').parent().removeClass('error');
		}
		
		jQuery('div#wewillcallyou-bottombar form input').each(function(){
			var objinput=jQuery(this);
			if (this.value==""){
				objinput.addClass('error');
				error=1;
			}else{
				
				if (objinput.hasClass('email') && this.value.trim().match(/^[\w-_.]{1,}@[\w-_.]{1,}(\.\w{2,})+$/)==null){
					objinput.addClass('error');
					error=1;
				}else{
					objinput.removeClass('error');
				}
			}
			
		});
		
		if (error==0){
			var form=jQuery('div#wewillcallyou-bottombar form');
			var data=form.serialize();
			weWillCallYou.log(data);

			jQuery.post(wewillcallyouAjax.ajaxurl, data, function(response) {
			
				form.hide();
				jQuery('div#wewillcallyou-bottombar div.send-ok').show();
				
			});

			
		}
	}
};

if (jQuery){
	jQuery(document).ready(function(){
		weWillCallYou.init();
	});
}