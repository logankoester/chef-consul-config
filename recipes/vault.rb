# Generate and sign a certificate for Vault with the CA cert and key
# stored in chef-vault, then add the CA cert to the system trust store.
# 
# See https://supermarket.chef.io/cookbooks/chef_vault_pki
# See https://www.vaultproject.io/docs/config/index.html

# Install and load chef-vault
chef_gem 'chef-vault' do
  compile_time true if respond_to?(:compile_time)
end
require 'chef-vault'

tls_cert_dir = Pathname.new(node['hashicorp-vault']['config']['tls_cert_file']).dirname.to_s

directory tls_cert_dir do
  owner 'vault'
  group 'vault'
  mode 0644
  action :create
  ignore_failure true
  recursive true
end

chef_vault_pki node['consul-config']['vault']['tls']['cn'] do
  ca node['consul-config']['vault']['tls']['ca']
  path tls_cert_dir
  owner 'vault'
  group 'vault'
  public_mode 0644
  private_mode 0600
  bundle_ca node['consul-config']['vault']['tls']['bundle_ca']
end

# Add the CA cert to the system trust store
ca = ChefVault::Item.load(node['chef_vault_pki']['data_bag'], node['chef_vault_pki']['ca'])
trusted_certificate node['chef_vault_pki']['ca'] do
  action :create
  content ca['cert']
end
