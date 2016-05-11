# consul-config cookbook

A collection of Consul templates for configuring various services.

Update configuration files based on Consul events using [Consul Template](https://github.com/hashicorp/consul-template).

[![Build Status](http://ci.ldk.io/logankoester/chef-consul-config/badge)](http://ci.ldk.io/logankoester/chef-consul-config/)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

## Installation

Using [Berkshelf](http://berkshelf.com/), add the `consul-config` cookbook to your Berksfile.

```ruby
cookbook 'consul-config', github: 'logankoester/chef-consul-config', branch: 'master'
```
Then run `berks` to install it.

## Usage

### consul-config::default

Writes the configuration file for `consul-template` service itself. You always want at least this one in your run list.

### consul-config::haproxy

Writes `/etc/haproxy/haproxy.cfg` file for the [HAProxy](http://www.haproxy.org) load balancer.

Include `consul-config::haproxy` in your run_list.

```json
{
  "run_list": [
    "recipe[consul-config]",
    "recipe[consul-config::haproxy]"
  ]
}
```

## Running the tests

This cookbook uses the [Foodcritic](http://www.foodcritic.io/) linter and [ChefSpec](http://sethvargo.github.io/chefspec/) for unit testing.

1. `git clone git@github.com:logankoester/chef-consul-config.git`
2. `cd chef-consul-config`
3. `bundle install`
4. `bundle exec rake`

This will run all of the tests once. While developing, run `bundle exec guard start` and the relevant tests will run automatically when you save a file.

## Author

Copyright (c) 2015-2016 [Logan Koester](http://logankoester.com). Released under the mit license. See `LICENSE` for details.
