// IMPORT SECRET GOOGLE MAPS KEY
var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 37.784988, lng: -122.400979}, //yerba buena gardens
    zoom: 15
  });
}

////////////
// marker //
////////////

function addMarker() {
  //want to get icon of pokeball as placeholder, then use images for each pokemon
  var myImageURL = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
  var image = myImageURL;


//NEED TO USE STRING REPLACEMENT FOR LONGITUDE AND LATITURE HERE

  var encounter1 = new google.maps.LatLng(37.784988, -122.400979)
  var marker1 = new google.maps.Marker({
      position: encounter1,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  var encounter2 = new google.maps.LatLng(37.784988, -122.400979)
  var marker2 = new google.maps.Marker({
      position: encounter2,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  var encounter3 = new google.maps.LatLng(37.784988, -122.400979)
  var marker3 = new google.maps.Marker({
      position: encounter3,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  var encounter4 = new google.maps.LatLng(37.784988, -122.400979)
  var marker4 = new google.maps.Marker({
      position: encounter4,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  var encounter5 = new google.maps.LatLng(37.784988, -122.400979)
  var marker5 = new google.maps.Marker({
      position: encounter5,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  var encounter6 = new google.maps.LatLng(37.784988, -122.400979)
  var marker6 = new google.maps.Marker({
      position: encounter6,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  var encounter7 = new google.maps.LatLng(37.784988, -122.400979)
  var marker7 = new google.maps.Marker({
      position: encounter7,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  var encounter8 = new google.maps.LatLng(37.784988, -122.400979)
  var marker8 = new google.maps.Marker({
      position: encounter8,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  var encounter9 = new google.maps.LatLng(37.784988, -122.400979)
  var marker9 = new google.maps.Marker({
      position: encounter9,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  var encounter10 = new google.maps.LatLng(37.784988, -122.400979)
  var marker10 = new google.maps.Marker({
      position: encounter10,
      map: map,
      title: 'POKEMON #13',
      icon: image
  });

  return marker1, marker2, marker3, marker4, marker5, marker6, marker7, marker8, marker9, marker10;

}

// var marker = addMarker();
//addMarker();


//////////////////////


////////////////
// directions //
////////////////

function displayDirections() {

  var startPoint = {lat: {{ latitude }}, lng: {{ longitude }} }
  var endPoint = {lat: {{ latitude }}, lng: {{ longitude }} }

  // GYM - var location1 = {lat: {{ latitude }}, lng: {{ longitude }} }
  var location2 = {lat: {{ latitude }}, lng: {{ longitude }} }
  var location3 = {lat: {{ latitude }}, lng: {{ longitude }} }
  var location4 = {lat: {{ latitude }}, lng: {{ longitude }} }
  var location5 = {lat: {{ latitude }}, lng: {{ longitude }} }
  var location6 = {lat: {{ latitude }}, lng: {{ longitude }} }
  var location7 = {lat: {{ latitude }}, lng: {{ longitude }} }
  var location8 = {lat: {{ latitude }}, lng: {{ longitude }} }
  var location9 = {lat: {{ latitude }}, lng: {{ longitude }} }
  var location10 = {lat: {{ latitude }}, lng: {{ longitude }} }

  // var sydney = {lat: -33.8675, lng: 151.2070}
  // var bathurst = {lat: -33.4177, lng: 149.5810}
  // var canberra = {lat: -35.2820, lng: 149.1287}

  // GYM - var location1Waypoint = {
  //   location: location1,
  //   stopover: true
  // }
  var location2Waypoint = {
    location: location1,
    stopover: true
  }
  var location3Waypoint = {
    location: location1,
    stopover: true
  }
  var location4Waypoint = {
    location: location1,
    stopover: true
  }
  var location5Waypoint = {
    location: location1,
    stopover: true
  }
  var location6Waypoint = {
    location: location1,
    stopover: true
  }
  var location7Waypoint = {
    location: location1,
    stopover: true
  }
  var location8Waypoint = {
    location: location1,
    stopover: true
  }
  var location9Waypoint = {
    location: location1,
    stopover: true
  }
  var location10Waypoint = {
    location: location1,
    stopover: true
  }


  var routeOptions = {
      origin: startPoint,
      destination: endPoint,
      waypoints: [location1Waypoint, location2Waypoint, location3Waypoint, location4Waypoint,
        location5Waypoint, location6Waypoint, location7Waypoint, location8Waypoint, location9Waypoint, location10Waypoint],
      travelMode: google.maps.TravelMode.WALKING
    }


  var directionsService = new google.maps.DirectionsService;
  directionsService.route(routeOptions, function(response, status) {
      if (status === google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      } else {
        window.alert('Directions request failed due to ' + status);
      }
    });

  var directionsDisplay = new google.maps.DirectionsRenderer;
  directionsDisplay.setMap(map);
}

// displayDirections();


//////////


////////////
// styles //
////////////

function addStyles() {

  var styles = [
  {
      "featureType": "water",
      "stylers": [
        { "color": "#2529da" }
      ]
    }
  ];

  var styledMapOptions = {
      name: 'Custom Style'
  };

  var customMapType = new google.maps.StyledMapType(
          styles,
          styledMapOptions);

  map.mapTypes.set('map_style', customMapType);
  map.setMapTypeId('map_style');

}

// addStyles();




///////////////


/////////////////
// info window //
/////////////////

function addInfoWindow() {

  var contentString = '<div id="content">' +
    '<h1>All my custom content</h1>' +
    '</div>';

  var infoWindow = new google.maps.InfoWindow({
    content: contentString,
    maxWidth: 200
  });

  marker.addListener('click', function() {
    infoWindow.open(map, marker);
  });
}

// addInfoWindow()



