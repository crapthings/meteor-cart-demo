faker = Meteor.npmRequire 'faker'

Meteor.startup ->

	Meteor.users.remove {}

	Accounts.createUser
		username: 'demo'
		password: 'demo'

	_(20).times ->
		Accounts.createUser
			username: faker.internet.userName()
			password: Random.id()

	users = Meteor.users.find().fetch()

	for user in users
		_(_.random 5, 10).times ->
			Items.insert
				creatorId: user._id
				title: faker.lorem.sentence()
				price: _.random 200, 5000
