/**
 * Created by jasonryan on 4/19/17.
 */

var atl = {lat: 33.6407, lng: -84.4277};
var ord = {lat: 41.9742, lng: -87.9072};

var center = calcCenter([atl, ord]);

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 6,
        center: center
    });

    var flightPlanCoordinates = [
        atl, ord
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