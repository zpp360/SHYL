function Success(msg) {
    $.dialog.tips(msg, 1, '/32X32/succ.png');
}

function Fail(msg) {
    $.dialog.tips(msg, 1, '/32X32/fail.png');
}

function checkcom(url, type, ulid) {
    $("#" + ulid).attr("data-target", "");
    if (type != 9) {
        if (type == 0) {
            window.location.href = url;
        } else if (type == 2) {
            $("#warntext").html("账号未通过审批，您无权限操作此功能！");
            $("#" + ulid).attr("data-target", "#layhomewarn");
        }
        else {
            $("#warntext").html("对不起，您无权限操作此功能！");
            $("#" + ulid).attr("data-target", "#layhomewarn");
        }
    }
    else {
        $("#" + ulid).attr("data-target", "#layhomewarn");
    }
}

function checkper(url, type, ulid) {
    $("#" + ulid).attr("data-target", "");
    if (type != 9) {
        if (type == 1) {
            window.location.href = url;
        }
        else {
            //$.dialog({ id: "I", title: "提示", content: "url:/ywdj/successcheck", min: false, max: false, width: "400px", height: "100px" });
            $("#warntext").html("对不起，您无权限操作此功能！");
            // $("#" + ulid).attr("data-target", ".bs-example-modal-sm");
        }
    }
    else {
        //$("#" + ulid).attr("data-target", ".bs-example-modal-sm");
    }
}

function checkts(url, type, ctype) {
  
    if (type == 0) {
        if (ctype == 2) {
            window.location.href = url;
        }
        else {
            $("#warntext").html("对不起，您无权限操作此功能！");
        }
    }
    else {
        //$.dialog({ id: "I", title: "提示", content: "url:/ywdj/successcheck", min: false, max: false, width: "400px", height: "100px" });
    }
}