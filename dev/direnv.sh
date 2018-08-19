#/bin/sh
set +e
git clone https://github.com/direnv/direnv
set -e
cd ./direnv
make && \
make install
