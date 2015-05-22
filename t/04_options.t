<?php
	$dir = dirname(__FILE__);
	include($dir.'/testmore.php');
	include($dir.'/../lib_autolink.php');


	plan(9);

	# tagfill

	is(autolink('a www.abc.com b', 100, ''), 'a <a href="http://www.abc.com">www.abc.com</a> b');
	is(autolink('a www.abc.com b', 100, ' class="foo"'), 'a <a href="http://www.abc.com" class="foo">www.abc.com</a> b');


	# truncatation (with and without auto-titles)
	
	is(autolink('a www.abcdefghijklmnopqrstuvwxyz.com b', 10), 
		'a <a href="http://www.abcdefghijklmnopqrstuvwxyz.com" title="http://www.abcdefghijklmnopqrstuvwxyz.com">www.abc...</a> b');

	is(autolink('a www.abcdefghijklmnopqrstuvwxyz.com b', 10, '', false),
		'a <a href="http://www.abcdefghijklmnopqrstuvwxyz.com">www.abc...</a> b');

	is(autolink('a www.abc.com b www.def.com c', 10),
		'a <a href="http://www.abc.com" title="http://www.abc.com">www.abc...</a> b <a href="http://www.def.com" title="http://www.def.com">www.def...</a> c');


	# protocol stripping

	$GLOBALS['autolink_options']['strip_protocols'] = true;
	is(autolink('a http://foo.com b'), 'a <a href="http://foo.com">foo.com</a> b');
	is(autolink('a https://foo.com b'), 'a <a href="https://foo.com">foo.com</a> b');

	$GLOBALS['autolink_options']['strip_protocols'] = false;
	is(autolink('a http://foo.com b'), 'a <a href="http://foo.com">http://foo.com</a> b');
	is(autolink('a https://foo.com b'), 'a <a href="https://foo.com">https://foo.com</a> b');
