<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>peip_assg_7</title>
</head>
<body>

<div>
    <button onclick="window.location = 'index.php'">Go Back</button>
</div>
<div><table style="border: 1px solid slateblue">
<?php
include("load.php");

loadResultTable($_POST['sql']);

?>
</table></div>
<div>
    <button onclick="window.location = 'index.php'">Go Back</button>
</div>
</body>
</html>