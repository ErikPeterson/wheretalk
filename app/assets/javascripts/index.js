$(function(){
	var x = 40.783871,
		y = -73.97535599999999;
		window.map = new MapGenerator('#map', { bounds: 'circle', distance: 1, mapType: 'geo', center: { lat: x, lng: y } });


		$('button#geo-init').on('click', function(){
			var distance = $("input[name='distance']").val();

			if(+distance < 0.25 ){
				alert("Please enter a valid distance.")
				return;
			}

			$('#map').addClass("loading");

			return (function(){
				map.settings.bounds='markers'
				map.settings.distance=$("input[name='distance']").val();
				map.settings.tags = (function(){
					return _.chain($("#specialties option")).filter(function(el){ return el.selected; }).map(function(el){return $(el).val()})._wrapped;
				}());

				map.settings.paymentMethods = (function(){
					return _.chain($("#payment-methods option")).filter(function(el){ return el.selected && $(el).val !== ""; }).map(function(el){return $(el).val()})._wrapped;
				}());


				map.placesFromGeo(); 
			}());
		});

		$('button#submit').on('click', function(){
			var address = $("input#address").val(),
				distance = $("input[name='distance']").val();

			if(address.length < 10 || +distance < 0.25 ){
				alert("Please enter a valid address and distance.")
				return;
			}
			$('#map').addClass("loading");
	

			return (function(){
				
				map.settings.bounds='markers';
				map.settings.distance=$("input[name='distance']").val();

				map.settings.tags = (function(){
					return _.chain($("#specialties option")).filter(function(el){ return el.selected; }).map(function(el){return $(el).val()})._wrapped;
				}());

				map.settings.paymentMethods = (function(){
					return _.chain($("#payment-methods option")).filter(function(el){ return el.selected && $(el).val !== ""; }).map(function(el){return $(el).val()})._wrapped;
				}());

				map.placesFromAddress($('input#address').val());
			}());
		});

		$("#specialties").chosen({disable_search_threshold: 10, width: '200px'});
		$("#payment-methods").chosen({disable_search_threshold: 10, width: '200px', allow_single_deselect: true});
});