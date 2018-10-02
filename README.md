# Binda API
A GraphQL API for [Binda CMS](http://github.com/lacolonia/binda).

**Binda** is a headless CMS with an intuitive out-of-the-box interface which makes very easy creating application infrastructures. For more info about Binda structure please visit the [official documentation](http://www.rubydoc.info/gems/binda)

[![Maintainability](https://api.codeclimate.com/v1/badges/d670f30b4635e5d7bb2a/maintainability)](https://codeclimate.com/github/lacolonia/binda-api/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d670f30b4635e5d7bb2a/test_coverage)](https://codeclimate.com/github/lacolonia/binda-api/test_coverage)

# Quick start
Install Binda APi via terminal

```bash
gem install binda-api
```

alternatively add the gem to your application's Gemfile:

```ruby
gem 'binda-api'
```

Then execute:

```bash
bundle install
```

(If you have installed Binda already you can skip next steps)

Setup the database. If you are going to use Postgres set it up now.

To complete binda installation run the installer from terminal. Binda will take you through a short configuration process where you will setup the first user and some basic details.

```bash
rails generate binda:install
```

Now you are good to go. Good job!

# Authorization
We don't want everything stored inside Binda database to be accessible via API: there might be phone numbers, email addresses, credentials for external services that need to be secret and unaccessible.
Binda API is only accessible for admin created users, each one with an API KEY and a specific set of accessible contents.

# Query
Binda API is based on [GraphQL](https://graphql.org).
A valid API KEY must be sent along every request.

Here below an example of a simple query that retrives the name of all `post` components using [Axios](https://github.com/axios/axios) library. 

```javascript
axios
	.post(
		"http://my.domain.com/graphql",
		{ api_key: "SECRET-API-KEY", query: "{ components(slug: \"post\"){ edges { node { name } } }}" },
		{ headers: { "Content-Type": "application/json" } }
	)
	.then(response => response.data)
	.catch(error => {
		throw error;
	})
```

This is one of the possible approaces to access Binda content with GraphQL. Feel free to make requests to GraphQL as you prefer.

## GraphiQL and Binda API documentation
Binda API documentation is integrated in the GraphiQL panel which is accessible from `/admin_panel/graphiql`. In your local environment this would be `http://localhost:3000/admin_panel/graphiql` (if you use port 3000).
Since you can't customize request parameters, you should send the API KEY using the `QUERY VARIABLES` panel like this: 

```javascript
{ "api_key": "SECRET-API-KEY" }
```

## Absolute URL
If Binda is using a CDN to store all assets you should already receive a proper absolute URL. If insted you are storing assets inside public folder (see [Carrierwave documentation](https://github.com/carrierwaveuploader/carrierwave#configuring-carrierwave)) Binda API will give you a relative path.

You can fix this issue modify few lines of the CMS application on which Binda is installed.

Assuming that you set a environmental variable `BINDA_ASSET_HOST`

```yaml
BINDA_ASSET_HOST=http://your.domain.com
```

Add this line to `config/environments/production.rb`

```ruby
config.action_controller.asset_host = ENV['BINDA_ASSET_HOST']
```

Add also this line to `config/initializers/carrierwave.rb`

```ruby
config.asset_host = ActionController::Base.asset_host
```
