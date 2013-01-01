$(function() {
	$('img#loading')
		.hide()
		.ajaxStart(function() {
			clearData();
			$(this).show();
		});
});


function clearData() {
	$('.uid > h3').hide();
	$('.uid > h4').hide();
	$('.uid > .attributes').hide();
}