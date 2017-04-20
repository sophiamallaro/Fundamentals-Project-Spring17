/**
 * Created by jasonryan on 4/19/17.
 */

var atl = {lat: 33.6407, lng: -84.4277};
var sfo = {lat: 37.61522, lng: -122.38998};

var center = calcCenter([atl, sfo]);

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 5,
        center: center
    });

    var flightPlanCoordinates = [
        atl, sfo
    ];

    addMkrs(flightPlanCoordinates, map);

    var flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 5
    });

    flightPath.setMap(map);
}