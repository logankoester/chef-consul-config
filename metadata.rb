name 'haproxy-consul-template'
maintainer 'Logan Koester'
maintainer_email 'logan@logankoester.com'
license 'MIT'
description 'Update haproxy.conf and reload it based on Consul events using Consul Template.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

depends 'consul-template'
depends 'haproxy-ng'
