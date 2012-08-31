require_recipe "build-essential"
require_recipe "apt"
require_recipe "apache2"
require_recipe "apache2::mod_php5"
require_recipe "apache2::mod_rewrite"
require_recipe "git"
require_recipe "npm"
require_recipe "nodejs"

#bash "hosts" do
#  code "echo 127.0.0.1 vagrant-test >> /etc/hosts"
#end

execute "disable-default-site" do
  command "sudo a2dissite default"
  notifies :reload, resources(:service => "apache2"), :delayed
end

web_app "application" do
  template "application.conf.erb"
  notifies :reload, resources(:service => "apache2"), :delayed
end