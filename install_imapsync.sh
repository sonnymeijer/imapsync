#!/bin/bash

# check if script is executed as root
myuid="$(/usr/bin/id -u)"
if [[ "${myuid}" != 0 ]]; then
    echo -e "\n[ Error ] This script must be run as root.\n"
    exit 0;
fi

# install prerequisites
apt-get install git rcs make makepasswd cpanminus

apt-get install libauthen-ntlm-perl \
     libclass-load-perl libcrypt-ssleay-perl liburi-perl \
     libdata-uniqid-perl libdigest-hmac-perl libdist-checkconflicts-perl \
     libfile-copy-recursive-perl libio-compress-perl libio-socket-inet6-perl \
     libio-socket-ssl-perl libio-tee-perl libmail-imapclient-perl \
     libmodule-scandeps-perl libnet-ssleay-perl libpar-packer-perl \
     libreadonly-perl libsys-meminfo-perl libterm-readkey-perl \
     libtest-fatal-perl libtest-mock-guard-perl libtest-pod-perl \
     libtest-requires-perl libtest-simple-perl libunicode-string-perl \
     libssl-dev libperl-dev

# install required Python modules using CPAN
cpanm Mail::IMAPClient JSON::WebToken Test::MockObject
cpanm Unicode::String Data::Uniqid Crypt::OpenSSL::RSA Crypt::OpenSSL::Random JSON::WebToken::Crypt::RSA Package::Stash::XS Regexp::Common

# install imapsync
cd /usr/src/
git clone https://github.com/imapsync/imapsync.git
cd imapsync
mkdir -p dist
make install

# done
exit
