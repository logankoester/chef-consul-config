directory File.dirname(node['consul-config']['tls']['ssl_key']['path']) do
  recursive true
  owner node['consul']['service_user']
  group node['consul']['service_group']
end

directory File.dirname(node['consul-config']['tls']['ssl_cert']['path']) do
  recursive true
  owner node['consul']['service_user']
  group node['consul']['service_group']
end

ca_cert = ssl_certificate 'consul_ca_cert' do
  owner node['consul']['service_user']
  group node['consul']['service_group']
  namespace node['consul-config']['ca_cert']
end

certificate = ssl_certificate 'consul_cert' do
  owner node['consul']['service_user']
  group node['consul']['service_group']
  namespace node['consul-config']['tls']
  #notifies :reload, "consul_service[#{name}]", :delayed
end

node.default['consul']['config']['verify_incoming'] = true
node.default['consul']['config']['verify_outgoing'] = true

node.default['consul']['config']['ca_file'] = ca_cert.cert_path
node.default['consul']['config']['cert_file'] = certificate.cert_path
node.default['consul']['config']['key_file'] = certificate.key_path
