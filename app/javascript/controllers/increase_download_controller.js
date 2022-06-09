import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="increase-download"
export default class extends Controller {
    static targets = ["midiId"];
    static values = { midiID: String };
  connect() {
    console.log("increase_download_controller::CONNECT");
    console.log(this.midiIDValue);
    console.log(this.midiIdTarget.dataset.midi);
    // console.log(this.downloadCounterTarget);
    // this.dl_counter = 0;
  }



  updateDownload() {
    console.log("updateDownload");
    console.log(this.midiIDValue);
    const url =  `/midi/${this.midiIdTarget.dataset.midi}/download_count`;
    console.log(url);
    fetch(url);
    // console.log(typeof this.dl_counter);
    // console.log("updateDownload::clicked");
    // console.log(this.dl_counter);
    // this.dl_counter += 1;
    // console.log(this.dl_counter);
    // // ++this.dl_counter;
    // this.downloadCounterTarget.innerHTML = `${this.dl_counter}`;
    // this.downloadCounterTarget.value = this.dl_counter;
  }
}
