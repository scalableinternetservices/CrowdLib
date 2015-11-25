var profile_initmap = function() {
  var map = new google.maps.Map($(".minimap")[0], $.extend(mapOptions, {
    center: current_user_lat_lng,
  }));
console.log(current_user_lat_lng);
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
	  $("#lat").val(results[0].geometry.location.lat());
        $("#lng").val(results[1].geometry.location.lng());
      }
    });
  });
  if(! $("#address").is(":visible"))
        runGeocoding($("#address").val());
  var pauseGeocoderEntry = false;
  var someoneWantedSomething = false;

  function runGeocoding(address) {
    coder.geocode({ 'address': address }, function(results, stats) {
      if(results.length > 0) {
        var best = results[0];
        marker.setPosition(best.geometry.location);
	$("#lat").val(best.geometry.location.lat());
        $("#lng").val(best.geometry.location.lng());
      }
    });
  }
  

  $("#address").keydown(function(e) {
    someonWantedSomething = true;
    if(pauseGeocoderEntry) return;
 
    pauseGeocoderEntry = true;
    setTimeout(function() {
      pauseGeocoderEntry = false;
      if(someoneWantedSomething) {
        runGeocoding($("#address").val());
      }
      someoneWantedSomething = false;
    }, 500);
    
    runGeocoding($(this).val());
  });
}

