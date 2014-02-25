$(function() {
  "use strict";
  Map.defaultLat = 39.5500;
  Map.defaultLong = -107.3167;
  Map.defaultZoom = 9;

  Map.plotGauges = function(geojson) {
    var map = L.mapbox.map('map', 'srtsrt32.haldb884', {zoomControl: false})
      .setView([Map.defaultLat, Map.defaultLong], Map.defaultZoom);
      new L.Control.Zoom({position: 'topright'}).addTo(map);
      map.featureLayer.setGeoJSON(geojson);
  };


  Map.fetchGauges = function(callback) {
    var run_ids = $('#map').data('run_ids')
    var gauges = $('#map').data('gauges')
    Map.plotGauges(gauges);
  };

  Map.fetchGauges(Map.plotGauges);
});
