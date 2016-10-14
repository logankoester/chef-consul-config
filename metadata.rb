name 'consul-config'
maintainer 'Logan Koester'
maintainer_email 'logan@logankoester.com'
license 'MIT'
description 'A collection of Consul templates for configuring various services.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

depends 'ssl_certificate'
depends 'consul-template'
