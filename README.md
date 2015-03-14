# haproxy-consul-template cookbook

Update `haproxy.conf` and reload it based on Consul events using [Consul Template](https://github.com/hashicorp/consul-template).

[![Build Status](http://ci.ldk.io/logankoester/chef-haproxy-consul-template/badge)](http://ci.ldk.io/logankoester/chef-haproxy-consul-template/)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

## Overview



## Installation

Using [Berkshelf](http://berkshelf.com/), add the `haproxy-consul-template` cookbook to your Berksfile.

```ruby
cookbook 'haproxy-consul-template', github: 'logankoester/chef-haproxy-consul-template', branch: 'master'
```
Then run `berks` to install it.

## Usage

TODO: Include usage patterns of any providers or recipes.

### haproxy-consul-template::default

Include `haproxy-consul-template` in your run_list.

```json
{
  "run_list": [
    "recipe[haproxy-consul-template::default]"
  ]
}
```

## Running the tests

This cookbook uses the [Foodcritic](http://www.foodcritic.io/) linter and [ChefSpec](http://sethvargo.github.io/chefspec/) for unit testing.

1. `git clone git@github.com:logankoester/chef-haproxy-consul-template.git`
2. `cd chef-haproxy-consul-template`
3. `bundle install`
4. `bundle exec rake`

This will run all of the tests once. While developing, run `bundle exec guard start` and the relevant tests will run automatically when you save a file.

## Author

Copyright (c) 2015 [Logan Koester](http://logankoester.com). Released under the mit license. See `LICENSE` for details.
