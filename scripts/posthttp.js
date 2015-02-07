var url = "https://hooks.slack.com/services/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";
var method = "POST";
var postData = '{"channel": "#random", "username": "21daybot", "text": "Congrats to Darren for writing'+Math.random()*100+'lines of code today!", "icon_emoji": ":ballot_box_with_check: "}';
var async = true;
var request = new XMLHttpRequest();
 
request.onload = function () {
    var status = request.status; // HTTP response status, e.g., 200 for "200 OK"
    var data = request.responseText; // Returned data, e.g., an HTML document.
};
 
var delay = 1000;
for(var a = 1; a <= 21; a++) {
    setTimeout(
        (function(a){
            return function() {
                postData = '{"channel": "#21day", "username": "21daybot", "text": "Congrats to Darren on day '+a+' for writing '+Math.random()*100+' lines of code today!", "icon_emoji": ":ballot_box_with_check: "}';
                request.open(method, url, async);
                request.send(postData); }
    })(a), delay);
    delay += 1000;
}