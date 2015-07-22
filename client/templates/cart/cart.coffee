Template.cart.events

	'click .remove-from-cart': (e, t) ->
		console.log @
		Meteor.call 'removeFromCart', @
