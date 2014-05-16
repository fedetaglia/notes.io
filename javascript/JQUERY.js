JQUERY
is a cross-platform JavaScript library designed to simplify the client-side scripting of HTML.
Helps to keep consistency between different browsers.



Helps to select DOM element

.. from an element
$('h1')

.. from an ID
$('#content')

.. from a class
$('.heading')


$('.menu').append('<li>forth</li>');
('.menu').prepend('<li>zero</li>');
$('.menu').prepend('<li></li>', {text: 'shortcut', class: 'special'});


var special = $('<li></li>',{text:'special', class: 'special'});
$('.menu').prepend(special);

var item = $('<li>').addClass('special');
item.insertAfter('h2');