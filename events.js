var SelTable = {};
var SelAttri = {};

var SelectedList = [];
var OrderList = [];
var ConstrainList = [];
var JoinList = [];

Array.prototype.swap = function (x, y) {
    var b = this[x];
    this[x] = this[y];
    this[y] = b;
};

Object.asSize = function (obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};

function search(list, value) {
    for (var i = 0; i < list.length; ++i) {
        if (list[i] == value) {
            return i;
        }
    }
    return -1;
}

function setJoinList() {
    var obj = $("#join").children();
    var size = obj.size();
    obj = obj.first();
    for (var i = 0; i < size; ++i) {
        JoinList[i] = [];
        var tmp = obj.children().first();
        JoinList[i][0] = {t: tmp.attr("id"), k: tmp.html()};
        tmp = tmp.next();
        JoinList[i][1] = {t: tmp.attr("id"), k: tmp.html()};
        obj = obj.next();
    }
}

function getTablesAfterJoin(tableList) {
    var foundList = [];
    var pointList = {};

    if (!JoinList.length) setJoinList();

    foundList.push(tableList[0]);
    while (foundList.length != tableList.length) {
        var nodeList = [];
        var visited = {};
        var idx = 0;

        if (foundList.length > 1) {
            for (var i = 0; i < tableList.length; ++i) {
                if (search(foundList, tableList[i]) == -1) {
                    idx = i;
                    break;
                }
            }
        }

        nodeList.push(tableList[idx]);
        visited[tableList[idx]] = {p: null};
        while (nodeList.length != 0) {
            var node = nodeList[nodeList.length - 1];
            nodeList.pop();
            for (var j = 0; j < JoinList.length; ++j) {
                var nb = "";
                if (node == JoinList[j][0]['t']) {
                    nb = JoinList[j][1]['t'];
                }
                if (node == JoinList[j][1]['t']) {
                    nb = JoinList[j][0]['t'];
                }
                if (nb != "" && visited[nb] == null) {
                    visited[nb] = {p: node};
                    if (search(tableList, nb) != -1) {
                        foundList.push(nb);
                        var ptr = nb;
                        while (visited[ptr] != null) {
                            pointList[ptr] = 1;
                            ptr = visited[ptr].p;
                        }
                    }
                    nodeList.push(nb);
                }
            }
        }
    }

    return pointList;
}

function generateSql() {
    var sel_attr = "";
    var ord_attr = "";
    var cst = "";
    var tbl = "";
    var join = "";
    var assoTbList = {};
    var tableList = [];

    // select Attributes from Tables where Joins and Constrains order by Orders;

    if (SelectedList.length > 0) {
        for (var i = 0; i < SelectedList.length; ++i) {
            sel_attr = sel_attr + SelectedList[i].table + "." + SelectedList[i].attr + ", ";
            assoTbList[SelectedList[i].table] = 1;
        }
        sel_attr = sel_attr.slice(0, -2);
    } else {
        sel_attr = "*";
    }

    if (OrderList.length > 0) {
        for (i = 0; i < OrderList.length; ++i) {
            ord_attr = ord_attr + OrderList[i].table.n + "." + OrderList[i].attr.n
                + " " + OrderList[i].order.toUpperCase() + ", ";
            assoTbList[OrderList[i].table.n] = 1;
        }
        ord_attr = ord_attr.slice(0, -2);
    }

    if (ConstrainList.length > 0) {
        for (i = 0; i < ConstrainList.length; ++i) {
            cst = cst + ConstrainList[i].table + "." + ConstrainList[i].attr + " "
                + ConstrainList[i].op + " '" + ConstrainList[i].vlu + "' and ";
            assoTbList[ConstrainList[i].table] = 1;
        }
        cst = cst.slice(0, -5);
    }

    if (Object.asSize(assoTbList) > 1) {
        for (var key in assoTbList) {
            if (assoTbList.hasOwnProperty(key)) {
                tableList.push(key);
            }
        }
        assoTbList = getTablesAfterJoin(tableList);

        for (i = 0; i < JoinList.length; ++i) {
            var ta = JoinList[i][0]['t'];
            var tb = JoinList[i][1]['t'];
            if (assoTbList[ta] != null && assoTbList[tb] != null) {
                join = join + ta + "." + JoinList[i][0]['k'] + " = "
                    + tb + "." + JoinList[i][0]['k'] + " and ";
            }
        }
        join = join.slice(0, -5);
    }

    for (var k in assoTbList) {
        if (assoTbList.hasOwnProperty(k)) {
            tbl = tbl + k + ", ";
        }
    }
    tbl = tbl.slice(0, -2);

    var sql = "SELECT " + sel_attr + " FROM " + tbl;
    if (join != "") {
        sql = sql + " WHERE " + join;
        if (cst != "") sql = sql + " and " + cst;
    } else if (cst != "") {
        sql = sql + " WHERE " + cst;
    }
    if (ord_attr != "") {
        sql = sql + " ORDER BY " + ord_attr;
    }
    sql = sql + ";";

    return sql;
}

