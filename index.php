<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>peip_assg_7</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="jquery.min.js"></script>
    <script src="events.js"></script>
</head>
<body>

<?php
include("load.php");
?>

<div class="popup"></div>

<div id="container">

    <div id="header" style="height: 10px"></div>

    <div id="left" style="width:20px;float:left;"></div>

    <div id="content">

        <div id="table">
            <table id="main">
                <tr>
                    <td rowspan="3" id="r1c1">
                        <h4>Table</h4>
                        <select id="s1" size="8" class="sel">
                            <?php load("MD_Table");?>
                        </select>
                    </td>
                    <td rowspan="3" id="r1c2">
                        <button id="b1" class="bt"> >> </button>
                    </td>
                    <td rowspan="3" id="r1c3">
                        <h4>Attribute</h4>
                        <select id="s2" size="8" class="sel"></select>
                    </td>
                    <td id="r1c4">
                        <button id="b2" class="bt"> >> </button>
                    </td>
                    <td id="r1c5">
                        <h4>Selected</h4>
                        <select id="s3" size="8" class="sel"></select>
                    </td>
                    <td id="r1c6">
                        <p><button id="b3">  Up  </button></p>
                        <p><button id="b4"> Down </button></p>
                        <p><button id="b5">Remove</button></p>
                    </td>
                </tr>
                <tr>
                    <td id="r2c4">
                        <button id="b6" class="bt"> >> </button>
                    </td>
                    <td id="r2c5">
                        <h4>Order By</h4>
                        <select id="s4" size="8" class="sel"></select>
                    </td>
                    <td id="r2c6">
                        <p><button id="b16">a/desc</button></p>
                        <p><button id="b7">  Up  </button></p>
                        <p><button id="b8"> Down </button></p>
                        <p><button id="b9">Remove</button></p>
                    </td>
                </tr>
                <tr>
                    <td id="r3c4">
                        <button id="b10" class="bt"> >> </button>
                    </td>
                    <div id="ConstraintPopup">
                        <p id="attr_name"></p>
                        <p>
                            <select id="s6">
                                <?php load("MD_Constraint"); ?>
                            </select>
                        </p>
                        <p>
                            <textarea id="txt" rows="2" cols="35"></textarea>
                        </p>
                        <p>
                            <button id="b14"> OK </button>
                            <button id="b15"> Cancel </button>
                        </p>
                    </div>
                    <td id="r3c5">
                        <h4>Constraint</h4>
                        <select id="s5" size="8" class="sel"></select>
                    </td>
                    <td id="r3c6">
                        <p></p>
                        <p><button id="b11">Remove</button></p>
                        <p></p>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p><button id="b12" value="0" class="bt2"> Show Query </button></p>
                    </td>
                    <td colspan="3">
                        <p><button id="b18" value="0" class="bt2"> Submit </button></p>
                    </td>
                </tr>
            </table>
        </div>

    </div>

    <div id="dlg">
        <p id="sql"></p>
        <button id="b17">Dismiss</button>
    </div>

    <div id="right"></div>

    <div id="footer"></div>

    <div id="hidden" hidden>
        <table><tbody id="join">
            <?php loadJoin(); ?>
        </tbody></table>
    </div>

</div>

</body>
</html>

