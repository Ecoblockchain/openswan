#public_interface = node['network']['interfaces'].detect { |k,v| v['addresses'].keys.include?(node['ipaddress'])}.first
#
#execute "turn on public SNAT" do
#  command "iptables -t nat -I POSTROUTING -o #{public_interface} -j SNAT --to #{node['ipaddress']}"
#  not_if "iptables -L -t nat | grep #{node[:openswan][:public_ip]}"
#  notifies :restart, "service[xl2tpd]"
#  notifies :restart, "service[ipsec]"
#end
#
#private_interface = node['network']['interfaces'].detect { |k,v| v['addresses'].keys.include?(node['openswan']['private_ip'])}.first
#
#execute "turn on private SNAT" do
#  command "iptables -t nat -I POSTROUTING -o #{private_interface} -j SNAT --to #{node['openswan']['private_ip']}"
#  not_if "iptables -L -t nat | grep #{node['openswan']['private_ip']}"
#  notifies :restart, "service[xl2tpd]"
#  notifies :restart, "service[ipsec]"
#end


# no need for this - check
#execute "turn on masquerade " do
#  command "iptables -t nat --append  POSTROUTING -o eth0 -s 10.255.0.0/16 ! -d 10.140.111.6/24 -j MASQUERADE"
#  not_if "iptables -L -t nat | grep 10.255.0.0/16"
#  notifies :restart, "service[ipsec]"
#end
