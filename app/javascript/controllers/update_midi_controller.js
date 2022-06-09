import { Controller } from "@hotwired/stimulus"
import { Midi } from '@tonejs/midi'

// Connects to data-controller="convert-midi-to-json"
export default class extends Controller {

  static targets = ["input", "result"]

  connect() {
    console.log("connect convert midi to json")
  }

  async toJson() {
    await this.getBase64(this.inputTarget.files[0], this.resultTarget)
  }

  getBase64 = async (file, target) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = async function () {
      const midi = await Midi.fromUrl(reader.result)
      target.value = JSON.stringify(midi)
    };
 }

}
