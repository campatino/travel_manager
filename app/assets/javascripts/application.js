//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require select2-full
//= require_tree .

$(function(){
	$(".datatable").DataTable({});

	$( ".select2" ).select2({
		theme: "bootstrap",
		width: "100%"
	});
})