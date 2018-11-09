require! {
  supercolliderjs: { msg }: sc
}

class Synth
  (@server, @name, @opts) ->
    @server.send.msg msg.synthNew do
      @name
      @id = server.state.nextNodeID()
      msg.AddActions.TAIL
      0
      @opts
      
  set: (opts) -> 
    @server.send.msg msg.nodeSet @id, opts
    @opts <<< opts
    
  free: ->
    @server.send.msg msg.nodeFree @id
    
        
sc.server.boot {
  loadDefs: false
  env:
    SC_JACK_DEFAULT_INPUTS: "system:capture_1,system:capture_2"
    SC_JACK_DEFAULT_OUTPUTS: "system:playback_1,system:playback_2"
  }
  .then (server) ->
    
    server.loadSynthDef do
      'spaceSin',
      './synth.scd'
    .then ->

      x = new Synth server, 'spaceSin', freq: 110
      plop = ->
        newFreq = x.opts.freq * 2
        if newFreq < 500
          setTimeout plop, 1000
          x.set freq: newFreq
        else
          x.free()
          
      setTimeout plop, 1000

      
