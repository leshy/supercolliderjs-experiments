require! {
  supercolliderjs: { msg }: sc
}

sc.server.boot {
  loadDefs: false
  env:
    SC_JACK_DEFAULT_INPUTS: "system:capture_1,system:capture_2"
    SC_JACK_DEFAULT_OUTPUTS: "system:playback_1,system:playback_2"
  }
  .then (server) ->
    
    server.loadSynthDef do
      'roboPiano',
      './synth.scd'
    .then -> 
      server.send.msg msg.synthNew 'roboPiano', -1, msg.AddActions.TAIL, 0, freq: 2200
