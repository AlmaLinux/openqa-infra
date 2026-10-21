# openQA test packages

`openqa-testrepo-1` holds a dummy `units-1-1.noarch` package used by the
update tests (`lib/packagetest.pm` in the distri): the tests install it from
this repo, then update it to the real `units` from BaseOS. `units` is in
BaseOS for every arch on AlmaLinux 8, 9 and 10, and is not installed by
default (only optional in the `scientific` comps group).

This replaces Fedora's `acpica-tools` dummy, which could not be updated on
s390x because AlmaLinux 10 does not ship `acpica-tools` for that arch.

Rebuild (from this directory):

    docker run --rm -v $PWD:/src:ro -v $PWD/..:/out almalinux:9 bash /src/build.sh
