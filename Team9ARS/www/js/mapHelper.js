/**
 * Created by jasonryan on 4/20/17.
 */



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

// Function adds Marker to map with label
function addMkrs(locations, map) {
    var mkr, index;
    for(index = 0; index < locations.length; ++index) {
        mkr = new google.maps.Marker({
            position: locations[index],
            map: map
        });
    }
}