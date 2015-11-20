var book_initmap = function() {
 var map = new google.maps.Map($(".minimap")[0], $.extend(mapOptions, {
    center: current_user_lat_lng,
  }));

  var marker = new google.maps.Marker({
    position: current_user_lat_lng,
    map: map,
    title: "Move to update address",
    draggable: true
  });
  
  var coder = new google.maps.Geocoder;

  google.maps.event.addListener(marker, "dragend", function(event) {
    var lat = event.latLng.lat();
    var lng = event.latLng.lng();
    coder.geocode({ 'location': { lat: lat, lng: lng } }, function(results, status) {
      if(status == "OK") {
        if(results.length > 0)
          $("#address").val(results[0].formatted_address);
      }
    });
  });

  function runGeocoding(address) {
    coder.geocode({ 'address': address }, function(results, stats) {
      if(results.length > 0) {
        var best = results[0];
        marker.setPosition(best.geometry.location);
      }
    });
  }
}
