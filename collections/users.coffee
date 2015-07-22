#

Meteor.users.after.insert (userId, user) ->
	Carts.insert
		userId: user._id


if Meteor.isServer

	#

	Meteor.publish 'users', ->
		unless @userId
			@ready()

		Meteor.users.find {}

	Meteor.publish 'user', (id) ->
		unless @userId
			@ready()

		Meteor.users.find { _id: id }
