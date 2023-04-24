#!/bin/bash
# desktop-shark-run-protonvpn-no-CLI-prompts.sh
# Script to run Protonvpn in a terminal server
# Requires:
# ssh
# screen: software to detach and re-attach terminal sessions yet open.
# openvpn
# openvpn updated from ProtonVPN documentation
# Protonvpn-cli package for debian (.deb)
# gdebi
# resolvconf
# ProtonVPN user account (Free account works)
# OpenVPN IKEv2 username and password for manual IKEv2 login or
# strongswan, libstrongswan-extra-plugins, and/or libcharon-extra-plugins
# packages, cert, and setup for ipsec and connection to the IKEv2 protocol
# without authentication. 
#
# Kill switch:
# A kill switch is a security feature that protects your IP address
# in case you unexpectedly lose the connection to a ProtonVPN server. 
# In case the connection is interrupted, a kill switch blocks all 
# external network traffic to and from your device until the connection
# is automatically re-established to the same VPN server. 
# This means that even though you can’t use the Internet until 
# ProtonVPN reconnects, your IP address and DNS queries are safe
# from being exposed.
protonvpn-cli ks --on
#protonvpn-cli ks --permanent
#protonvpn-cli ks --off
#
# When everything is set up and worked a previous testing time
# After logging in the first time ProtonVPN stores the password
# To up the VPN connection named "test" (see config files notes):
# The system is going to prompt for the sudo password
sudo ipsec up test
# Output: "connection 'test' established successfully"
#
# To disconnect the VPN:
#sudo ipsec dowm test
#
# If you make changes in the VPN configuration, for example, change a server or
# reset authentication (check out the web site account), we need to restart
# the service using the command:
#sudo ipsec restart
# or use:
#sudo systemctl restart ipsec
#
#
# List of files and config files, and their content:
#
# ProtonVPN certificate file: /etc/ipsec.d/cacerts/protonvpn.der
#
# File: /etc/ipsec.conf:
# -------------------------------------------------------------
# # ipsec.conf - strongSwan IPsec configuration file
# 
# # basic configuration
# 
# config setup
#         # strictcrlpolicy=yes
#         # uniqueids = no
# 
# # Add connections here.
# conn test
#  left=%defaultroute
#  leftsourceip=%config
#  leftauth=eap-mschapv2
#  eap_identity=7yHwwzn5o7dfscaCNBV
#  right=jp-free-03.protonvpn.com
#  rightsubnet=0.0.0.0/0
#  rightauth=pubkey
#  rightid=%jp-free-03.protonvpn.com
#  rightca=/etc/ipsec.d/cacerts/protonvpn.der
#  keyexchange=ikev2
#  type=tunnel
#  auto=add
# -------------------------------------------------------------
#
# File: /etc/ipsec.secrets:
# -------------------------------------------------------------

# # This file holds shared secrets or RSA private keys for authentication.
# 
# # RSA private key for this host, authenticating it to any other host
# # which knows the public part.
# 7yHwwzn5o7dfscaCNBV : EAP JWh34jTxSsvYsgmJUrasdfvvk0NgOrMj7e
# 
# # this file is managed with debconf and will contain the automatically created private key
# include /var/lib/strongswan/ipsec.secrets.inc
# -------------------------------------------------------------
#
#
# Test connection:
#
# Verify my VPN Private Network IP address (from the VPN server set up, 
# don't confuse it with a public IP). It also tells us whetheryes or not
# the host is conencted to the VPN:
ip addr show
# Output example:
# -------------------------------------------------------------
# 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
#     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
#     inet 127.0.0.1/8 scope host lo
#        valid_lft forever preferred_lft forever
#     inet6 ::1/128 scope host 
#        valid_lft forever preferred_lft forever
# 2: enp2s14: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
#     link/ether 00:1c:f0:a7:a8:57 brd ff:ff:ff:ff:ff:ff
# 3: enp2s12: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN group default qlen 1000
#     link/ether 00:01:02:c5:ff:48 brd ff:ff:ff:ff:ff:ff
#     inet 192.168.100.45/24 brd 192.168.100.255 scope global dynamic noprefixroute enp2s12
#        valid_lft 83450sec preferred_lft 83450sec
#     inet 10.1.26.120/32 scope global enp2s12
#        valid_lft forever preferred_lft forever
#     inet6 fe80::201:2ff:fec5:ff48/64 scope link noprefixroute 
#        valid_lft forever preferred_lft forever
# 4: enp2s8: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
#     link/ether 00:02:55:bf:da:90 brd ff:ff:ff:ff:ff:ff
# -------------------------------------------------------------
#
# From the server host:
# Google local IP
#$ traceroute www.yahoo.com has to show us the route from the VPN address location to the yahoo servers.
#$ traceroute www.yahoo.com no VPN connection active has to show us a different route from the local address
# to the yahoo servers.
