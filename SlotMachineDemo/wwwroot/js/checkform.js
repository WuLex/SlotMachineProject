function check_empty(param) {
    if (param == null || param == "") {
        return true;
    }
    return false;
}

/*是否是数字*/
function check_number(param) {
    var pattern = /^\d+$/;
    if (param != null && param != "" && pattern.test(param)) {
        return true;
    }
    return false;
}

/*是否是字母和数字*/
function check_letternumber(param) {
    var pattern = /^[A-Za-z0-9]+$/;
    if (param != null && param != "" && pattern.test(param)) {
        return true;
    }
    return false;
}

/*是否是浮点数，2位小数*/
function check_floattwo(param) {
    var pattern = /^\d+(\.\d{1,2})?$/;
    if (param != null && param != "" && pattern.test(param)) {
        return true;
    } else {
        return false;
    }
}

/*是否是浮点数，1位小数*/
function check_floatone(param) {
    var pattern = /^\d+(\.\d{1,1})?$/;
    if (param != null && param != "" && pattern.test(param)) {
        return true;
    } else {
        return false;
    }
}

/*是否是浮点数，2位整数2位小数*/
function checkkj_float(param) {
    var pattern = /^(0|[1-9]\d{0,1})(\.\d{1,2})?$/;

    if (param != null && param != "" && pattern.test(param)) {
        return true;
    } else {
        return false;
    }
}

function check_len(param, len) {

    if (param == null) {
        return true;
    }
    var strlen = param.replace(/[^\x00-\xff]/g, "aa").length;
    if (strlen > len) {
        return false;
    }
    return true;
}

function check_teladdress(param) {
    var pattern = /\d{8}/;
    if (pattern.test(param)) {
        return false;
    } else {
        return true;
    }

}

function check_tel(param) {
    var filter = param.value.replace(/\s/g, '');
    var email = /^1[3456789]\d{9}$|^(0[2-9]\d{1,3}-|010-)?[2-9]\d{6,7}?$|^(?!\d+(-\d+){3,})[48]00(\d){7,10}$/;
    if (!email.test(filter) && (filter != "")) {
        return false;
    }
    return true;
}

function check_telinstr(param) {
    var email =
        /[0123456789一二三四五六七八九零壹贰叁肆伍陆柒捌玖０９８７６５４３２１①②③④⑤⑥⑦⑧⑨⑩㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑](.?.?.?[0123456789一二三四五六七八九零壹贰叁肆伍陆柒捌玖０９８７６５４３２１①②③④⑤⑥⑦⑧⑨⑩㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑]){5,}(.?.?.?)[0123456789一二三四五六七八九零壹贰叁肆伍陆柒捌玖０９８７６５４３２１①②③④⑤⑥⑦⑧⑨⑩㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑]/;
    if (param != "") {
        var re = email.exec(param);
        if (re) {
            if (check_tel({ value: re[0].replace(/\_/g, '') }) || re[0].length > 6) return false;
        }
    }
    return true;
}

function check_email(param) {
    var email = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    if (!email.test(param) && param != "") return false;
    return true;
}

function check_emailinstr(param) {
    var email = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    if (email.exec(param) && param != "") return false;
    return true;
}

function check_webinstr(param) {
    var email = /[^\u4e00-\u9fa5]+\.+[^\u4e00-\u9fa5]+\.[^\u4e00-\u9fa5]+([./?%&=]*)?/;
    if (email.exec(param) && param != "") return false;
    return true;
}

function check_specialstr(param) {

    /*var email = /^[\w\!,，。《》\[\]！【】\?“”/%；;\"——\-？、（）()_\d\.\u4e00-\u9fa5]+$/ig;
     var ret = (email.test(param.replace(/\s/g, '')) && param != "");
     */
    var regex = /[`~!@#$%^&*_+=<>?:"{}|,\/;'\\·~！@#￥%……&*（）——+={}|《》？：“”【】、；‘'，。、]+/ig;
    var ret = (regex.test(param.replace(/\s/g, '')) && param != "");
    return ret;
}

function getByteLen(val) {
    var len = 0;
    for (var i = 0; i < val.length; i++) {
        var a = val.charAt(i);
        if (a.match(/[^\x00-\xff]/ig) != null) {
            len += 2;
        } else {
            len += 1;
        }
    }
    return len;
}

function check_telm(param) {
    var email = /^1[23456789]\d{9}$|^(0[2-9]\d{1,3}-|010-)?[2-9]\d{6,7}?$|^(?!\d+(-\d+){3,})[48]00(\d){7,10}$/;
    if (!email.test(param.replace(/\s/g, '')) && param.value != "")
        return false;
    return true;
}

String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.len = function() {
    return this.replace(/[^\x00-\xff]/g, "aa").length;
};
String.prototype.isCell = function() {
    var pattern = /^1[123456789][0-9]{9}$/;
    if (pattern.test(this)) return true;
    else return false;
};