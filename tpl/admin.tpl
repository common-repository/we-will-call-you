<div class="wrap">
	<h1>We'll Call You Options</h1>
	
	<form novalidate='novalidate' method='post'>
                <input type="hidden" name="form-action" value="save">
		<table class="form-table">
			<tr>
				<th scope="row">
					<label for='title'>__#title#__</label>
				</th>
				<td>
                                        <input id="title" class="regular-text" type="text" value="{value_title}" name="title">
				</td>
			</tr>
                        <tr>
				<th scope="row">
					<label for='title'>__#conditions_url#__</label>
				</th>
				<td>
                                        <input id="title" class="regular-text" type="text" value="{value_conditions_url}" name="conditions_url">
				</td>
			</tr>
                        <tr>
				<th scope="row">
					<label for='title'>__#exclude_path#__</label>
				</th>
				<td>
                                        <input id="title" class="regular-text" type="text" value="{value_exclude_path}" name="exclude_path">
				</td>
			</tr>
			<!-- <tr>
				<th scope="row">
					<label for='title'>__#action#__</label>
				</th>
				<td>
					<select id="default_role" name="action">
						<option value="send-email">__#send-email#__</option>
						<option value="save-app">__#save-app#__</option>
						<option value="send-email-save-app">__#send-email-save-app#__</option>
					</select>
				</td>
			</tr>-->
                        <tr>
				<th scope="row">
					<label for='title'>__#email_alert#__</label>
				</th>
				<td>
                                        <input id="title" class="regular-text" type="text" value="{value_email}" name="email">
				</td>
			</tr>
                        
                        <tr>
				<th scope="row">
					<label for='title'>__#teenvio_user#__</label>
				</th>
				<td>
                                        <input id="title" class="regular-text" type="text" value="{value_teenvio_user}" name="teenvio_user">
				</td>
			</tr>
                        <tr>
				<th scope="row">
					<label for='title'>__#teenvio_acount#__</label>
				</th>
				<td>
                                        <input id="title" class="regular-text" type="text" value="{value_teenvio_plan}" name="teenvio_plan">
				</td>
			</tr>
                        <tr>
				<th scope="row">
					<label for='title'>__#teenvio_pass#__</label>
				</th>
				<td>
                                        <input id="title" class="regular-text" type="password" value="{value_teenvio_pass}" name="teenvio_pass">
				</td>
			</tr>
                        
		</table>
	
                <p class="submit">
                        <input type="submit" value="__#save#__" class="button button-primary" id="submit" name="submit">
                </p>
        </form>
</div>
<script type="text/javascript">
        if (jQuery){
                jQuery(document).ready(function(){
                        jQuery('select[name=action]').val('{value_action}');
                });
        }
</script>