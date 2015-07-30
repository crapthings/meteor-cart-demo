@Orders = new Mongo.Collection 'orders'

Meteor.methods

	confirmOrder: (opt) ->
		console.log opt
		Orders.insert
			userId: opt.userId
			items: opt.items
