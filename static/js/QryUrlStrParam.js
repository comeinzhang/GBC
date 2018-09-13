function getQueryString() {
    var result = location.search.match(new RegExp("[\?\&][^\?\&]+=[^\?\&]+", "g"));
    for (var i = 0; i < result.length; i++) {
        result[i] = result[i].substring(1);
    }
    return result;
}
function getQueryStringForUrl(url) {
    var urlarr = url.split('?');
    var result = null;
    if (urlarr.length > 1) {
        result = ("?"+urlarr[1]).match(new RegExp("[\?\&][^\?\&]+=[^\?\&]+", "g"));
        for (var i = 0; i < result.length; i++) {
            result[i] = result[i].substring(1);
        }
    }
    return result;
}
function replaceParamVal(Url, paramName, value) {
    var re = eval('/(' + paramName + '=)([^&]*)/gi');
    var nUrl = Url.replace(re, paramName + '=' + value);
    return nUrl;
}
function removeParamVal(Url,paramName)
{
    var re = eval('/(' + paramName + '=)([^&]*)/gi');
    var nUrl = Url.replace(re, '').trim();
    re = eval('/&+/');
    nUrl = nUrl.replace(re, '&');
    re = eval('/[\\?|&]\s*$/gi');
    nUrl = nUrl.replace(re, '');
    re = eval('/\\?&/gi');
    nUrl = nUrl.replace(re, '?');
    return nUrl;
}
function replaceOrAddParamVal(Url, paramName, value) {
    if(Url.indexOf(paramName+"=")<0)
    {
        if (Url.indexOf("?") > 0)
            return Url + "&" + paramName + "=" + value;
        else
            return Url + "?" + paramName + "=" + value;
    }
    else
    {
        return replaceParamVal(Url, paramName, value);
    }
}
function getQueryString(name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    }
    return null;
}