<?php
include("load.php");


switch($_POST['type']) {
    case 1:
        $con_str = 'MD_TableID = ' . json_decode($_POST['table']);
        load("MD_Attribute", $con_str);
        break;
    case 2:
        //loadResultTable($_POST['sql']);
        break;
    default:
        break;
}


?>