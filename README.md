# Willktrial Ruby Library

[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-Built%20with%20Fern-brightgreen)](https://buildwithfern.com?utm_source=github&utm_medium=github&utm_campaign=readme&utm_source=https%3A%2F%2Fgithub.com%2Ffern-demo%2Finternal-ruby-auth0)

The Willktrial Ruby library provides convenient access to the Willktrial APIs from Ruby.

## Table of Contents

- [Documentation](#documentation)
- [Getting Started](#getting-started)
- [Authentication Api Client](#authentication-api-client)
- [Management Api Client](#management-api-client)
- [Further Reading](#further-reading)
- [Feedback](#feedback)
- [Reference](#reference)
- [Usage](#usage)
- [Environments](#environments)
- [Errors](#errors)
- [Advanced](#advanced)
  - [Retries](#retries)
  - [Timeouts](#timeouts)
  - [Additional Headers](#additional-headers)
  - [Additional Query Parameters](#additional-query-parameters)
- [Contributing](#contributing)

## Documentation

- [API documentation](https://www.rubydoc.info/gems/auth0) - documentation auto-generated from the code comments that explains all the available features
- [Examples](https://github.com/auth0/ruby-auth0/blob/master/EXAMPLES.md) - examples that demonstrate the different ways in which this SDK can be used
- [Docs Site](https://auth0.com/docs) - explore our Docs site and learn more about Auth0

## Getting Started

### Installation

This gem can be installed directly:

```bash
$ gem install auth0
```

or with [Bundler](https://bundler.io/man/bundle-add.1.html):

```bash
bundle add auth0
```

### Usage

Create an instance of `Auth0Client` to access properties and methods of the authentication and management APIs:

```ruby
require 'auth0'

client = Auth0Client.new(
  client_id: ENV['AUTH0_RUBY_CLIENT_ID'],
  client_secret: ENV['AUTH0_RUBY_CLIENT_SECRET'],
  domain: ENV['AUTH0_RUBY_DOMAIN'],
  # If you pass in a client_secret value, the SDK will automatically try to get a
  # Management API token for this application. Make sure your Application can make a
  # Client Credentials grant (Application settings in Auth0 > Advanced > Grant Types
  # tab) and that the Application is authorized for the Management API:
  # https://auth0.com/docs/api-auth/config/using-the-auth0-dashboard
  #
  # Otherwise, you can pass in a Management API token directly for testing or temporary
  # access using the key below.
  # token: ENV['AUTH0_RUBY_API_TOKEN'],
  #
  # When passing a token, you can also specify when the token expires in seconds from epoch. Otherwise, expiry is set
  # by default to an hour from now.
  # token_expires_at: Time.now.to_i + 86400
)
```

If `token` is omitted, the SDK will attempt to fetch a new token using the `client_credentials` grant, provided that `client_id` and `client_secret` are provided in the configuration. Once the token is about to expire (or has already expired), a new token will be fetched and cached for future calls.

For this to work, ensure your application can make a Client Credentials grant (Application settings in Auth0 > Advanced > Grant Types tab) and that the application is authorized for the Management API: https://auth0.com/docs/api-auth/config/using-the-auth0-dashboard

## Authentication API Client

This SDK provides access to [Authentication API](https://auth0.com/docs/api/authentication) endpoints with the `Auth0::API::AuthenticationEndpoints` module.

For basic login capability, we suggest using our OmniAuth stategy [detailed here](https://auth0.com/docs/quickstart/webapp/rails/01-login). Other authentication tasks currently supported are:

- Register a new user with a database connection using the `signup` method.
- Redirect a user to the universal login page for authentication using the `authorization_url` method.
- Log a user into a highly trusted app with the [Resource Owner Password grant](https://auth0.com/docs/api-auth/tutorials/password-grant) using the `login` method.
- Exchange an authorization code for an access token on callback using the `obtain_user_tokens` method (see the note on state validation below).
- Send a change password email to a database connection user using the `change_password` method.
- Log a user out of Auth0 with the `logout_url` method.

**Important note on state validation**: If you choose to implement a login flow callback yourself, it is important to generate and store a `state` value, pass that value to Auth0 in the `authorization_url` method, and validate it in your callback URL before calling `obtain_user_tokens`. For more information on state validation, [please see our documentation](https://auth0.com/docs/protocols/oauth2/oauth-state).

Please note that this module implements endpoints that might be deprecated for newer tenants. If you have any questions about how and when the endpoints should be used, consult the [documentation](https://auth0.com/docs/api/authentication) or ask in our [Community forums](https://community.auth0.com/tags/wordpress).

## Management API Client

This SDK provides access to the [Management API](https://auth0.com/docs/api/management/v2) via modules that help create clear and accurate calls. Most of the interaction is done through the `Auth0Client` class, instantiated with the required credentials.

For an example of using the management API client to read of users, see the [examples document](https://github.com/auth0/ruby-auth0/blob/master/EXAMPLES.md).

## Further reading

- [Login using OmniAuth](https://auth0.com/docs/quickstart/webapp/rails/01-login)
- [API authentication in Ruby](https://auth0.com/docs/quickstart/backend/ruby)
- [API authentication in Rails](https://auth0.com/docs/quickstart/backend/rails)
- [Managing authentication with Auth0 (blog)](https://auth0.com/blog/rails-5-with-auth0/)
- [Ruby on Rails workflow with Docker (blog)](https://auth0.com/blog/ruby-on-rails-killer-workflow-with-docker-part-1/)

## Feedback

### Contributing

We appreciate feedback and contribution to this repo! Before you get started, please see the following:

- [Auth0's general contribution guidelines](https://github.com/auth0/open-source-template/blob/master/GENERAL-CONTRIBUTING.md)
- [Auth0's code of conduct guidelines](https://github.com/auth0/open-source-template/blob/master/CODE-OF-CONDUCT.md)

### Raise an issue

To provide feedback or report a bug, please [raise an issue on our issue tracker](https://github.com/auth0/ruby-auth0/issues).

### Vulnerability Reporting

Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](https://auth0.com/whitehat) details the procedure for disclosing security issues.

---

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.auth0.com/website/sdks/logos/auth0_dark_mode.png" width="150">
    <source media="(prefers-color-scheme: light)" srcset="https://cdn.auth0.com/website/sdks/logos/auth0_light_mode.png" width="150">
    <img alt="Auth0 Logo" src="https://cdn.auth0.com/website/sdks/logos/auth0_light_mode.png" width="150">
  </picture>
</p>
<p align="center">
  Auth0 is an easy to implement, adaptable authentication and authorization platform. To learn more checkout <a href="https://auth0.com/why-auth0">Why Auth0?</a>
</p>
<p align="center">
  This project is licensed under the MIT license. See the <a href="https://github.com/auth0/ruby-auth0/blob/master/LICENSE"> LICENSE</a> file for more info.
</p>
## Reference

A full reference for this library is available [here](https://github.com/fern-demo/internal-ruby-auth0/blob/HEAD/./reference.md).

## Usage

Instantiate and use the client with the following:

```ruby
require "auth0"

client = Auth0::Management.new(token: "<token>")

client.actions.create(
  name: "name",
  supported_triggers: [{
    id: "post-login"
  }]
)
```

## Environments

This SDK allows you to configure different environments or custom URLs for API requests. You can either use the predefined environments or specify your own custom URL.
### Environments
```ruby
require "auth0"

auth0 = Auth0::Management.new(
    base_url: Auth0::Environment::DEFAULT
)
```

### Custom URL
```ruby
require "auth0"

client = Auth0::Management.new(
    base_url: "https://example.com"
)
```

## Errors

Failed API calls will raise errors that can be rescued from granularly.

```ruby
require "auth0"

client = Auth0::Management.new(
    base_url: "https://example.com"
)

begin
    result = client.actions.create
rescue Auth0::Errors::TimeoutError
    puts "API didn't respond before our timeout elapsed"
rescue Auth0::Errors::ServiceUnavailableError
    puts "API returned status 503, is probably overloaded, try again later"
rescue Auth0::Errors::ServerError
    puts "API returned some other 5xx status, this is probably a bug"
rescue Auth0::Errors::ResponseError => e
    puts "API returned an unexpected status other than 5xx: #{e.code} #{e.message}"
rescue Auth0::Errors::ApiError => e
    puts "Some other error occurred when calling the API: #{e.message}"
end
```

## Advanced

### Retries

The SDK is instrumented with automatic retries. A request will be retried as long as the request is deemed
retryable and the number of retry attempts has not grown larger than the configured retry limit (default: 2).

A request is deemed retryable when any of the following HTTP status codes is returned:

- [408](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/408) (Timeout)
- [429](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429) (Too Many Requests)
- [5XX](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#server_error_responses) (Internal Server Error)

The `retryStatusCodes` configuration controls which [5XX](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#server_error_responses) status codes are retried:

- `legacy` (default): Retries `408`, `429`, `500`, `502`, `503`, `504`, `521`, `522`, `524`
- `recommended`: Retries `408`, `429`, `502`, `503`, `504` only (excludes `500 Internal Server Error` to avoid retrying non-idempotent failures)

Use the `max_retries` option to configure this behavior.

```ruby
require "auth0"

client = Auth0::Management.new(
    base_url: "https://example.com",
    max_retries: 3  # Configure max retries (default is 2)
)
```

### Timeouts

The SDK defaults to a 60 second timeout. Use the `timeout` option to configure this behavior.

```ruby
require "auth0"

response = client.actions.create(
    ...,
    timeout: 30  # 30 second timeout
)
```

### Additional Headers

If you would like to send additional headers as part of the request, use the `additional_headers` request option.

```ruby
require "auth0"

response = client.actions.create(
    ...,
    request_options: {
        additional_headers: {
            "X-Custom-Header" => "custom-value"
        }
    }
)
```

### Additional Query Parameters

If you would like to send additional query parameters as part of the request, use the `additional_query_parameters` request option.

```ruby
require "auth0"

response = client.actions.create(
    ...,
    request_options: {
        additional_query_parameters: {
            "custom_param" => "custom-value"
        }
    }
)
```

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically.
Additions made directly to this library would have to be moved over to our generation code,
otherwise they would be overwritten upon the next generated release. Feel free to open a PR as
a proof of concept, but know that we will not be able to merge it as-is. We suggest opening
an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
