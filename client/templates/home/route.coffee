Router.map ->

	#

	@route 'home',

		path: '/'

		data: ->
			users: Meteor.users.find { _id: $ne: Meteor.userId() }

		waitOn: ->

			Meteor.subscribe 'users'

	#

	@route 'viewService',

		path: '/view/services/:_id'

		data: ->
			user: Meteor.users.findOne @params._id
			items: Items.find {}

		waitOn: ->
			Meteor.subscribe 'user', @params._id
			Meteor.subscribe 'items', @params._id
