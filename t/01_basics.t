<?php
	$dir = dirname(__FILE__);
	include($dir.'/testmore.php');
	include($dir.'/wrapper.php');
	include($dir.'/../lib_autolink.php');


	plan(38);

	##################################################################################

	# basics
	autolink_harness("","");
	autolink_harness("hello","hello");

	# www. simple tests
	autolink_harness('www.x.com', '<a href="http://www.x.com">www.x.com</a>');
	autolink_harness(' www.x.com', ' <a href="http://www.x.com">www.x.com</a>');
	autolink_harness('www.x.com ', '<a href="http://www.x.com">www.x.com</a> ');

	# protocol tests
	autolink_harness('http://x.com', '<a href="http://x.com">x.com</a>');
	autolink_harness('https://x.com', '<a href="https://x.com">x.com</a>');
	autolink_harness('ftp://x.com', '<a href="ftp://x.com">ftp://x.com</a>');

	# container tests
	autolink_harness('<a href="x">www.x.com</a>', '<a href="x">www.x.com</a>');
	autolink_harness('<a href="x">http://x.com</a>', '<a href="x">http://x.com</a>');
	autolink_harness('<a href="x"> www.x.com </a>', '<a href="x"> www.x.com </a>');
	autolink_harness('<a href="x"> http://x.com </a>', '<a href="x"> http://x.com </a>');
	autolink_harness('<a href="x">foo www.x.com bar</a>', '<a href="x">foo www.x.com bar</a>');
	autolink_harness('<a href="x">foo <b>www.x.com</b> bar</a>', '<a href="x">foo <b>www.x.com</b> bar</a>');

	# trailing punctuation tests
	autolink_harness('www.x.com.', '<a href="http://www.x.com">www.x.com</a>.');
	autolink_harness('www.x.com,', '<a href="http://www.x.com">www.x.com</a>,');
	autolink_harness('www.x.com!', '<a href="http://www.x.com">www.x.com</a>!');
	autolink_harness('www.x.com?', '<a href="http://www.x.com">www.x.com</a>?');
	autolink_harness('www.x.com)', '<a href="http://www.x.com">www.x.com</a>)');
	autolink_harness('www.x.com...', '<a href="http://www.x.com">www.x.com</a>...');
	autolink_harness('www.x.com!!!', '<a href="http://www.x.com">www.x.com</a>!!!');

	# balanced trailing punctuation (thankyou wikipedia)
	autolink_harness('www.x.com/woo(yay)', '<a href="http://www.x.com/woo(yay)">www.x.com/woo(yay)</a>');
	autolink_harness('www.x.com/woo{yay}', '<a href="http://www.x.com/woo">www.x.com/woo</a>{yay}');
	autolink_harness('www.x.com/woo[yay]', '<a href="http://www.x.com/woo">www.x.com/woo</a>[yay]');
	autolink_harness('(www.x.com)', '(<a href="http://www.x.com">www.x.com</a>)');
	autolink_harness('[www.x.com]', '[<a href="http://www.x.com">www.x.com</a>]');
	autolink_harness('{www.x.com}', '{<a href="http://www.x.com">www.x.com</a>}');

	# enclosing markup tests
	autolink_harness('<br>http://www.x.com', '<br><a href="http://www.x.com">www.x.com</a>');
	autolink_harness('<br>www.x.com', '<br><a href="http://www.x.com">www.x.com</a>');
	autolink_harness('http://www.x.com<br>', '<a href="http://www.x.com">www.x.com</a><br>');
	autolink_harness('www.x.com<br>', '<a href="http://www.x.com">www.x.com</a><br>');
	autolink_harness('<br>http://www.x.com<br>', '<br><a href="http://www.x.com">www.x.com</a><br>');
	autolink_harness('<br>www.x.com<br>', '<br><a href="http://www.x.com">www.x.com</a><br>');

	# issues seen elsewhere
	autolink_harness('http://foo.com/Test_(test)', '<a href="http://foo.com/Test_(test)">foo.com/Test_(test)</a>');

	autolink_harness('a http://foo.com/bar<baz> b', 'a <a href="http://foo.com/bar">foo.com/bar</a><baz> b');
	autolink_harness('a http://foo.com/bar&lt;baz&gt; b', 'a <a href="http://foo.com/bar&lt;baz&gt;">foo.com/bar&lt;baz&gt;</a> b');
	autolink_harness('a http://foo.com/bar&#123; b', 'a <a href="http://foo.com/bar{">foo.com/bar{</a> b');

	# escaping of the auto-title (specifically the amnpersand)
	autolink_harness('a http://foo.1234567890.com/bar/?c=1&d=2 b',
		'a <a href="http://foo.1234567890.com/bar/?c=1&amp;d=2" title="http://foo.1234567890.com/bar/?c=1&amp;d=2">foo.1234567890.com/bar/?c=1...</a> b');
