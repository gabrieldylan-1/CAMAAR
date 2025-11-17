import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name"]

  connect() {
    if (this.hasNameTarget) {
      this.nameTarget.textContent = this.nameTarget.textContent || "CAMAAR"
    }
  }
}
