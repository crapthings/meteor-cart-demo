@Carts = new Mongo.Collection 'carts'

Meteor.methods

	'addToCart': (opt) ->
		Carts.update { userId: Meteor.userId() },
			$addToSet:
				items: opt

	'removeFromCart': (opt) ->
		Carts.update { userId: Meteor.userId() },
			$pull:
				items: opt

	emptyCart: ->
		Carts.update { userId: Meteor.userId() },
			$set:
				items: []

if Meteor.isServer

	Meteor.publish '', ->
		unless @userId
			@ready()

		Carts.find { userId: @userId }
