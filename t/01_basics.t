<?php
	$dir = dirname(__FILE__);
	include($dir.'/testmore.php');
	include($dir.'/wrapper.php');
	include($dir.'/../lib_autolink.php');


	plan(25);

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
	autolink_harness('ftp://x.com', '<a href="ftp://x.com">x.com</a>');

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

	# balacned trailing punctuation (thankyou wikipedia)
	autolink_harness('www.x.com/woo(yay)', '<a href="http://www.x.com/woo(yay)">www.x.com/woo(yay)</a>');
	autolink_harness('www.x.com/woo{yay}', '<a href="http://www.x.com/woo">www.x.com/woo</a>{yay}');
	autolink_harness('www.x.com/woo[yay]', '<a href="http://www.x.com/woo">www.x.com/woo</a>[yay]');
	autolink_harness('(www.x.com)', '(<a href="http://www.x.com">www.x.com</a>)');
	autolink_harness('[www.x.com]', '[<a href="http://www.x.com">www.x.com</a>]');
	autolink_harness('{www.x.com}', '{<a href="http://www.x.com">www.x.com</a>}');
