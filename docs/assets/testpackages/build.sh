set -e
dnf -y -q install rpm-build createrepo_c >/dev/null
rpmbuild -bb --define "_topdir /tmp/rb" --define "_binary_payload w9.gzdio" /src/units.spec >/dev/null
mkdir -p /out/openqa-testrepo-1
cp /tmp/rb/RPMS/noarch/units-1-1.noarch.rpm /out/openqa-testrepo-1/
createrepo_c -q --general-compress-type=gz --checksum=sha256 --no-database /out/openqa-testrepo-1
rpm -qp --info --requires --list /out/openqa-testrepo-1/units-1-1.noarch.rpm | grep -E '^(Name|Version|Release|Arch|Size)|rpmlib|units|no files'
ls -R /out
