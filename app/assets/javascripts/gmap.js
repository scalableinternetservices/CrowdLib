var locatebooks_init = function() {
      document.getElementById("myNumber").stepUp();        
      createMap();
      $("#myNumber").click(function(){
	createMap();
      });
};

function createMap() {
      // Needs to change according to location of user
      //lat,lng come from the db now
      var map;
      $.ajax({ 
                type: "GET", 
                url: '/get_around/'+lat+","+lng+'/'+$("#myNumber").val(),  
                dataType: "script" ,
		statusCode: {
	        200: function(data) {
		      data = JSON.parse(data['responseText']);
      		      var books_information = data["books"];
		var mapOptions = {
                    // How zoomed in you want the map to start at (always required)
                    zoom: 5,
		    center: {"lat":lat,"lng":lng},
                    // How you would like to style the map.
                    // This is where you would paste any style found on Snazzy Maps.
                    styles: [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"landscape","elementType":"all","stylers":[{"visibility":"simplified"},{"hue":"#0066ff"},{"saturation":74},{"lightness":100}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"off"},{"weight":0.6},{"saturation":-85},{"lightness":61}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road.local","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"simplified"},{"color":"#5f94ff"},{"lightness":26},{"gamma":5.86}]}]
                };
		
        // initializing map
	map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
	for (var q = 0; q < books_information.length; q++)
	{
	obj ={}
	obj["lat"] = parseFloat(books_information[q]["lat"]);
	obj["lng"] = parseFloat(books_information[q]["lng"]);
	var all_titles = books_information[q]["title"];
	var marker = new google.maps.Marker({
            position: obj,
            map: map,
	    title: books_information[q]["username"] + " lends " + all_titles
        });
	}
}
}
});      
}
