remote_file '/tmp/pgdg-centos94-9.4-1.noarch.rpm' do
  source 'http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm'
end

yum_package 'pgdg-centos94-9.4-1.noarch' do
  source '/tmp/pgdg-centos94-9.4-1.noarch.rpm'
end

%w(postgresql94 postgresql94-server postgresql94-contrib postgresql94-libs).each do |pkg|
  package pkg
end

execute '/usr/pgsql-9.4/bin/postgresql94-setup initdb' do
  not_if { Dir.exists?('/var/lib/pgsql/9.4/data/base') }
end

service 'postgresql-9.4' do
  action [:enable, :start]
end
