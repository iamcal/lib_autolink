# lib_autolink - PHP HTML link formatting library

Find URLs in HTML that are not already links, and make them into links.


## Usage

    include('lib_autolink.php');


    # simple mode
    $html = autolink($html);

    # truncate URLs longer than 20 characters
    $html = autolink($html, 20);

    # insert some magic into the <a> tags
    $html = autolink($html, 30, ' class="mylink"');


    # link up email address
    $html = autolink_email($html);


## Testing

If you have perl's <a href="http://search.cpan.org/dist/Test-Harness/">Test::Harness</a> installed (you almost certainly do), you can 
run the tests using:

    prove --exec 'php' t/*.t
