# Generate and sign a certificate for Vault with the CA cert and key
# stored in chef-vault.
# 
# See https://supermarket.chef.io/cookbooks/chef_vault_pki
# See https://www.vaultproject.io/docs/config/index.html

tls_cert_dir = Pathname.new(node['hashicorp-vault']['config']['tls_cert_file']).dirname.to_s

chef_vault_pki "consul_#{node.name}" do
  ca node['consul-config']['vault']['tls']['ca']
  path tls_cert_dir
  owner 'vault'
  group 'vault'
  public_mode 0644
  private_mode 0600
  bundle_ca node['consul-config']['vault']['tls']['bundle_ca']
end
