default['consul-config']['tls']['source'] = 'data-bag'
default['consul-config']['tls']['bag'] = 'ssl'
default['consul-config']['tls']['item'] = 'consul'

default['consul-config']['tls']['ssl_key']['path'] = '/etc/consul/ssl/private/consul.key'
default['consul-config']['tls']['ssl_cert']['path'] = '/etc/consul/ssl/certs/consul.crt'
default['consul-config']['tls']['ssl_chain']['path'] = '/etc/consul/ssl/certs/chain.crt'

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
