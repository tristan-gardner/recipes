"use strict";

var recipes = (function() {
    // make any additional "private" function or variables here
    function vote(e) {
      //e = array of 3 items
      console.log(e);
      if (e.detail[1] === "OK") {
        var vote = JSON.parse(e.detail[2].responseText);
        jQuery("#upcount").text(vote.up);
        jQuery("#downcount").text(vote.down);
      } else {
        console.log("uh oh");
      }
      console.log("voting");
    }

    function comment(e) {
      var review = JSON.parse(e.detail[2].responseText);
      jQuery("ul").append("Reviewed by " + review.user + "<br />");
      jQuery("ul").append(review.description + "<br />");
      jQuery("ul").append(review.rating + "/5 <br />");
      jQuery("#descriptionbox")[0].value = "";
    }

    return {
        init: function() {
            //
            // do any initialization for javascript here
            //
            $("a[data-remote]").on("ajax:success", vote);
            $("form[data-remote]").on("ajax:success", comment);

        },
    };

})();
jQuery(recipes.init);
