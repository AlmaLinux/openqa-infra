# OpenQA Setup Tests

OpenQA installation can be used for one more product test(s).

## Install AlmaLinux tests

The server web ui and worker is installed and configured, proceed to import and test almalinux openqa test scripts.

1. Clone project
   * Clone repo
   * Update folder owner access to OpenQA test user
   * Checkout to a fix branch as needed
2. Import project into OpenQA
3. Download required ISO to test
4. Use OpenQA-Cli to invoke test

!> Large repo size warning! Due to this project's nature, it might take some time to clone it. Adjust the clone step as needed. For example, add `--depth=1` for shallow copy and quick test. Switch to a new branch for a new test.

?> Add `sudo` when doing setup on server environment. 

?> `docker exec -ti openqa_webui /bin/bash` - Log into server console using containers

### Step 1

Step 1: Clone repo, update folder owner to openqa test user.

```sh
cd /var/lib/openqa/tests/
git clone --single-branch --branch=dev https://github.com/AlmaLinux/os-autoinst-distri-almalinux.git almalinux
chown -R geekotest:geekotest almalinux
cd almalinux
git config --global --add safe.directory /var/lib/openqa/share/tests/almalinux
git checkout -b testNNN
```

### Step 2

Step 2: import almalinux test templates.

```sh
cd /var/lib/openqa/tests/almalinux 
./fifloader.py -l -c templates.fif.json templates-updates.fif.json
```

### Step 3

Download one or more AlmaLinux ISOs from repo and perform some basic testing.

```sh
mkdir -p /var/lib/openqa/share/factory/iso/fixed
cd /var/lib/openqa/share/factory/iso/fixed
curl -C - -O https://repo.almalinux.org/almalinux/9/isos/x86_64/AlmaLinux-9.1-x86_64-boot.iso
curl -C - -O https://repo.almalinux.org/almalinux/9/isos/x86_64/AlmaLinux-9.1-x86_64-minimal.iso 
curl -C - -O https://repo.almalinux.org/almalinux/9/isos/x86_64/AlmaLinux-9.1-x86_64-dvd.iso 
curl -C - -O https://repo.almalinux.org/almalinux/9/isos/x86_64/CHECKSUM
shasum -a 256 --ignore-missing -c CHECKSUM
```

?> _TIP:_ Single ISO file is enough to start the testing. Choose one based on your test case.

### Step 4

In this step we
Make adjustment based downloaded ISO file and `FLAVOR` variable name. Possible values are `boot-iso`, `dvd-iso`, and `minimal-iso`, based on ISO variants available.

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
