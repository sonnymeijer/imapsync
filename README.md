# imapsync

## Install imapsync
bash <( curl -sSL https://raw.githubusercontent.com/sonnymeijer/imapsync/master/install_imapsync.sh )

## Download mailsync script
wget https://raw.githubusercontent.com/sonnymeijer/imapsync/master/syncmail -P /usr/local/bin && chmod +x /usr/local/bin/syncmail

## Execute
/usr/local/bin/syncmail <source@domain.com> <sourceserver.domain.com> <destination@domain.com> <destinationserver.domain.com>
