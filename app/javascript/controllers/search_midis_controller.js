import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-midis"
export default class extends Controller {
  static targets = ["searchform", "searchinput", "midilist"]

  connect() {
    // console.log(this.searchformTarget)
    // console.log(this.searchinputTarget)
    // console.log(this.midilistTarget)
    this.oldLocation = window.location.href
    this.pathName = window.location.pathname
  }

  update() {
    // console.log("TODO: send request in AJAX")
    // console.log(`OLD: ${this.oldLocation}`)
    let url = `${this.searchformTarget.action}?query=${this.searchinputTarget.value}`
    if(this.oldLocation.match(/\?/)){
      url = `${this.oldLocation}&query=${this.searchinputTarget.value}`
    } else {
      url = `${this.oldLocation}?query=${this.searchinputTarget.value}`
    }
    // console.log(url)
    fetch(`${url}`, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.midilistTarget.outerHTML = data
        // console.log(data)
      })
    if(this.searchinputTarget.value == ""){
      console.log(`${this.oldLocation}`)
      fetch(`${this.oldLocation}`, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.midilistTarget.outerHTML = data
        // console.log(data)
      })
    }
  }
}
