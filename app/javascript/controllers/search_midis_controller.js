import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-midis"
export default class extends Controller {
  static targets = ["searchform", "searchinput", "midilist"]

  connect() {
    // console.log(this.searchformTarget)
    // console.log(this.searchinputTarget)
    // console.log(this.midilistTarget)
    this.oldLocation = window.location.href
  }

  update() {
    // console.log("TODO: send request in AJAX")
    const url = `${this.searchformTarget.action}?query=${this.searchinputTarget.value}`
    console.log(this.searchinputTarget.value)
    if(this.searchinputTarget.value == ""){
      console.log(`${this.oldLocation}&query=${this.searchinputTarget.value}`)
      fetch(`${this.oldLocation}&query=${this.searchinputTarget.value}`, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.midilistTarget.outerHTML = data
        // console.log(data)
    })
    } else{
      fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.midilistTarget.outerHTML = data
        // console.log(data)
      })
    }
  }
}


// midis/query=
