/*
	Mapping Listeners
*/
$.mappingListeners = {
	init: function() {
		this.wireupListeners();
	},
	
	wireupListeners: function() {
		map.on('click', function(e) { 
			$('#moment_lat').val(e.latlng.lat);
			$('#moment_long').val(e.latlng.lng);
		})
	},
}

/*
	Application Listeners
*/
$.applicationListeners = {
	init: function() {
		this.wireupListeners();
	},
	
	wireupListeners: function() {
		
		$('input:checkbox.tag-filter').change(function() {
			$.mapping.toggleMarkerLayerVisability(this.value);
		});
		
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
	},
}