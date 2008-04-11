<?php
	#
	# $Id: lib_autolink_test.php,v 1.4 2006/12/09 20:36:50 cal Exp $
	#
	# By Cal Henderson <cal@iamcal.com>
	# This code is licensed under a Creative Commons Attribution-ShareAlike 2.5 License
	# http://creativecommons.org/licenses/by-sa/2.5/
	#

	include("lib_autolink.php");
	include("test_harness.php");

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

	##################################################################################

	# basics
	autolink_email_harness("","");
	autolink_email_harness("hello","hello");
	autolink_email_harness('foo@bar', '<a href="mailto:foo@bar">foo@bar</a>');

	# included characters
	autolink_email_harness('a.b.c.d.e@f.g.h.i', '<a href="mailto:a.b.c.d.e@f.g.h.i">a.b.c.d.e@f.g.h.i</a>');
	autolink_email_harness('.foo@bar.', '.<a href="mailto:foo@bar">foo@bar</a>.');
	autolink_email_harness('(foo@bar)', '(<a href="mailto:foo@bar">foo@bar</a>)');

	# multiple address
	autolink_email_harness('foo@bar baz@quux', '<a href="mailto:foo@bar">foo@bar</a> <a href="mailto:baz@quux">baz@quux</a>');

	# other data
	autolink_email_harness('hello foo@bar world', 'hello <a href="mailto:foo@bar">foo@bar</a> world');
	autolink_email_harness('<b>hello foo@bar world</b>', '<b>hello <a href="mailto:foo@bar">foo@bar</a> world</b>');

	# containers
	autolink_email_harness('<a href="#">foo@bar</a>', '<a href="#">foo@bar</a>');
	autolink_email_harness('<a href="#">hello foo@bar world</a>', '<a href="#">hello foo@bar world</a>');

	# partial address
	autolink_email_harness('foo@', 'foo@');
	autolink_email_harness('foo@ bar', 'foo@ bar');
	autolink_email_harness('@bar', '@bar');
	autolink_email_harness('foo @bar', 'foo @bar');
	autolink_email_harness('@', '@');
	autolink_email_harness('foo @ bar', 'foo @ bar');

	# special characters
	autolink_email_harness('\\@\\', '\\@\\');
	autolink_email_harness(':@:', ':@:');
	autolink_email_harness(';@;', ';@;');
	autolink_email_harness(',@,', ',@,');
	autolink_email_harness('(@)', '(@)');
	autolink_email_harness('<@>', '<@>');
	autolink_email_harness('[@]', '[@]');

	##################################################################################

	function autolink_harness($in, $out){
		$got = autolink($in);
		test_harness($in, $out, $got, "Autolink test ".++$GLOBALS[tests][autolink]);
	}

	function autolink_email_harness($in, $out){
		$got = autolink_email($in);
		test_harness($in, $out, $got, "Autolink email test ".++$GLOBALS[tests][autolink_email]);
	}


?>