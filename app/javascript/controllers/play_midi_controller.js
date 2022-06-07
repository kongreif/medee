import { Controller } from "@hotwired/stimulus"
import * as Tone from 'tone'
import { Midi } from '@tonejs/midi'

// Connects to data-controller="play-midi"
export default class extends Controller {

  static values = {url: String, json: Object}
  static targets = [ "playButton", "pauseButton" ]

  connect() {
  }

  async playOnClick() {
    console.log("playOnClick() TOP LINE")
    // console.log("playButtonTarget.innerHTML:============");
    // console.log(this.playButtonTarget.innerHTML);
    // this.playMidiFile();

    this.playButtonTarget.classList.toggle("hide");
    this.pauseButtonTarget.classList.toggle("hide");

    await Tone.start();
    // const synth = new Tone.Synth().toDestination();
    // synth.triggerAttackRelease("C4", "8n");
    var bool = this.playButtonTarget.classList.value == "hide"
    console.log(bool)
    if (this.playButtonTarget.classList.value == "hide") {
      // music must play here
      console.log("PLAY MUSIC");
      this.playMidiFile();
    }
    else if (!this.playButtonTarget.classList.value == "hide") {
      //music must pause here
      console.log("PAUSE MUSIC");

    }

    // const dist = new Tone.Distortion(0.8).toDestination();
    // const fm = new Tone.FMSynth().connect(dist);
    // fm.triggerAttackRelease("C4", "1n");
  }

  playMidiFile = async () => {
    const context = new Tone.Context()
    Tone.setContext(context)
    // load a midi file in the browser
    // const midi = await Midi.fromUrl(this.urlValue)
    const midi = this.jsonValue
    //the file name decoded from the first track
    // const name = midi.name
    //get the tracks
    midi.tracks.forEach(track => {
      //tracks have notes and controlChanges

      //notes are an array
      const notes = track.notes
      notes.forEach(note => {
        //note.midi, note.time, note.duration, note.nameg
        // console.log(note)
        const synth = new Tone.Synth().toDestination();
        synth.triggerAttackRelease(note.name, note.duration, note.time, note.velocity);
      })

      //the control changes are an object
      //the keys are the CC number
      // track.controlChanges[64]
      // //they are also aliased to the CC number's common name (if it has one)
      // track.controlChanges.sustain.forEach(cc => {
      //   // cc.ticks, cc.value, cc.time
      // })

      //the track also has a channel and instrument
      //track.instrument.name
    })
  }
}
