
default['masala_netservices']['cluster_name'] = 'no_name'

default['masala_netservices']['keepalive_password'] = 'abc123'

default['masala_netservices']['vip_mode'] = 'none'

# the default check script for netservices is the openldap slapd and ntpd
default['keepalived']['check_scripts']['chk_netservices']['script'] = 'killall -0 slapd && killall -0 ntpd'
default['keepalived']['check_scripts']['chk_netservices']['interval'] = 3
default['keepalived']['check_scripts']['chk_netservices']['weight'] = 2
