import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="openai"
export default class extends Controller {
  connect() {
    console.log ("OpenAI form connected")
  }

  submitForm(event) {
    event.preventDefault()
    console.log ("Form submitted")
    let url = "/openai/openai_request"
    console.log(event.target[1].value)
    fetch (url, {
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
      console.log(data)
    })
    console.log (this.event)
  }
  displayResult(data) {
    // Update the openai_response element with the response data
    document.getElementById('openai_response').innerHTML = data.openai;
  }
  handleError(error) {
    // Handle any errors that occur during the form submission
    console.error("Error submitting form: ", error)
  }
}
