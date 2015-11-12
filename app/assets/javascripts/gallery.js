var ready = function() {
	$(".borrow-button").click(function(e) {
		document.location = "/book/" + $(this).attr('data-id')
		e.preventDefault(); 
		return false;
	});

	$(".bookface").click(function() {
		$(this).toggleClass("more-details");
	});

	$(".bookface").mouseout(function() {
		$(this).removeClass("more-details");
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);

function gallery_initmap() {
  var map = new google.maps.Map($(".gallery-map")[0], $.extend(mapOptions, {
    center: new google.maps.LatLng(galleryOptions.lat, galleryOptions.lng)
  }));

  $.getJSON("/get_around/" + galleryOptions.lat + "," + galleryOptions.lng, function(data) {
    for(var i in data.books) {
      var book = data.books[i];
      var user = data.users[book.user_id - 1];

      if(book.borrower_id == null) {
	(function(user, book) {
	        var marker = new google.maps.Marker({
  		  position: new google.maps.LatLng(parseFloat(user[1]) + (Math.random() - 0.5) * 0.001, parseFloat(user[2]) + (Math.random() - 0.5) * 0.001),
	  	  map: map,
		  title: book.title + " by " + book.author
	        });

	        marker.addListener('click', function() {
	          new google.maps.InfoWindow({ content: book.blurb + "<br /><br /><a href='/book/" + book.id + "'><button class='btn btn-success'>See more?</button></a>" }).open(map, marker);
	        });
	})(user, book);
      }
    }
  });
}

