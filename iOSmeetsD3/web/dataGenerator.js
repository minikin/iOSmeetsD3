var DATAG_MOD = (function(){
  var labels = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"];

  return {
    newDataSet : function() {
      var labelSet = labels,
      dataSet = [];

      for (var i = 0; i < labelSet.length; i++) {
        var entry = { "label" : labelSet[i], "value" : Math.floor(Math.random() * 100) };
        dataSet.push(entry);
      }

      return dataSet;
    }
  };
});
