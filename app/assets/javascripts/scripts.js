$(function() {
	// Hide loading gif on page load; show only upon AJAX request submission
	$('img#loading')
		.hide()
		.ajaxStart(function() {
			clearData();
			$(this).show();
		});
});

// Clear right hand form upon form submission
function clearData() {
	$('.uid > h3').hide();
	$('.uid > h4').hide();
	$('.uid > .attributes').hide();
}