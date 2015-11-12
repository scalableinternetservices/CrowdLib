var book_initmap = function() {
  var map = new google.maps.Map($(".book-map")[0], $.extend(mapOptions, {
    center: new google.maps.LatLng(bookOptions.lat, bookOptions.lng)
  }));

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(bookOptions.lat, bookOptions.lng),
    map: map,
    title: bookOptions.title + " by " + bookOptions.author,
    draggable: false
  });
}

$(function() {
  $("#borrow").click(function() {
    console.log("BORROW CLICK?");
    $.post('/book/borrow/' + bookOptions.id, function(data) {
      console.log(data);
      if(data == "OK")
        $("#borrow-parent").html("<div class='alert alert-success'>Your book is on your way!</div>");
      else
        $("#borrow-parent").html("<div class='alert alert-danger'>Snap, someone was faster!</div>");
      location.reload();
    }).always(function(data) {
      if(data.responseText == "OK")
        $("#borrow-parent").html("<div class='alert alert-success'>Your book is on your way!</div>");
      else
        $("#borrow-parent").html("<div class='alert alert-danger'>Snap, someone was faster!</div>");
    });
  });
});
