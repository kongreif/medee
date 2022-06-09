import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="increase-download"
export default class extends Controller {
    static targets = ["midiId"];
    static values = { midiID: String, count: Number };
  connect() {
  }

  updateDownload() {
    this.midiIdTarget.innerHTML = Number(this.midiIdTarget.dataset.count) + 1;
    const url =  `/midi/${this.midiIdTarget.dataset.midi}/download_count`;
    fetch(url);
  }
}
