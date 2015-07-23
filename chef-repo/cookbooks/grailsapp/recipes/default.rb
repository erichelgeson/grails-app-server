include_recipe 'java::default'
include_recipe 'firewall'
include_recipe 'grailsapp::postgresql-server' if node['grailsapp']['user'] == 'vagrant'
include_recipe 'grailsapp::nginx'
include_recipe 'grailsapp::users'
include_recipe 'grailsapp::app'
include_recipe 'grailsapp::utils'
