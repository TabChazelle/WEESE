import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="openai"
export default class extends Controller {
  connect() {
    console.log ("OpenAI form connected")
  }

  submitForm(event) {
    event.preventDefault();
    console.log("Form submitted");
    let url = "/openai/openai_request";
    fetch(url, {
      method: 'POST',
      headers: {
        "X-CSRF-Token": document.getElementsByName('csrf-token')[0].content,
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({prompt: event.target[1].value}),
    })
    .then(response => response.json())
    .then(data => {
      this.displayResult(data); // Update to call displayResult properly
    })
    .catch(error => console.error('Error:', error)); // Handle errors
  }

  displayResult(data) {
    // Find the element by its ID and set its innerHTML to the fetched response
    document.getElementById("openai_response").innerHTML = data.response;
  }

  handleError(error) {
    // Handle any errors that occur during the form submission
    console.error("Error submitting form: ", error)
  }
}
