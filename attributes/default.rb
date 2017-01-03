default['consul-config']['tls']['source'] = 'data-bag'
default['consul-config']['tls']['bag'] = 'ssl'
default['consul-config']['tls']['item'] = 'consul'
default['consul-config']['tls']['encrypted'] = false

default['consul-config']['tls']['ssl_key']['item_key'] = 'key'
default['consul-config']['tls']['ssl_cert']['item_key'] = 'cert'

default['consul-config']['tls']['ssl_key']['path'] = '/etc/consul/ssl/private/consul.key'
default['consul-config']['tls']['ssl_cert']['path'] = '/etc/consul/ssl/certs/consul.crt'

default['consul-config']['ca_cert']['source'] = 'data-bag'
default['consul-config']['ca_cert']['bag'] = 'ssl'
default['consul-config']['ca_cert']['item'] = 'ca_cert'
default['consul-config']['ca_cert']['encrypted'] = false

default['consul-config']['ca_cert']['ssl_key']['item_key'] = 'key'
default['consul-config']['ca_cert']['ssl_cert']['item_key'] = 'cert'

default['consul-config']['ca_cert']['ssl_key']['path'] = '/etc/consul/ssl/private/ca.key'
default['consul-config']['ca_cert']['ssl_cert']['path'] = '/etc/consul/ssl/certs/ca.crt'

default['consul_template']['config'] = {
  :auth => {
    :enabled => false,
    :username => '',
    :password => ''
  },

  :consul => '127.0.0.1:8500',
  :max_stale => 0,

  :ssl => {
    :enabled => false,
    :verify => true
  },

  :syslog => {
    :enabled => false,
    :facility => 'LOCAL0'
  },

  :token => '',
  :wait => '',
  :retry => '5s'
}

default['consul-config']['vault']['tls']['ca'] = 'chef_vault_pki_ca'
default['consul-config']['vault']['tls']['bundle_ca'] = false
default['consul-config']['vault']['tls']['cn'] = 'localhost'
