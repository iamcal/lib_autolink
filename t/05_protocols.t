<?php
	$dir = dirname(__FILE__);
	include($dir.'/testmore.php');
	include($dir.'/../lib_autolink.php');

	plan(7);

	# mixed cases
	is(autolink('a HTTP://a.com b'), 'a <a href="HTTP://a.com">a.com</a> b');
	is(autolink('a HtTp://a.com b'), 'a <a href="HtTp://a.com">a.com</a> b');

	# non-standard :// protocols
	is(autolink('a ssh://a.com b'), 'a <a href="ssh://a.com">ssh://a.com</a> b');
	is(autolink('a file://a.com b'), 'a <a href="file://a.com">file://a.com</a> b');
	is(autolink('a itms-services://a.com b'), 'a <a href="itms-services://a.com">itms-services://a.com</a> b');

	# colon-only ptotocols
	is(autolink('a mailto:woo@yay.com b'), 'a <a href="mailto:woo@yay.com">mailto:woo@yay.com</a> b');
	is(autolink('a skype:iamcal b'), 'a <a href="skype:iamcal">skype:iamcal</a> b');

