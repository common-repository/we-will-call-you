<?php
/*
Plugin Name: We Will Call You
Plugin URI: https://github.com/teenvio/we-will-call-you
Description: Simple WordPress plugin to create a bottom bar with a simple form to indicate the contact data to call: name, email and telephone. Synchronized with Teenvio.com
Version: 1.0
Author: Víctor J. Chamorro - Teenvio.com
Author URI: http://teenvio.com
License: GPL2
*/
defined( 'ABSPATH' ) or die( 'No script kiddies please!' );

function wewillcallyou_add_scripts(){
	wp_register_script( 'wewillcallyou', plugins_url( '/we-will-call-you.js', __FILE__ ), array( 'jquery' ) );	
	wp_enqueue_script( 'wewillcallyou' );
	//For ajax in the fronted
	wp_localize_script( 'wewillcallyou', 'wewillcallyouAjax', array( 'ajaxurl' => admin_url( 'admin-ajax.php')));
}

function wewillcallyou_addhtml(){
	echo "\n<!-- HTML WeWillCallYou -->\n";
	$tpl = file_get_contents(plugins_url( 'tpl/bottom_bar.tpl', __FILE__ ));
	$tpl = str_replace('__#name#__', __('name','wewillcallyou'),$tpl);
	$tpl = str_replace('__#email#__', __('email','wewillcallyou'),$tpl);
	$tpl = str_replace('__#phone#__', __('phone','wewillcallyou'),$tpl);
	$tpl = str_replace('__#send#__', __('send','wewillcallyou'),$tpl);
	$tpl = str_replace('__#title_text#__', wewillcallyou_get_option('title'),$tpl);
	$tpl = str_replace('__#conditions_url#__', wewillcallyou_get_option('conditions_url'),$tpl);
	$tpl = str_replace('__#conditions#__', __('conditions','wewillcallyou'),$tpl);
	$tpl = str_replace('__#acept#__', __('acept the','wewillcallyou'),$tpl);
	$tpl = str_replace('__#send_thanks#__', __('send_thanks','wewillcallyou'),$tpl);
	
	echo $tpl;
	
	echo "\n<!-- / HTML WeWillCallYou -->\n";
}

function wewillcallyou_init(){	
	load_plugin_textdomain( 'wewillcallyou', false, dirname( plugin_basename( __FILE__ ) ) . '/i18n' );
}

function wewillcallyou_admin_init(){
	add_options_page("We'll Call You", "We'll Call You", "read", 'wewillcallyou','wewillcallyou_admin_page');
}

function wewillcallyou_admin_page(){
	
	$post=$_POST;
	if (isset($post['form-action']) && $post['form-action']=='save'){
		wewillcallyou_admin_page_save($post);
	}
	
	$tpl = file_get_contents(plugins_url( 'tpl/admin.tpl', __FILE__ ));
	$tpl = str_replace('__#save#__', __('save','wewillcallyou'),$tpl);
	$tpl = str_replace('__#title#__', __('title','wewillcallyou'),$tpl);
	$tpl = str_replace('__#action#__', __('action','wewillcallyou'),$tpl);
	$tpl = str_replace('__#send-email#__', __('send email','wewillcallyou'),$tpl);
	$tpl = str_replace('__#save-app#__', __('save into external app','wewillcallyou'),$tpl);
	$tpl = str_replace('__#send-email-save-app#__', __('send email and save into external app','wewillcallyou'),$tpl);
	$tpl = str_replace('__#conditions_url#__', __('conditions_url','wewillcallyou'),$tpl);
	$tpl = str_replace('__#email_alert#__', __('email_alert','wewillcallyou'),$tpl);
	$tpl = str_replace('__#teenvio_user#__', __('teenvio_user','wewillcallyou'),$tpl);
	$tpl = str_replace('__#teenvio_acount#__', __('teenvio_acount','wewillcallyou'),$tpl);
	$tpl = str_replace('__#teenvio_pass#__', __('teenvio_pass','wewillcallyou'),$tpl);
	$tpl = str_replace('__#exclude_path#__', __('exclude_path','wewillcallyou'),$tpl);
	
	
	$tpl = str_replace('{value_title}', wewillcallyou_get_option('title'),$tpl);
	$tpl = str_replace('{value_conditions_url}', wewillcallyou_get_option('conditions_url'),$tpl);
	$tpl = str_replace('{value_exclude_path}', wewillcallyou_get_option('exclude_path'),$tpl);
	$tpl = str_replace('{value_action}', wewillcallyou_get_option('action'),$tpl);
	$tpl = str_replace('{value_email}', wewillcallyou_get_option('email'),$tpl);
	$tpl = str_replace('{value_teenvio_user}', wewillcallyou_get_option('teenvio_user'),$tpl);
	$tpl = str_replace('{value_teenvio_plan}', wewillcallyou_get_option('teenvio_plan'),$tpl);
	$tpl = str_replace('{value_teenvio_pass}', base64_decode(wewillcallyou_get_option('teenvio_pass')),$tpl);
	
	echo $tpl;
}

