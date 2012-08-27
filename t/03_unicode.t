<?php
	$dir = dirname(__FILE__);
	include($dir.'/testmore.php');
	include($dir.'/wrapper.php');
	include($dir.'/../lib_autolink.php');

	plan(1);

	##################################################################################

	#
	# an old version failed this test, since it treated the UTF-8 em-dash bytes
	# as allowed Latin-1 characters. We explicitly list allowed URL characters now,
	# so this should not happen.
	#

	autolink_harness("foo http://iamcal.com\xE2\x80\x94 bar", "foo <a href=\"http://iamcal.com\">iamcal.com</a>\xE2\x80\x94 bar");
