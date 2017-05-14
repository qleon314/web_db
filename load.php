
<?php

include("dbconnect.inc.php");

static $link;
if(!$link) {
    $link = mysqli_connect($host, $user, $password) or die("Error in db_connect " . mysqli_error($link));
    mysqli_select_db($link, $database);
}

function getData($tableName, $attributesName = "") {
    global $link;
    $string = $attributesName;
    if(is_array($attributesName)) {
        $string = "";
        for($i = 0; $i < count($attributesName); ++$i) {
            $string = $string . $attributesName[$i] . ",";
        }
        $string = rtrim($string, ",");
    }
    $keyName = getPrimaryKeyName($tableName);

    $query = "SELECT " . $keyName . "," . $string . " FROM ". $tableName;
    $result = mysqli_query($link, $query) or die("Error: " . mysqli_error($link));
    $tables = array();

    while($table = $result->fetch_assoc()) {
        $tables[$table[$keyName]] = $table;
    }
    return $tables;
}

function getPrimaryKeyName($table) {
    global $link;
    $query = "SHOW KEYS FROM ". $table. " WHERE Key_name = 'PRIMARY'";
    $result = mysqli_query($link, $query) or die("Error: " . mysqli_error($link));
    $row = mysqli_fetch_array($result);
    return $row['Column_name'];
}

function getRecords($query) {
    global $link;
    $results = mysqli_query($link, $query) or die("Error: " . mysqli_error($link));
    $records = array();

    while($record = $results->fetch_assoc()) {
        $records[] = $record;
    }
    return $records;
}

/*
 * <option id="PrimaryKey" value="RealName">DisplayName</option>
 */
function load($tableName, $cons = "") {
    $query = "select * from " . $tableName;
    $pk = getPrimaryKeyName($tableName);
    if($cons != "") $query = $query . " where " . $cons;
    $tables = getRecords($query);
    echo('<option id="'.$tables[0][$pk].'" value="'.$tables[0]['RealName'].'" selected>'.$tables[0]['DisplayName'].'</option>');
    for($i = 1; $i < count($tables); ++$i) {
        echo('<option id="'.$tables[$i][$pk].'" value="'.$tables[$i]['RealName'].'">'
            .$tables[$i]['DisplayName'].'</option>');
    }
}

function loadJoin() {
    $query = "select * from MD_Join";
    $tables = getRecords($query);
    for($i = 0; $i < count($tables); ++$i) {
        echo('<tr id='.$i.'><td id="'.$tables[$i]['Table1Name'].'">' .$tables[$i]['Table1Key'].'</td>');
        echo('<td id="'.$tables[$i]['Table2Name'].'">' .$tables[$i]['Table2Key'].'</td></tr>');
    }
}

function loadResultTable($query) {
    global $link;
    $result = mysqli_query($link, $query) or die("Error: " . mysqli_error($link));
    $columnCount = mysqli_field_count($link);
    echo "<tr style='background-color: cornflowerblue'>";
    for($idx = 0; $idx < $columnCount; $idx++) {
        $field = mysqli_fetch_field_direct($result, $idx);
        echo "<th><font color='white'>" . $field->name . "</font></th>";
    }
    echo "</tr>";

    while($row = mysqli_fetch_array($result)) {
        echo "<tr>";
        for($idx = 0; $idx < $columnCount; $idx++)
            echo "<td>" . $row[$idx] . "</td>";
        echo "</tr>";
    }
    echo "<tr>" . mysqli_num_rows($result) . " row(s) found</tr>";

}

//if($link) mysqli_close($link);

?>
