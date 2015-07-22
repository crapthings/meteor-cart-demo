Template.viewService.events

	'click .add-to-cart': (e, t) ->
		e.preventDefault()
		console.log @
		Meteor.call 'addToCart', @
