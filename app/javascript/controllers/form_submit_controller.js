import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submit"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("Hello");
  }

  submit() {
    // console.log(this.element);
    // this.element.submit();
    console.log(this.buttonTarget);
    // this.buttonTarget.submit();
  }
}
