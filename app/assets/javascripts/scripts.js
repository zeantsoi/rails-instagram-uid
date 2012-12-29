$(function() {
	$('img#loading')
		.hide()  // hide it initially.
		.ajaxStart(function() {
			clearData();
			$(this).show(); // show on any Ajax event.
		});
});


function clearData() {
	$('.uid > h3').hide();
	$('.uid > h4').hide();
	$('.uid > .attributes').hide();
}