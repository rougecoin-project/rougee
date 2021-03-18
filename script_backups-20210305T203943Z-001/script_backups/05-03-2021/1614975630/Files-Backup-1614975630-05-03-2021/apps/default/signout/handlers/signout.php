<?php
$signout = User::signoutUser(); 
header("Location: $site_url");
exit();