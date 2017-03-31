/**
 * Created by jasonryan on 3/24/17.
 */

var map;
var flightPath;
var atl = {lat: 33.6407, lng: -84.4277};
var cid = {lat: 41.8864, lng: -91.70697};
var jfk = {lat: 40.6413, lng: -73.7781};
var ord = {lat: 41.9742, lng: -87.9072};
var sfo = {lat: 37.7749, lng: -122.4194};

var airports = {'atl':atl, 'cid':cid, 'jfk':jfk, 'ord':ord, 'sfo':sfo};
//var flightPlanCoordinates = [airports['cid'], airports['ord'], airports['jfk']];
var flightPlanCoordinates = generateFilghtPlan([airports['cid'], airports['ord'], airports
['jfk']]);
var center = calcCenter(flightPlanCoordinates);

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: center,
        zoom: 5
    });

    flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 0.8,
        strokeWeight: 4
    });

    addMkrs(flightPlanCoordinates, ['1', '2', '3'], map);

    flightPath.setMap(map);
}

//Generates flight plan
function generateFilghtPlan(locations) {
    var index, len;
    var flightPlanCoordinates = [];
    for(index = 0, len = locations.length; index < len; ++index) {
        flightPlanCoordinates.push(locations[index]);
    }
    return flightPlanCoordinates;
}

// Function adds Marker to map with label
function addMkrs(locations, names, map) {
    var mkr;
    var index, len;
    for(index = 0, len = locations.length; index < len; ++index) {
        mkr = new google.maps.Marker({
            position: locations[index],
            label: names[index],
            map: map
        });
    }
}

// Function calculates mid point between airports in array
function calcCenter(mkrs) {
    var index, len;
    var latSum = 0;
    var lngSum = 0;
    for(index = 0, len = mkrs.length; index < len; ++index) {
        latSum += mkrs[index]['lat'];
        lngSum += mkrs[index]['lng'];
    }
    var latMid = latSum/mkrs.length;
    var lngMid = lngSum/mkrs.length;
    return {lat: latMid, lng: lngMid};
}
