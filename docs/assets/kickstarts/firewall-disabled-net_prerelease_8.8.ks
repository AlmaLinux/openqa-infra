bootloader --location=mbr
network --bootproto=dhcp
# url --mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos/
# install
url --url http://$basearch-pungi-8.almalinux.org/almalinux/8/latest_result/compose/BaseOS/$basearch/kickstart/
repo --name=BaseOS --baseurl=http://$basearch-pungi-8.almalinux.org/almalinux/8/latest_result/compose/BaseOS/$basearch/os/
repo --name=AppStream --baseurl=http://$basearch-pungi-8.almalinux.org/almalinux/8/latest_result/compose/AppStream/$basearch/os/
lang en_US.UTF-8
keyboard us
timezone --utc America/New_York
clearpart --all
autopart
%packages
@core
%end
rootpw anaconda
firewall --disabled
reboot
