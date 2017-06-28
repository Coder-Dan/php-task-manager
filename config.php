<?php
    # Define() - used to define a costant at runtime
    define('DB_SERVER', 'localhost:3306');
    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', 'rootrootroot');
    define('DB_DATABASE', 'taskmanagersystemdb');

    # you may also use variables instead, but refere to docs
    
    # This connection code is depricated since, php 5.5 and no longer used in PHP 7.0
    // $db = mysql_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

    # Docs (start here): http://php.net/manual/en/mysqli.quickstart.dual-interface.php
    $mysqli = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

    if($mysqli->connect_errno > 0){
        die("Unable to connect to db_server '" . DB_SERVER . "' : [" . $mysqli->$connect_error . "]");
    }
    // mysql_select_db(DB_DATABASE);

    # TODO: log Sucessful connection @ time
    ini_set('session.use_strict_mode', 1 );

?> 