import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "template", 
                     "formContainer",
                     "addedTemplate",
                     "childElement",
                     "numTickets"
                    ]     // this.-----Target
  static values = { formCount: { type: Number, default: 1} }

  connect() {
    const numTickets = this.numTicketsTarget.textContent.trim().charAt(0);
    for (let i = 1; i < numTickets; i++) {
      this.addOnePassenger();
    }
  }

  addOnePassenger() {
    if (this.formCountValue >= 4) return

    this.formCountValue++
    let clone = this.templateTarget.content.firstElementChild.cloneNode(true)
    clone.querySelector("#passenger-title").textContent = `Passenger #${this.formCountValue}`

    // formContainer is the form
    // childElementTarget is "Add Passenger" button
    // childElementTarget is a child of formContainer
    // Pressing "Add Passenger" button will add template form on top of itself
    this.formContainerTarget.insertBefore(clone, this.childElementTarget)
    this.updateNumTickets()
  }

  removeOnePassenger() {
    if (this.formCountValue <= 1) return

    this.formCountValue--
    const forms = this.addedTemplateTargets
    const lastItem = forms[forms.length-1]
    this.formContainerTarget.removeChild(lastItem)
    this.updateNumTickets()
  }

  updateNumTickets() {
    this.numTicketsTarget.textContent = this.formCountValue
  }
}
