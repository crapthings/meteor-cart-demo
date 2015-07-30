#

@Items = new Mongo.Collection 'items'

#

if Meteor.isServer

	#

	Meteor.publish 'items', (id) ->
		unless @userId
			@ready()

		Items.find { creatorId: id }

	#

	Meteor.publish 'findItems', (selector) ->
		unless @userId
			@ready()

		Items.find selector
