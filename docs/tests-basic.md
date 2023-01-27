# Basic Tests

https://open.qa has extensive documentations to customize server, tests and jobs. Some of steps are given here to head start.

## Preparation

Download one or more AlmaLinux ISOs from repo and perform some basic testing. It can be standard isos (minimal, boot or dvd) or live images (GNOME, Mini, KDE, and XFCE). Both AlmaLinux 8 and AlmaLinux 9 ISO's can be used

```sh
mkdir -p /var/lib/openqa/share/factory/iso/fixed
cd /var/lib/openqa/share/factory/iso/fixed
curl -C - -O https://repo.almalinux.org/almalinux/9/isos/x86_64/AlmaLinux-9.1-x86_64-minimal.iso 
curl -C - -O https://repo.almalinux.org/almalinux/9/isos/x86_64/AlmaLinux-9.1-x86_64-boot.iso
curl -C - -O https://repo.almalinux.org/almalinux/9/isos/x86_64/AlmaLinux-9.1-x86_64-dvd.iso 
curl -C - -O https://repo.almalinux.org/almalinux/9/isos/x86_64/CHECKSUM
shasum -a 256 --ignore-missing -c CHECKSUM
```

?> _TIP:_ Single ISO file is enough to start the testing. Choose one based on your test case.

## ISO files testing

OpenQA CLI is used to post the test. Download one or more files and make adjustment based downloaded ISO file and `FLAVOR` variable name. Possible values are `boot-iso`, `dvd-iso`, and `minimal-iso`, based on ISO variants available.

```sh
openqa-cli api -X POST isos \
  ISO=AlmaLinux-9.1-x86_64-boot.iso \
  ARCH=x86_64 \
  DISTRI=almalinux \
  FLAVOR=boot-iso \
  VERSION=9.1 \
  BUILD="-boot-$(date +%Y%m%d.%H%M%S).0"
```

Access the server web ui to review posted jobs and their details.

?> OpenQA-CLI commands helps to query the jobs using APIs.

```sh
openqa-cli api -X GET --pretty jobs/overview
openqa-cli api -X GET --pretty jobs/1
```