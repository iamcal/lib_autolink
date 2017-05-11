<?php
	$dir = dirname(__FILE__);
	include($dir.'/testmore.php');
	include($dir.'/wrapper.php');
	include($dir.'/../lib_autolink.php');

	plan(2);

	##################################################################################

	#
	# an old version failed this test, since it treated the UTF-8 em-dash bytes
	# as allowed Latin-1 characters. We explicitly list allowed URL characters now,
	# so this should not happen.
	#

	autolink_harness("foo http://iamcal.com\xE2\x80\x94 bar", "foo <a href=\"http://iamcal.com\">iamcal.com</a>\xE2\x80\x94 bar");

	#
	# an old version failed this test, since it does not allow UTF-8 separators
	# in pre-URL string. Below with the ZERO WIDTH SPACE character.
	#

	autolink_harness("foo \xE2\x80\x8Chttp://iamcal.com bar", "foo \xE2\x80\x8C<a href=\"http://iamcal.com\">iamcal.com</a> bar");
