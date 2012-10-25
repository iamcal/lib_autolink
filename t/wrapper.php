<?php
	function autolink_harness($in, $out, $name=null){
		is(autolink($in), $out, $name);
	}

	function autolink_email_harness($in, $out, $name=null){
		is(autolink_email($in), $out, $name);
	}

