template '/etc/yum.repos.d/nginx.repo' do
  source 'nginx.repo.erb'
end

package 'nginx'

template '/usr/share/nginx/html/50x.html' do
  source '50x.html.erb'
  owner 'nginx'
  group 'nginx'
end

template '/etc/nginx/conf.d/default.conf' do
  source 'default.conf.erb'
  owner 'nginx'
  group 'nginx'
  notifies :reload, 'service[nginx]'
end

selinux_policy_boolean 'httpd_can_network_connect' do
  value true
  notifies :restart, 'service[nginx]'
end

firewall_rule 'ssh' do
  protocol :tcp
  port     [22]
  action   :allow
end

firewall_rule 'http/https' do
  protocol :tcp
  port     [80, 443]
  action   :allow
end

service 'nginx' do
  action [:enable, :start]
end
