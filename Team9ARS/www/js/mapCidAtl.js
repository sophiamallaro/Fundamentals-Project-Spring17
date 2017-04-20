/**
 * Created by jasonryan on 4/19/17.
 */

var cid = {lat: 41.8864, lng: -91.70697};
var atl = {lat: 33.6407, lng: -84.4277};

var center = calcCenter([cid,atl]);

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 6,
        center: center
    });

    var flightPlanCoordinates = [
        cid, atl
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