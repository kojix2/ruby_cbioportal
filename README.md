# cBioPortal for Ruby 
[cBioPortal](http://www.cbioportal.org) for Ruby.
* under development.

## Installation
Requirements
* [Daru](https://github.com/SciRuby/daru)
* [httparty](https://github.com/jnunemaker/httparty)
* Jupyter & [IRuby](https://github.com/SciRuby/iruby) (stongly recommended)
* [Daru::View](https://github.com/SciRuby/daru-view) (recommended for visualizeation)

```bash
gem install cbioportal
```

```bash
git clone https://github.com/kojix2/ruby_cbioportal
cd ruby_cbioportal
bundle install
bundle exec rake install
```

## Usage
Use [cbioPortal web API](http://www.cbioportal.org/api/swagger-ui.html). 
Open Jupyter notebook.

```bash
jupyter notebook
```

```ruby
require 'cbioportal'

C.get "/studies"

# C.get "/some_nice_url", query: { someNiceId: "rollingriceball" }
```

## Development
* It is too early to decide the policy.

## Contributing
* Bug reports and pull requests are welcome on GitHub.
* Write a blog post about this gem. 

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
