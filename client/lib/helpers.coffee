helper = Template.registerHelper

helper 'cart', ->
	Carts.findOne {}
