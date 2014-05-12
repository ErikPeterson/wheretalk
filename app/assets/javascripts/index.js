$(function(){
	var x = 40.783871,
		y = -73.97535599999999;

		window.map = new MapGenerator('#map', { bounds: 'circle', distance: 1, mapType: 'geo', center: { lat: x, lng: y } },[{ lat: x, lng: y}]);

		$('button#geo-init').on('click', function(){
			map.__geoInit();
		});

		$('button#submit').on('click', function(){
			map.settings.bounds='markers'
			map.placesFromAddress($('input#address').val());
		});
});