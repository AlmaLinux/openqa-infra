bootloader --location=mbr
network --bootproto=dhcp
# url --mirrorlist=https://mirrors.almalinux.dev/mirrorlist/$releasever/baseos/
# install
url --url https://x86-64-v2-pungi-10.almalinux.dev/almalinux/10/x86_64_v2/latest_result_almalinux-kitten/compose/BaseOS/x86_64_v2/kickstart/
repo --name=BaseOS --baseurl=https://x86-64-v2-pungi-10.almalinux.dev/almalinux/10/x86_64_v2/latest_result_almalinux-kitten/compose/BaseOS/x86_64_v2/os/
repo --name=AppStream --baseurl=https://x86-64-v2-pungi-10.almalinux.dev/almalinux/10/x86_64_v2/latest_result_almalinux-kitten/compose/AppStream/x86_64_v2/os/
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
