# Symlink the consul binary to a common path

consul_version = node['consul']['version']

link '/usr/local/bin/consul' do
  to "/opt/consul/#{consul_version}/consul"
end
