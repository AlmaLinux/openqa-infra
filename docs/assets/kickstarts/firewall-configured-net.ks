bootloader --location=mbr
network --bootproto=dhcp
# install
cdrom
lang en_US.UTF-8
keyboard us
timezone --utc America/New_York
clearpart --all
autopart
%packages
@core
%end
rootpw anaconda
firewall --port=imap:tcp,1234:udp,47 --service=ftp
reboot
