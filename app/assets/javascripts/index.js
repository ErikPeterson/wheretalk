$(function(){
	var x = 40.783871,
		y = -73.97535599999999;

		window.map = new MapGenerator('#map', { bounds: 'circle', distance: 1, mapType: 'geo', center: { lat: x, lng: y } },[{ lat: x, lng: y}]);

		$('button#geo-init').on('click', function(){
			map.settings.bounds='markers'
			map.settings.distance=$("input[name='distance']").val();
			map.settings.tags = (function(){
				return _.chain($("option")).filter(function(el){ return el.selected; }).map(function(el){return $(el).val()})._wrapped;
			}());

			map.placesFromGeo();
		});

		$('button#submit').on('click', function(){
			map.settings.bounds='markers'
			map.settings.distance=$("input[name='distance']").val();
			
			map.settings.tags = (function(){
				return _.chain($("option")).filter(function(el){ return el.selected; }).map(function(el){return $(el).val()})._wrapped;
			}());

			map.placesFromAddress($('input#address').val());
		});

		$("select").chosen({disable_search_threshold: 10, width: '250px'});
});