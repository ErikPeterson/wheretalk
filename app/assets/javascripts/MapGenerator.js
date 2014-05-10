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
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.MEDIUM,
                    position: google.maps.ControlPosition.RIGHT_CENTER
                }
		},internal: {id: this.$el.attr('id')}}, 
			function(){
				that.formatData();
			});
	};

	MapGenerator.prototype.formatData = function(){
		if(this.settings.mapType === 'profile'){
			 this.__markerFromDataAttributes();
		}

		this.drawMarkers();
	};

	MapGenerator.prototype.__markerFromDataAttributes = function(){
		var lat = this.$el.data('lat'),
			lng = this.$el.data('long');

		this.settings.center.lat = lat;
		this.settings.center.lng = lng;
		this.markers.push({lat: lat, lng: lng});
	};

	MapGenerator.prototype.drawMarkers = function(){
		this.__markers = this.handler.addMarkers(this.markers);
		this.centerAndZoom();
	};

	MapGenerator.prototype.centerAndZoom = function(){
		if(this.settings.bounds === 'circle'){

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
		}else{
			this.handler.bound.extendWith(this.__markers);
		}


		this.handler.fitMapToBounds();
	};

	return window.MapGenerator = MapGenerator;

}(jQuery, window, document))