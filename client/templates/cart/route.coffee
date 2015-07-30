#

Router.route '/cart', ->

	@state.set 'servicesId', _.uniq( _.pluck( Carts.findOne()?.items, 'creatorId' ) )

	@state.set 'itemsId', _.uniq( _.pluck( Carts.findOne()?.items, '_id' ) )

	@render 'cart',

		data: ->

			services: Meteor.users.find { _id: $in: @state.get 'servicesId' }

			items: (creatorId) -> Items.find { creatorId: creatorId }

			totalPrice: ->

				unless Carts.findOne()?.items.length
					return 0

				_.reduce _.pluck(Carts.findOne()?.items, 'price'), (memo, price) ->
					memo + price
,

	name: 'cart'

	waitOn: -> [

		Meteor.subscribe 'findServices', { _id: $in: @state.get 'servicesId' }

		Meteor.subscribe 'findItems', { _id: $in: @state.get 'itemsId' }
	]
