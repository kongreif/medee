import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="increase-download"
export default class extends Controller {
    static targets = ["midiId"];
    static values = { midiID: String, count: Number };
  connect() {
    console.log("increase_download_controller::CONNECT");
    // console.log(this.midiIDValue);
    // console.log(this.midiIdTarget.dataset.midi);
    // console.log(this.downloadCounterTarget);
    // this.dl_counter = 0;
  }



  updateDownload() {
    console.log("updateDownload");
    console.log("this.midiIdTarget");
    console.log(this.midiIdTarget);
    console.log("this.midiIdTarget.dataset.count");
    console.log(this.midiIdTarget.dataset.count);
    console.log("this.midiIdTarget.dataset.count PLUS 1");
    console.log(Number(this.midiIdTarget.dataset.count) + 1);
    this.midiIdTarget.innerHTML = Number(this.midiIdTarget.dataset.count) + 1

    console.log("this.midiIdTarget.dataset.midi");
    console.log(this.midiIdTarget.dataset.midi);
    console.log("this.midiIdTarget.innerHTML");
    console.log(this.midiIdTarget.innerHTML);

    console.log();
    // this.midiIdTarget.innerHTML = this.midiIdTarget.dataset.count + 1;

    const url =  `/midi/${this.midiIdTarget.dataset.midi}/download_count`;
    // browser: /midi/1/download_count rails routes: /midi/:id/download_count
    // console.log(url);
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
