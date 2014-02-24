$(function() {
  "use strict";
  Map.defaultLat = 39.5500;
  Map.defaultLong = -107.3167;
  Map.defaultZoom = 9;

  Map.plotGauges = function(geojson) {
    L.mapbox.map('map', 'srtsrt32.haldb884')
      .setView([Map.defaultLat, Map.defaultLong], Map.defaultZoom)
      .featureLayer.setGeoJSON(geojson);
  };

  Map.fetchGauges = function(callback) {
    var run_ids = $('#map').data('run_ids')
    $.ajax({
      type: 'GET',
      dataType: 'json',
      url: '/api/v1/gauges' + '?=' + run_ids,
      success: callback
    });
  };

  Map.fetchGauges(Map.plotGauges);
});
