template File.join(node['consul_template']['config_dir'], 'config.hcl') do
  user node['consul_template']['service_user']
  group  node['consul_template']['service_group']
  source 'consul_template-config.hcl.erb'
  action :create
  notifies :reload, 'service[consul-template]', :immediately
end
