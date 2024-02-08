import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="openai"
export default class extends Controller {
  connect() {
    console.log("OpenAI form connected")
  }

  submitForm(event) {
    event.preventDefault();
    console.log("Form submitted");
    this.postData("/openai/openai_request", {prompt: event.target[1].value})
      .then(data => this.displayResult(data))
      .catch(error => this.handleError(error));
  }

  postData(url = ``, data = {}) {
    return fetch(url, {
      method: 'POST',
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(data),
    })
    .then(response => response.json());
  }

  displayResult(data) {
    document.getElementById("openai_response").innerHTML = data.response;
  }

  handleError(error) {
    console.error("Error submitting form: ", error)
  }
}
