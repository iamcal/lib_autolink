<?php
	$dir = dirname(__FILE__);
	include($dir.'/testmore.php');
	include($dir.'/wrapper.php');
	include($dir.'/../lib_autolink.php');


	plan(24);

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
