Template.cart.events

	'click .remove-from-cart': (e, t) ->
		Meteor.call 'removeFromCart', @

	'click .done': (e, t) ->
		Meteor.call 'confirmOrder', @

	'click .empty-cart': (e, t) ->
		Meteor.call 'emptyCart'
