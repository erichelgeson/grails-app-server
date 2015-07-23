package 'epel-release'
package 'tomcat-native'

template '/etc/systemd/system/grailsapp.service' do
  source 'grailsapp.service.erb'
  notifies :run, 'execute[register-daemon]', :immediately
end

execute 'register-daemon' do
  command 'systemctl daemon-reload'
  action :nothing
end

service 'grailsapp' do
  action [:enable, :start]
end
