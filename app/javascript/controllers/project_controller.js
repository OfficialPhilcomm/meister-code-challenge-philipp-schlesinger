import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tasks", "caret"]

  toggleTasks() {
    this.tasksTarget.classList.toggle("hidden")
    this.caretTarget.classList.toggle("rotate-90")
  }
}
