#

Router.map ->

	#

	@route 'cart',

		path: '/cart'

		data: ->
			cart: Carts.findOne {}
