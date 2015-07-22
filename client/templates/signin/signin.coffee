Template.signin.events

	'submit form': (e, t) ->
		e.preventDefault()
		username = ($ t.find '.username').val()
		password = ($ t.find '.password').val()
		Meteor.loginWithPassword username, password, (err) ->
			unless err
				Router.go 'home'
