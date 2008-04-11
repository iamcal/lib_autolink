<?php
	#
	# A simple PHP test harness
	#
	# $Id: test_harness.php,v 1.2 2005/10/20 17:44:41 cal Exp $
	#
	# By Cal Henderson <cal@iamcal.com>
	# This code is licensed under a Creative Commons Attribution-ShareAlike 2.5 License
	# http://creativecommons.org/licenses/by-sa/2.5/
	#

	$GLOBALS[tests] = array();
	$GLOBALS[verbose] = $GLOBALS[HTTP_GET_VARS][verbose];

	function test_harness($in, $out, $got, $name){

		echo "$name : ";
		if ($out == $got){
			echo "<span style=\"color: green;\">pass</span>";
		}else{
			echo "<span style=\"color: red; font-weight: bold;\">fail</span>";
		}
		if ($GLOBALS[verbose] || ($out != $got)){
			echo " (<b>in:</b> ".htmlentities($in)." <b>expected:</b> ".htmlentities($out)." <b>got:</b> ".htmlentities($got).")";
		}
		echo "<br>\n";
	}

?>