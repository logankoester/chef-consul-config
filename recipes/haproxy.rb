template '/etc/haproxy/acme-http01-webroot.lua' do
  user node['consul_template']['service_user']
  group  node['consul_template']['service_group']
  source 'acme-http01-webroot.lua.erb'
  action :create
  notifies :reload, 'service[haproxy]', :delayed
end

template '/etc/haproxy/haproxy.cfg.ctmpl' do
  user node['consul_template']['service_user']
  group  node['consul_template']['service_group']
  source 'haproxy.cfg.ctmpl.erb'
  action :create
  notifies :reload, 'service[consul-template]', :delayed
end

consul_template_config 'haproxy' do
  templates [{
    source: '/etc/haproxy/haproxy.cfg.ctmpl',
    destination: '/etc/haproxy/haproxy.cfg',
    command: 'systemctl reload haproxy'
  }]

  notifies :reload, 'service[consul-template]', :delayed
end
