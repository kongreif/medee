import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-tabs"
export default class extends Controller {
  connect() {
    console.log("profile tabs yo");
  }

  static targets = [ "uploadedtab", "likedtab", "likedmidis", "uploadedmidis"];

  uploaded() {
    this.uploadedtabTarget.className += " active";
    // this.likedtabTarget.className -= " active";
    this.likedtabTarget.className = this.likedtabTarget.className.replace(/(?:^|\s)active(?!\S)/g, '')
    this.likedmidisTarget.className += " hide";
    this.uploadedmidisTarget.className = this.uploadedmidisTarget.className.replace(/(?:^|\s)hide(?!\S)/g, '')
  }

  liked() {
    this.likedtabTarget.className += " active";
    this.uploadedtabTarget.className = this.uploadedtabTarget.className.replace(/(?:^|\s)active(?!\S)/g, '')
    this.uploadedmidisTarget.className += " hide";
    this.likedmidisTarget.className = this.likedmidisTarget.className.replace(/(?:^|\s)hide(?!\S)/g, '')
  }

}
