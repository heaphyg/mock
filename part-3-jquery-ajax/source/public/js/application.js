$(document).ready(function(){

	$('#get_color').click(function(event){
		event.preventDefault();

	 // var random_number = Math.floor(Math.random() * (9 - 1 + 1)) + 1

	 // $('#color_me').find('li:nth-child('+ random_number + ')').css("background-color","yellow");


		   $.post( '/color', function( response ) {
		     console.log(response)
		     var obj = JSON.parse(response)  // we have to convert the JSON object into javascript object

	         // $( ".result" ).html( data );
	         $('#color_me').find('li:nth-child('+ obj.cell + ')').css("background-color", obj.color);  // notice that the obj.color is not in a string as opposed to 'yellow'
	       });
	});
});




//   $('#color_me').find('li:first-child').css("background-color","yellow");


// Math.floor(Math.random() * (9 - 1 + 1)) + 1


//  $('#color_me').find('li:nth-child(3)').css("background-color","yellow");



// $('#color_me').find('li:nth-child(random_number)').css("background-color","yellow");



