import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller-characters"
export default class extends Controller {
  static targets = ["textarea", "count"]

  connect() {
    this.update();
  }

  update() {
    const maxLength = this.textareaTarget.getAttribute('maxlength');
    const currentLength = this.textareaTarget.value.length;
    const remaining = maxLength - currentLength;
    this.countTarget.textContent = `${remaining} characters remaining`;
  }
}
