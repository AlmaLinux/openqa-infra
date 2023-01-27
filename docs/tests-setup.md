# OpenQA Setup Tests

OpenQA installation can be used for one more product test(s).

## Install AlmaLinux tests

The server web ui and worker is installed and configured, proceed to import and test almalinux openqa test scripts.

* Clone project and setup tests
   * Clone repo
   * Update folder owner access to OpenQA test user
   * Checkout to a fix branch as needed
* Import project into OpenQA 
  * Machine definitions
  * test suits
  * job group
  * schedules


!> Large repo size warning! Due to this project's nature, it might take some time to clone it. Adjust the clone step as needed. For example, add `--depth=1` for shallow copy and quick test. Switch to a new branch for a new test.

?> Add `sudo` when doing setup on server environment. 

?> `docker exec -ti openqa_webui /bin/bash` - Log into server console using containers

### Clone Repo

Step 1: Clone repo, update folder owner to openqa test user.

```sh
cd /var/lib/openqa/tests/
git clone --single-branch --branch=dev https://github.com/AlmaLinux/os-autoinst-distri-almalinux.git almalinux
chown -R geekotest:geekotest almalinux
cd almalinux
git config --global --add safe.directory /var/lib/openqa/share/tests/almalinux
git checkout -b testNNN
```

### Load templates

Project uses Fedora Intermediate Format for templating of definitions (Machine definitions, test suites,jobs and job groups). Import almalinux test templates using `fifloader.py` loader.

```sh
cd /var/lib/openqa/tests/almalinux 
./fifloader.py -l -c templates.fif.json templates-updates.fif.json
```

?> _NOTE:_ `client.conf` should contains valid api keys/secrets prior to upload of templates.

### Next steps

After successful import of the project and load and initilizing the templates, system is ready for OpenQA testing.
Proceed to [next steps](tests-basic.md).

* Download required ISO to test
* Use OpenQA-Cli to invoke test
