(function($, window, document, undefined){
	'use strict'

	var MapGenerator = function(el, options, markers){ 
		this.initialize(el, options, markers)
	};

	MapGenerator.prototype.initialize = function(el, options, markers){
		this.defaults = {
			mapType: 'profile',
			center: {
				lat: -40,
				lng: 70
			},
			bounds: 'circle',
			distance: 0.25
		};
		this.markers = markers || [];
		this.$el = $(el);
		this.$container = this.$el.parent('.map-container');
		this.handler = Gmaps.build('Google');
		this.settings = _.extend({}, this.defaults, (options ? options : {}));
		this.$el.height('100%');
		this.$el.width('100%');

		this.buildMap()
	};

	MapGenerator.prototype.buildMap = function(){
		var that = this;
		this.handler.buildMap({provider:{
				panControl: false,
				scaleControl: false,
				center: this.settings.center,
				specialties: [],
				paymentMethod: "",
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.MEDIUM,
                    position: google.maps.ControlPosition.RIGHT_CENTER
                }
		},internal: {id: this.$el.attr('id')}}, 
			function(){
				that.formatData();
			});
	};


	MapGenerator.prototype.placesFromAddress = function(address){

		var addressData = {location: address, distance: this.settings.distance, specialties: this.settings.specialties, paymentMethod: this.settings.paymentMethod},
			that = this;
			
		this.$el.addClass("loading");

		$.ajax({type:"POST", url: "/geocode/near", data: addressData, success: function(data){
			that.__drawGroupFromAjax(data);
		}, error: function(jqXHR, textStatus, errorThrown){
			that.$el.removeClass("loading");
			alert("Error: " + textStatus + ", " + errorThrown);
		}});

	};

	MapGenerator.prototype.placesFromGeo = function(){

		var geo = window.navigator.geolocation,
			that = this,
			lat,
			lng;

		if(geo){
			geo.getCurrentPosition(function(loc){
				lat = loc.coords.latitude;
				lng = loc.coords.longitude;
				that.$el.attr('data-loc-lat', lat);
				that.$el.attr('data-loc-long', lng);
				that.settings.center.lat = lat;
				that.settings.center.lng = lng;
				that.placesFromAddress(String(lat) + ", " + String(lng));
			}, function(err){
				alert("Couldn't geolocate. Try an address");
			});

		}


	};

	MapGenerator.prototype.__drawGroupFromAjax = function(markerObj){
		this.clearMarkers()
		this.markers = markerObj.markers;
		this.settings.center = markerObj.center;
		this.$el.attr('data-loc-lat', this.settings.center.lat);
		this.$el.attr('data-loc-long', this.settings.center.lng);
		this.drawMarkers();
		this.$el.removeClass("loading");
	};


	MapGenerator.prototype.clearMarkers = function(){
		if(this.__markers){
			this.handler.removeMarkers(this.__markers);
		}
		this.markers = [];
	};


	MapGenerator.prototype.formatData = function(){
		if(this.settings.mapType === 'profile'){
			 this.__markerFromDataAttributes();
		}
		if(this.markers.length > 0){
			this.drawMarkers();
		}
	};

	MapGenerator.prototype.__markerFromDataAttributes = function(){
		var lat = this.$el.data('lat'),
			lng = this.$el.data('long');

		this.settings.center.lat = lat;
		this.settings.center.lng = lng;
		this.markers.push({lat: lat, lng: lng});
	};

	MapGenerator.prototype.drawMarker = function(marker){
		this.markers.push(marker);
		this.drawMarkers();
	};

	MapGenerator.prototype.drawMarkers = function(){
		if(this.__markers){
			this.handler.removeMarkers(this.__markers);
		}
		this.__markers = this.handler.addMarkers(this.markers);
		this.centerAndZoom();

		
	};


	MapGenerator.prototype.__markerFromAjax = function(data){
		this.clearMarkers();
		this.$el.attr('data-loc-lat', data.location.lat);
		this.$el.attr('data-loc-long', data.location.lng);
		this.settings.center.lat = data.location.lat;
		this.settings.center.lng = data.location.lng;
		this.drawMarker(data.location);
	};

	MapGenerator.prototype.centerAndZoom = function(){
		this.handler.resetBounds();
		
		if(this.settings.bounds === 'circle' || this.__markers.length === 1){
			if(this.circle){
				this.circle.clear();
			}
			this.circle = this.handler.addCircle({
				lat: this.settings.center.lat,
				lng: this.settings.center.lng,
				radius: (this.settings.distance * 1.6 * 1000)
			},{
				draggable: false,
				visible: false,
				clickable: false
			});
			this.handler.bounds.extendWith(this.circle);
		} else{
			this.handler.bounds.extendWith(this.__markers);
		}


		this.handler.fitMapToBounds();
	};

	return window.MapGenerator = MapGenerator;

}(jQuery, window, document))