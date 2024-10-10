bootloader --location=mbr
network --bootproto=dhcp
# url --mirrorlist=https://mirrors.almalinux.dev/mirrorlist/$releasever/baseos/
# install
url --url https://$basearch-pungi-9.almalinux.dev/almalinux/9/$basearch/latest_result_almalinux/compose/BaseOS/$basearch/kickstart/
repo --name=BaseOS --baseurl=https://$basearch-pungi-9.almalinux.dev/almalinux/9/$basearch/latest_result_almalinux/compose/BaseOS/$basearch/os/
repo --name=AppStream --baseurl=https://$basearch-pungi-9.almalinux.dev/almalinux/9/$basearch/latest_result_almalinux/compose/AppStream/$basearch/os/
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
