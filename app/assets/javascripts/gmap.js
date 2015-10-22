$(window).load(function() {
  loadScript();
});

var map;

function initialize() {

      document.getElementById("myNumber").stepUp();        
      // geocoding 
      var geocoding  = new google.maps.Geocoder();
      $("#submit_button_geocoding").click(function(){
        codeAddress(geocoding);
      });
      $("#submit_button_reverse").click(function(){
        codeLatLng(geocoding);
      });
      createMap();
      $("#myNumber").click(function(){
	createMap();
      });
}

function createMap() {
      // Needs to change according to location of user
      var lat = 34.5;
      var lng = -119.54;
      $.ajax({ 
                type: "GET", 
                url: '/api/v1/locations/around/'+lat+","+lng+'/within/'+$("#myNumber").val(),  
                dataType: "script" ,
		success: function(data) {
      		      var lat_lng_pos = data.split("]");
		      var lat_avg = 0;
		      var lng_avg = 0;
		      var j = 0;
		      var latitude =  [];
		      var longitude = [];
		 // Tweaks needed because data returned isnt json
		      for(var i = 0; i < lat_lng_pos.length; i++)
		      {
		        var lat_lng = lat_lng_pos[i].split(",");	
			var lat = isNaN(parseFloat(lat_lng[1])) ? parseFloat(lat_lng[2]) : parseFloat(lat_lng[1]);
			var lng = isNaN(parseFloat(lat_lng[1])) ? parseFloat(lat_lng[3]) : parseFloat(lat_lng[2]);
			if(!isNaN(lat) && !isNaN(lng))
			{
			lat_avg += lat;
			lng_avg += lng;
			latitude[j] = lat;
			longitude[j] = lng;
			j++;
			}
		      }
	       var mapOptions = {
		  zoom: 10,
		  center: new google.maps.LatLng(lat_avg/j, lng_avg/j),
		  mapTypeId: google.maps.MapTypeId.ROADMAP,
		  panControl: true,
		  scaleControl: false,
		  streetViewControl: true,
		  overviewMapControl: true
		};
        // initializing map
	map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
	for (var q = 0; q < j; q++)
	{
	var marker = new google.maps.Marker({
            position: new google.maps.LatLng(latitude[q], longitude[q]),
            map: map,
	    /*icon: 'book.png'*/
        });
	}
}
});      
}

var info;
function codeLatLng(geocoding){

  var input = $('#search_box_reverse').val();
  console.log(input);
  
  var latlngbounds = new google.maps.LatLngBounds();
  var listener;
  var regex = /([1-9])+\.([1-9])+\,([1-9])+\.([1-9])+/g;
  if(regex.test(input)) {
  var latLngStr = input.split(",",2);
  var lat = parseFloat(latLngStr[0]);
  var lng = parseFloat(latLngStr[1]);
  var latLng = new google.maps.LatLng(lat, lng);
  geocoding.geocode({'latLng': latLng}, function(results, status) {
     if (status == google.maps.GeocoderStatus.OK){
       if(results.length > 0){
         //map.setZoom(11);
         var marker;
         map.setCenter(results[1].geometry.location);
         var i;
        info = createInfoWindow("");
         for(i in results){
           latlngbounds.extend(results[i].geometry.location);
             marker = new google.maps.Marker({
             map: map,
             position: results[i].geometry.location
           });
          
          google.maps.event.addListener(marker, 'click', (function(marker,i) {
            return function() {
            info.setContent(results[i].formatted_address);
            info.open(map,marker);
            }
          })(marker,i));
        }

         map.fitBounds(latlngbounds);
         listener = google.maps.event.addListener(map, "idle", function() {
          if (map.getZoom() > 16) map.setZoom(16);
            google.maps.event.removeListener(listener);
          });
       }
     }
    else{
       alert("Geocoder failed due to: " + status);
     }  
  });
  }else{
    alert("Wrong lat,lng format!");
  }
}
function codeAddress(geocoding){
  var address = $("#search_box_geocoding").val();
  if(address.length > 0){
    geocoding.geocode({'address': address},function(results, status){
      if(status == google.maps.GeocoderStatus.OK){
        map.setCenter(results[0].geometry.location);
        var marker  =  new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
        }else{
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }else{
    alert("Search field can't be blank");
  }
}

function loadScript() {
	console.log("map loading ...");
  var script = document.createElement('script');
  script.type = 'text/javascript';
  //'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBJYFdplGeKUUEmGZ-vL4ydiSZ09Khsa_o&sensor=false&libraries=drawing'
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    //'&v=3.14'+
    //'&key=AIzaSyBJYFdplGeKUUEmGZ-vL4ydiSZ09Khsa_o'+
    '&libraries=drawing'+
    '&callback=initialize';
  document.body.appendChild(script);
}
