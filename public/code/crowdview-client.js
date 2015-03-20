var crowdview = function() {
  var baseUrl = "http://localhost:3000/api"
  var logUrl = baseUrl + "/log"

  return {
    log: function(action, message) {
      var url = document.URL;
      var trackingUrl = logUrl + "?url=" + url + "&action=" + action;

      if (message) {
        trackingUrl += "&message=" + message;
      }

      var xmlHttp = null;

      xmlHttp = new XMLHttpRequest();
      xmlHttp.open("GET", trackingUrl, true);
      xmlHttp.setRequestHeader("Content-Type", "application/json");
      xmlHttp.send(null);
    },

    bootstrap: function() {
      $(function() {
        crowdview.log("visit");

        $("a").bind("mouseenter", function(event) {
          crowdview.log("mouseenter", "link content: " + event.target.innerHTML);
        });
        $("a").bind("mouseleave", function(event) {
          crowdview.log("mouseleave", "link content: " + event.target.innerHTML);
        });
      });
    }
  };
}();


crowdview.bootstrap();