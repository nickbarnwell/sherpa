Introduction
------------
Sherpa is the worker that powers CampII, the Basecamp Importer for Podio. Currently only Basecamp Classic is supported at this time, BCX will come as soon as I write a gem that handles the API.

Getting Started
---------------
Since I've not pushed my version of the `basecamp` gem to rubygems you'll need to create a Gemfile that tells it where to find it, like so

```ruby
    gem 'sherpa', path: File.dirname(__FILE__)
    gem 'basecamp', git: 'git://github.com/nickbarnwell/basecamp-wrapper.git' 
```

Next, fill in your credentials in a file called `secrets.yml` in the spec folder. An example is located there already. A simple `cp spec/secrets.yml.example spec/secrets.yml; vim spec/secrets.yml` should get you sorted.

Pull Requests are more than welcome. If you *really* don't want to write tests, send me an email and we can collaborate to get your changes merged in.

Disclaimer
---------
Sherpa and CampII are in no way affiliated with Podio ApS or Podio, Inc.