function wewillcallyou_admin_page_save($data){
	foreach($data as $key=>$value){
		switch($key){
			case 'form-action':
			case 'submit':
				break;
			case 'teenvio_pass':
				wewillcallyou_save_option($key, base64_encode($value));
				break;
			default:
				wewillcallyou_save_option($key, $value);
		}
	}
	
}

function wewillcallyou_save_option($key,$data){
	$data=esc_attr($data);
	$savedata = get_option('wewillcallyou');
	if (!is_array($savedata)){
		$savedata=array($key=>$data);
		add_option('wewillcallyou',$savedata);	
	}else{
		$savedata[$key]=$data;
		update_option('wewillcallyou',$savedata);
	}
}

function wewillcallyou_get_option($key){
	$data = get_option('wewillcallyou');
	if (is_array($data) && isset($data[$key])){
		return stripslashes($data[$key]);
	}else{
		return null;
	}
}

function wewillcallyou_ajax_save(){
	
	$email=  wewillcallyou_get_option('email');
	
	$adata=array();
	$adata['post']=$_POST;
	
	$adata['to']=$email;
	$adata['ip']=$_SERVER['REMOTE_ADDR'];
	$adata['lang']=$_SERVER['HTTP_ACCEPT_LANGUAGE'];
	
	$teenvio_user= wewillcallyou_get_option('teenvio_user');
	if (!empty($teenvio_user)){
		
		require_once 'lib/APIClientPOST.php';
		
		$teenvio_acount=wewillcallyou_get_option('teenvio_plan');
		$teenvio_pass=base64_decode(wewillcallyou_get_option('teenvio_pass'));
	
		try{
			$api=new Teenvio\APIClientPOST($teenvio_user,$teenvio_acount,$teenvio_pass);
			if ($api->ping()){
				
				$id_contact=$api->saveContact(array(
				    #email
				    'email'=>$adata['post']['email'],
				    #name
				    'nombre'=>$adata['post']['name'],
				    #phone
				    'telperso'=>$adata['post']['phone'],
				    #notes
				    'observaciones'=>'WeWillCallYou:'.$adata['ip'].'-'.$adata['lang']
				));
				$adata['api_response']=$id_contact;
				
			}else{
				$adata['api_response']='ERROR: Teenvio login fail '.$teenvio_user.'.'.$teenvio_acount;
			}
		}catch(Teenvio\TeenvioException $e){
			$adata['api_response']='ERROR: '.$e->getMessage();
		}
	}else{
		$adata['api_response']='DISABLED';
	}
	$response=wp_mail($email,'WeWillCallYou Notification',print_r($adata,true));
	$adata['response']=$response;
	var_dump($adata);
	wp_die();
	
}

function wewillcallyou_is_exclude(){
	
	$exclude_path = (string) wewillcallyou_get_option('exclude_path');
	if ($exclude_path=='') return false;
	
	$current=$_SERVER['REQUEST_URI'];
	$paths=  explode(',', $exclude_path);
	
	foreach($paths as $path){
		if (strpos($current, $path)!==false){
			return true;
		}
	}
}



//Front
if (wewillcallyou_is_exclude()==false){
	add_action('plugins_loaded','wewillcallyou_init');
	add_action('wp_enqueue_scripts', 'wewillcallyou_add_scripts' );
	add_action('wp_footer', 'wewillcallyou_addhtml');
}
//Admin
add_action('admin_menu','wewillcallyou_admin_init');
//Front ajax
add_action('wp_ajax_wewillcallyou_ajax_save', 'wewillcallyou_ajax_save' );
add_action('wp_ajax_nopriv_wewillcallyou_ajax_save', 'wewillcallyou_ajax_save' );
?>