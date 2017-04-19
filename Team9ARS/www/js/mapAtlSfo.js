/**
 * Created by jasonryan on 4/19/17.
 */

var atl = {lat: 33.6407, lng: -84.4277};
var sfo = {lat: 37.7749, lng: -122.4194};

var center = {lat: 39.8282, lng: -98.5795};

var SFOmarker, ATLmarker;

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 5,
        center: center
    });

    ATLmarker = new google.maps.Marker({
        map: map,
        position: atl
    });

    SFOmarker = new google.maps.Marker({
        map: map,
        position: sfo
    });

    var flightPlanCoordinates = [
        atl, sfo
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