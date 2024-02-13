import $ from "jquery"

document.addEventListener("DOMContentLoaded", function() {
  $("#search-input").on("input", function() {
    $.ajax({
      url: "/search/autocomplete",
      data: { query: $(this).val() },
      success: function(data) {
        const suggestions = $("#suggestions");
        console.log(data);
        suggestions.empty();
        if(data.wines) {
          data.wines.forEach((item) => suggestions.append(`<li><a href="/search?query=${item}">Wine: ${item}</a></li>`));
        }
        if(data.cheeses) {
          data.cheeses.forEach((item) => suggestions.append(`<li><a href="/search?query=${item}">Cheese: ${item}</a></li>`));
        }
      }
    });
  });
});
