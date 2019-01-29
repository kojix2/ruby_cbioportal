# cBioPortal for Ruby 
[cBioPortal](http://www.cbioportal.org) for Ruby.
* under development.

## Installation
Requirements
* Daru
* httparty
* Jupyter & IRuby (stongly recommended)
* Daru::View (for visualizeation)

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
Open Jupyter notebook.

```bash
jupyter notebook
```

Open [cbioPortal web API](http://www.cbioportal.org/api/swagger-ui.html) web page. 


```ruby
require 'daru'
require 'daru/view'
require 'cbioportal'

C.get "/studies"

# C.get "/some_nice_url", query: { someNiceId: "rollingriceball" }
```

## Development
* It is too early to decide the policy.

## Contributing
Bug reports and pull requests are welcome on GitHub.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
