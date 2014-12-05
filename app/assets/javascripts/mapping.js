var map;
var mapLayer;
var contourLayer;
var hillshadeLayer;
var elevationLayerGroup;
var geoJsonLayers = {};

$.mapping = {
	init: function() {
		if($('#map').length) {
			this.initMapBaseLayers();
			this.initMap();
			this.initMapLayerControls();
			this.initGeoJsonLayer();
			$.mappingListeners.init();
		}	
	},
	
	initMap: function() {
		
		map = L.map('map', {
	        layers: mapLayer,
	        center: [ -36, -60 ],
	        zoom: 5,
	        maxZoom: 17,
			minZoom: 3
	    });
	},
	
	initMapBaseLayers: function() {
		mapLayer = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
						attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
					});
  	  	
		contourLayer = L.tileLayer('http://129.206.74.245:8006/tms_il.ashx?x={x}&y={y}&z={z}', {
			opacity: .7,
			attribution: 'Map data - ASTER GDEM is a product of METI and NASA contributors, <a href="http://www.geog.uni-heidelberg.de/gis/index_en.html">Rendering GIScience Research Group @ Heidelberg University</a>'
		});
		hillshadeLayer = L.tileLayer('http://129.206.74.245:8004/tms_hs.ashx?x={x}&y={y}&z={z}',{
			opacity: .7,
			attribution: 'Map data - ASTER GDEM is a product of METI and NASA contributors, <a href="http://www.geog.uni-heidelberg.de/gis/index_en.html">Rendering GIScience Research Group @ Heidelberg University</a>'
		});
		elevationLayerGroup = L.layerGroup([contourLayer, hillshadeLayer]);
	},
	
	initMapLayerControls: function() {
		L.control.layers({
		        'Map': mapLayer,
		        'Satellite': MQ.satelliteLayer(),
		        'Hybrid': MQ.hybridLayer(),
			},
			{
				'Elevation': elevationLayerGroup
			}
		).addTo(map);
	},
	
	initGeoJsonLayer: function() {
		if(window['gon']){
			
			function onEachFeature(feature, layer) {
			    // does this feature have a property named popupContent?
				if (feature.properties && feature.properties.popupContent) {
					layer.bindPopup(feature.properties.popupContent);
			    }
			}
			
			//loop through moments and create an array of geoJson layers with the tag as the key
			for(moment in gon.moments) {
				if (gon.moments[moment].length) {
					geoJsonLayer = L.geoJson(gon.moments[moment], 
						{ onEachFeature: onEachFeature }).addTo(map);
						
					geoJsonLayers[moment] = geoJsonLayer;
				}

			}
		}
	},
	
	toggleMarkerLayerVisability: function(layerKey) {
		if (map.hasLayer(geoJsonLayers[layerKey])) {
			map.removeLayer(geoJsonLayers[layerKey]);
		} else {
			map.addLayer(geoJsonLayers[layerKey]);
		}
	},
}