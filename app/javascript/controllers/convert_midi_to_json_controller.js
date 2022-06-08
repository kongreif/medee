import { Controller } from "@hotwired/stimulus"
import { Midi } from '@tonejs/midi'

// Connects to data-controller="convert-midi-to-json"
export default class extends Controller {

  static targets = ["input", "result", "chart"]

  connect() {
    // console.log("connect convert midi to json")
    // console.log(this.chartTarget);
  }

  async toJson() {
    await this.getBase64(this.inputTarget.files[0], this.resultTarget, this.chartTarget);
  }

  getBase64 = async (file, target, target2) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = async function () {
      const midi = await Midi.fromUrl(reader.result);
      target.value = JSON.stringify(midi);
      // console.log(target.value);
      // basic parsing of json
      // takes notes and creates an array of arrays([midikey, timestamp], [midikey, timestamp], ...)
      const json_parsed = JSON.parse(target.value);
      var chart_data = [];
      const arr_notes = json_parsed["tracks"][0]["notes"];
      arr_notes.forEach( (note) => {
        chart_data.push( [ note["time"], note["midi"] ] );
      })
      // console.log(chart_data);
      target2.value = JSON.stringify(chart_data);
    };
  }
}

// var pre_chart_data = [];
// const arr_notes = json_parsed["tracks"][0]["notes"];
// arr_notes.forEach( (note) => {
  //   pre_chart_data.push( note["time"] );
  //   pre_chart_data.push( note["midi"] );
  // })


  // console.log(pre_chart_data);
  // target2.value = pre_chart_data;
  // console.log(target2.value);
