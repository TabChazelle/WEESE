import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autocomplete"
export default class extends Controller {
  connect() {
  }
  query(event) {
    const query = event.target.value;
    fetch(`/search/autocomplete?query=${query}`)
      .then(response => response.json())
      .then(data => {
        const suggestions = document.getElementById("suggestions");
        suggestions.innerHTML = "";
        if(data.wines) {
          data.wines.forEach((item) => suggestions.innerHTML += `<li><a href="/search?query=${item}">Wine: ${item}</a></li>`);
        }
        if(data.cheeses) {
          data.cheeses.forEach((item) => suggestions.innerHTML += `<li><a href="/search?query=${item}">Cheese: ${item}</a></li>`);
        }
      });
  }
}
