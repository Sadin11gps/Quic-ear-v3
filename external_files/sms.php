<?php

function send_sms($msg_to, $msg_body){
	$post_data = array(
	    'From'   => '01203842522',
	    'To'    => $msg_to,
	    'Body'  => $msg_body
	);
	 
	$exotel_sid = "Your exotel sid";
	$exotel_token = "Your exotel token";
	 
	$url = "https://".$exotel_sid.":".$exotel_token."@twilix.exotel.in/v1/Accounts/".$exotel_sid."/Sms/send";
	 
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_VERBOSE, 1);
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_FAILONERROR, 0);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
	curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_data));
	 
	$http_result = curl_exec($ch);
	$error = curl_error($ch);
	$http_code = curl_getinfo($ch ,CURLINFO_HTTP_CODE);
	 
	curl_close($ch);
}

function send_bulk_sms($msg_to_str, $msg_body){
	$post_data = array(
	    'From'   => '01203842522',
	    'To'    => explode(",", $msg_to_str),
	    'Body'  => $msg_body
	);
	 
	$exotel_sid = "Dummy";
	$exotel_token = "8cfc50cc117dcf34956b5ab141815bbd6b1c85e1";
	 
	$url = "https://".$exotel_sid.":".$exotel_token."@twilix.exotel.in/v1/Accounts/".$exotel_sid."/Sms/send";
	 
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_VERBOSE, 1);
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_FAILONERROR, 0);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
	curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_data));
	 
	$http_result = curl_exec($ch);
	$error = curl_error($ch);
	$http_code = curl_getinfo($ch ,CURLINFO_HTTP_CODE);
	 
	curl_close($ch);
}

$result = "";
for($i=2;$i<count($argv);$i++)
	$result .= (" ".$argv[$i]);
send_sms($argv[1],$result);
?>
