include_recipe 'openswan::_dependencies'
include_recipe 'openswan::_install'
include_recipe 'openswan::_ppp_config'

template "/etc/ipsec.secrets" do
  source "ipsec.secrets.erb"
  notifies :restart, "service[ipsec]"
end

template "/etc/ipsec.conf" do
  source "ipsec.conf.tunnel.erb"
  notifies :restart, "service[ipsec]"
end

include_recipe 'openswan::_enable_snat'


