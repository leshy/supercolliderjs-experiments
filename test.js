var sc = require('supercolliderjs');

sc.lang.boot().then(function(sclang) {

  sclang.interpret('(1..8).pyramid')
    .then(function(result) {
      // result is a native javascript array
      console.log('= ' + result);
    }, function(error) {
      // syntax or runtime errors
      // are returned as javascript objects
      console.error(error);
    });

}, function(error) {
  console.error(error)
  // sclang failed to startup:
  // - executable may be missing
  // - class library may have failed with compile errors
});
