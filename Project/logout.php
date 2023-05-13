<?php 
session_start();
$_SESSION["userID"] = '';
$_SESSION["name"] = '';
$_SESSION["role"] = '';
session_destroy;
header("Location:index.php");
?>

