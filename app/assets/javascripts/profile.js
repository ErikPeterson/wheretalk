var ProfileMap = function(){
	this.initialize();
};

ProfileMap.prototype.initialize = function(){
	this.$el= $('#map');
	this.height = $('.container.profile-card').height();
	this.width = this.height;
	this.handler = Gmaps.build('Google');
	this.lat = +this.$el.data('lat');
	this.lng = +this.$el.data('long');
	console.log(this.lat + " " + this.lng)
	this.formatContainer();
};

ProfileMap.prototype.formatContainer = function(){
	this.$el.height(this.height)
	this.$el.width(this.width)

	this.buildMap();
};

ProfileMap.prototype.buildMap = function(){
	var that = this;

	this.handler.buildMap({internal: {id: 'map'}}, function(){
		that.drawMarker();
	});
};

ProfileMap.prototype.drawMarker = function(){
  
  this.marker = this.handler.addMarker({
    lat: this.lat,
    lng: this.lng
  });

  this.handler.map.centerOn(this.marker);

  this.zoomToMile(0.5);
};

ProfileMap.prototype.zoomToMile = function(miles){
	this.circle = this.handler.addCircle({
		lat: this.lat,
		lng: this.lng,
		radius: (miles * 1.6 * 1000)
	},{
		draggable: false,
		visible: false,
		clickable: false
	});

	this.handler.bounds.extendWith(this.circle);
	this.handler.fitMapToBounds();
}

$(function(){

	var map = new ProfileMap();

});
