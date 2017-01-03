# Generate and sign a certificate for Vault with the CA cert and key
# stored in chef-vault.
# 
# See https://supermarket.chef.io/cookbooks/chef_vault_pki
# See https://www.vaultproject.io/docs/config/index.html

tls_cert_dir = Pathname.new(node['hashicorp-vault']['config']['tls_cert_file']).dirname.to_s

directory tls_cert_dir do
  owner 'vault'
  group 'vault'
  mode 0644
  action :create
  ignore_failure true
  recursive true
end

chef_vault_pki 'vault' do
  ca node['consul-config']['vault']['tls']['ca']
  path tls_cert_dir
  owner 'vault'
  group 'vault'
  public_mode 0644
  private_mode 0600
  bundle_ca node['consul-config']['vault']['tls']['bundle_ca']
  subject_alternate_names node['consul-config']['vault']['tls']['subject_alternate_names']
end