$(document).ready(function () {
    //select
    $("#b1").click(function () { //table
        var obj = $("#s1 option:selected");
        SelTable.name = obj.val();
        SelTable.alias = obj.text();
        $.post("update.php", {type: 1, table: obj.attr("id")}, function (data) {
            $("#s2").html(data);
        });
    });
    $("#b2").click(function () {  //selected
        if ($("#s2 option").size() == 0) return;
        var obj = $("#s2 option:selected");
        SelAttri.name = obj.val();
        SelAttri.alias = obj.text();
        SelectedList.push({table: SelTable.name, attr: SelAttri.name});
        var data = "<option value = \"" + SelTable.name + "." + SelAttri.name + "\">"
            + SelTable.alias + "." + SelAttri.alias + "</option>";
        $("#s3").append(data);
    });
    $("#b6").click(function () { //order
        if ($("#s2 option").size() == 0) return;
        var obj = $("#s2 option:selected");
        SelAttri.name = obj.val();
        SelAttri.alias = obj.text();
        OrderList.push({
            table: {n: SelTable.name, a: SelTable.alias}
            , attr: {n: SelAttri.name, a: SelAttri.alias}, order: "asc"
        });
        var data = "<option value = \"" + SelTable.name + "." + SelAttri.name + "\">"
            + SelTable.alias + "." + SelAttri.alias + " -- asc" + "</option>";
        $("#s4").append(data);
    });
    $("#b16").click(function () {  //set asc/desc
        var pos = $("#s4")[0].selectedIndex;
        if (pos >= 0) {
            var obj = $("#s4 option:selected");
            var rc = OrderList[pos];
            if (rc.order == "asc")
                rc.order = "desc";
            else
                rc.order = "asc";
            obj.text(rc.table.a + "." + rc.attr.a + " -- " + rc.order);
        }
    });
    $("#b10").click(function () { //cons_popup
        if ($("#s2 option").size() == 0) return;
        var obj = $("#s2 option:selected");
        SelAttri.name = obj.val();
        SelAttri.alias = obj.text();
        $("#attr_name").html(SelTable.alias + "." + SelAttri.alias);
        $("#ConstraintPopup").slideDown();
    });
    $("#b14").click(function () { //constraint ok
        var txt = $("#txt").val();
        if (txt.length == 0) return;
        var obj = $("#s6 option:selected");
        ConstrainList.push({table: SelTable.name, attr: SelAttri.name, op: obj.val(), vlu: txt});
        var data = "<option value = \"" + SelTable.name + "." + SelAttri.name + "\">"
            + SelTable.alias + "." + SelAttri.alias + " " + obj.text() + " " + txt + "</option>";
        $("#s5").append(data);
        $("#ConstraintPopup").slideUp();
    });
    $("#b15").click(function () { //cancel
        $("#ConstraintPopup").slideUp();
    });
    //up
    $("#b3").click(function () {  //selected list
        var obj = $("#s3 option:selected");
        var newPos = $("#s3")[0].selectedIndex - 1;
        if (newPos > -1) {
            SelectedList.swap(newPos + 1, newPos);
            obj.prev().before("<option value='" + obj.val() + "' selected>" + obj.text() + "</option>");
            obj.remove();
        }
    });
    $("#b7").click(function () {  //order by list
        var obj = $("#s4 option:selected");
        var newPos = $("#s4")[0].selectedIndex - 1;
        if (newPos > -1) {
            OrderList.swap(newPos + 1, newPos);
            obj.prev().before("<option value='" + obj.val() + "' selected>" + obj.text() + "</option>");
            obj.remove();
        }
    });
    //down
    $("#b4").click(function () {  //selected list
        var obj = $("#s3 option:selected");
        var newPos = $("#s3")[0].selectedIndex + 1;
        if (newPos < SelectedList.length) {
            SelectedList.swap(newPos - 1, newPos);
            obj.next().after("<option value='" + obj.val() + "' selected>" + obj.text() + "</option>");
            obj.remove();
        }
    });
    $("#b8").click(function () {  //order by list
        var obj = $("#s4 option:selected");
        var newPos = $("#s4")[0].selectedIndex + 1;
        if (newPos < OrderList.length) {
            OrderList.swap(newPos - 1, newPos);
            obj.next().after("<option value='" + obj.val() + "' selected>" + obj.text() + "</option>");
            obj.remove();
        }
    });
    //delete
    $("#b5").click(function () {  //selected list
        SelectedList.splice($("#s4")[0].selectedIndex, 1);
        $("#s3 option:selected").remove();
    });
    $("#b9").click(function () {  //order by list
        OrderList.splice($("#s4")[0].selectedIndex, 1);
        $("#s4 option:selected").remove();
    });
    $("#b11").click(function () { //constraints list
        ConstrainList.splice($("#s4")[0].selectedIndex, 1);
        $("#s5 option:selected").remove();
    });
    //show query
    $("#b12").click(function () { //show and update
        if (!SelectedList.length && !OrderList.length && !ConstrainList.length) return;
        var obj = $("#b12");
        var sql = generateSql();
        $("#sql").html(sql);
        if (obj.val() == "0") {
            $("#dlg").toggle();
            obj.val("1");
            obj.html("update query");
        }
    });
    $("#b17").click(function () { //dismiss
        $("#dlg").toggle();
        var obj = $("#b12");
        obj.val("0");
        obj.html("show query");
    });
    //submit
    $("#b18").click(function () {
        if (!SelectedList.length && !OrderList.length && !ConstrainList.length) return;
        var sql = generateSql();
        var form = $('<form action="result.php" method="post" hidden>' +
            '<input type="text" name="sql" value="' + sql + '" /></form>');
        $('body').append(form);
        $(form).submit();
    });
});
