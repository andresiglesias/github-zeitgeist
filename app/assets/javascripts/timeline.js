function generateStatistics() {
	
	$.ajax({
	    type: "GET",
	    url: '/generate-statistics',
	    dataType: "json",
		async: true,
	    beforeSend: function() {   
			$('#loading-statistics').html('<img src=\'assets/loading.gif\' alt=\'Loading\'> Loading... This may take a few minutes.');
	    },
	    complete: function() {
			
	    },        
	    success: function(result) {
			
			$('#loading-statistics').html('');
	    },
	    error: function(xhr, status, error) {
			
	    }
	});
	}