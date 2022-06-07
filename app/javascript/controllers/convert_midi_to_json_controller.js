import { Controller } from "@hotwired/stimulus"
import { Midi } from '@tonejs/midi'

// Connects to data-controller="convert-midi-to-json"
export default class extends Controller {

  static targets = ["input", "result"]

  connect() {
    // console.log("connect convert midi to json")
  }

  async toJson() {
    await this.getBase64(this.inputTarget.files[0], this.resultTarget)
    // console.log(`toJson::${this.inputTarget.files[0]}`)
    await this.getChartData(this.resultTarget, this.chartDataResultTarget) // TODO check parameters
  }

  getChartData = async (file, target) => {
    console.log("getChartData::");
    console.log(file);
    // const json = JSON.parse(file);
    // console.log(json);
    // var chart_data = [];
    // const arr_notes = json["tracks"][0]["notes"];
    // for ( let i = 0; i < arr_notes.length(); i++ )
    // {
    //   var tmp_arr = [ arr_notes[i]["time"], arr_notes[i]["midi"] ];
    //   chart_data.push(tmp_arr);
    // }
    // target.value = chart_data
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
