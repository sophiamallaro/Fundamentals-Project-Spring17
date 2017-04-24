/**
 * Created by jasonryan on 4/19/17.
 */

var cid = {lat: 41.8864, lng: -91.70697};
var ord = {lat: 41.9742, lng: -87.9072};

var center = calcCenter([cid, ord]);
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 8,
        center: center
    });

    var flightPlanCoordinates = [
        cid, ord
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