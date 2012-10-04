<?php
	$dir = dirname(__FILE__);
	include($dir.'/testmore.php');
	include($dir.'/../lib_autolink.php');


	plan(3);

	# tagfill

	is(autolink('a www.abc.com b', 100, ''), 'a <a href="http://www.abc.com">www.abc.com</a> b');
	is(autolink('a www.abc.com b', 100, ' class="foo"'), 'a <a href="http://www.abc.com" class="foo">www.abc.com</a> b');


	# truncatation (with and without auto-titles)
	
	is(autolink('a www.abcdefghijklmnopqrstuvwxyz.com b', 10), 
		'a <a href="http://www.abcdefghijklmnopqrstuvwxyz.com" title="http://www.abcdefghijklmnopqrstuvwxyz.com">www.abc...</a> b');

	is(autolink('a www.abcdefghijklmnopqrstuvwxyz.com b', 10, '', false),
		'a <a href="http://www.abcdefghijklmnopqrstuvwxyz.com">www.abc...</a> b');
