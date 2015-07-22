#

Router.configure

	layoutTemplate: 'layout'

#

Router.onBeforeAction ->

	unless Meteor.userId()
		@layout 'blank'
		@render 'signin'

	else
		@next()

,
	except: ['signin']
