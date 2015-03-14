include_recipe 'haproxy-ng::install'
include_recipe 'consul-template::install'

template '/etc/haproxy/consul-template.cfg.ctmpl' do
  source 'haproxy.cfg.ctmpl.erb'
  action :create
  notifies :run, 'consul_template_config[haproxy]', :immediately
end

template Path.join(default['consul_template']['config_dir'], 'config.hcl') do
  source 'consul_template-config.hcl.erb'
  action :create
  notifies :reload, 'service[consul-template]', :immediately
end

consul_template_config 'haproxy' do
  templates [{
    source: '/etc/haproxy/haproxy.cfg.ctmpl',
    destination: '/etc/haproxy/haproxy.cfg',
    command: 'systemctl reload haproxy'
  }]

  notifies :reload, 'service[consul-template]', :delayed
end

include_recipe 'haproxy-ng::service'
include_recipe 'consul-template::service'
