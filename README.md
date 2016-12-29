# ModelMirror

This project provides a basic viewer of your Rails models without
needing to configure your model relationships in YACF (Yet Another Config File).

`ModelMirror` inspects your existing ActiveRecord associations using reflection
to figure out the relationships.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'model_mirror'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end
```

Add this line to your application's `route.rb`:
```ruby
mount ModelMirror::Engine => "/mirror" unless Rails.env.production?
```

## Security

There has been no effort to secure this, yet. So we don't recommend adding the
route in production. If you really really want to have something like this in
production. You could try adding a `before_filter` to the `ModelMirror::Mirror`
controller.

```ruby
module ModelMirror
  class MirrorController < ApplicationController
    before_filter :check_user

    def check_user
      # It's up to you to implement #authorized?
      render status: :forbidden unless authorized?
    end
  end
end
```
