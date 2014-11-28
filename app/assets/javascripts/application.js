// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(document).ready(function(){  
  if($('#map').length) {
		var mapLayer = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
						attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
					});
  	  	
		var contourLayer = L.tileLayer('http://129.206.74.245:8006/tms_il.ashx?x={x}&y={y}&z={z}', {
			opacity: .7,
			attribution: 'Map data - ASTER GDEM is a product of METI and NASA contributors, <a href="http://www.geog.uni-heidelberg.de/gis/index_en.html">Rendering GIScience Research Group @ Heidelberg University</a>'
		});
		var hillshadeLayer = L.tileLayer('http://129.206.74.245:8004/tms_hs.ashx?x={x}&y={y}&z={z}',{
			opacity: .7,
			attribution: 'Map data - ASTER GDEM is a product of METI and NASA contributors, <a href="http://www.geog.uni-heidelberg.de/gis/index_en.html">Rendering GIScience Research Group @ Heidelberg University</a>'
		});
		var elevationLayerGroup = L.layerGroup([contourLayer, hillshadeLayer]);
		
		var map = L.map('map', {
	        layers: mapLayer,
	        center: [ -36, -60 ],
	        zoom: 5,
	        maxZoom: 17,
			minZoom: 3
	    });
  

  
		L.control.layers({
	        'Map': mapLayer,
	        'Satellite': MQ.satelliteLayer(),
	        'Hybrid': MQ.hybridLayer(),
		},
		{
			'Elevation': elevationLayerGroup
		}
		).addTo(map); 
		
		L.control.scale({imperial: false}).addTo(map);

		map.on('click', function(e) { 
			$('#moment_lat').val(e.latlng.lat);
			$('#moment_long').val(e.latlng.lng);
		}) 
		
		$('*[data-module="tag-list"]').each(function() {
            var e = $(this),
                t = e.find("#tag-list-display"),
                n = e.find("#tag-list-controls");
            t.find(".tag").find("a.close").click(function(e) {
                e.preventDefault();
                var t = $(this),
                    n = t.data("tag-id"),
                    r = t.closest(".tag"),
                    i = t.closest(".tag-list").find("#tag-list-controls");
                i.find('input[value="' + n + '"]').removeAttr("checked");
                r.remove()
            })
        });
  }
});

$(function(){ $(document).foundation(); });
