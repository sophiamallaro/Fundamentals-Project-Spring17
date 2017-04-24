/**
 * Created by jasonryan on 4/19/17.
 */

var ord = {lat: 41.9742, lng: -87.9072};
var sfo = {lat: 37.7749, lng: -122.4194};


var center = {lat: 39.8282, lng: -98.5795};

var ORDmarker, SFOmarker;

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 5,
        center: center
    });

    ORDmarker = new google.maps.Marker({
        map: map,
        position: ord
    });

    SFOmarker = new google.maps.Marker({
        map: map,
        position: sfo
    });

    var flightPlanCoordinates = [
        ord, sfo
    ];

    var flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 5
    });

    flightPath.setMap(map);
}