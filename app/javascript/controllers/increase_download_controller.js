import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="increase-download"
export default class extends Controller {
  static targets = ["downloadCounter", "midiDownloadCounter"];
  connect() {
    console.log("increase_download_controller::CONNECT");
    // console.log(this.downloadCounterTarget);
    // this.dl_counter = 0;
  }

  updateDownload() {
    console.log(this.midiDownloadCounterTarget);
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
