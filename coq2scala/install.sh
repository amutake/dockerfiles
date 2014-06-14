#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
apt-get install -y build-essential curl m4 git
curl -kL https://raw.github.com/hcarty/ocamlbrew/master/ocamlbrew-install | env OCAMLBREW_BASE="/opt/ocamlbrew" OCAMLBREW_FLAGS="-o -n ocaml" bash
export PATH=/opt/ocamlbrew/ocaml/bin:$PATH
git clone git://github.com/hemmi/coq2scala.git /opt/coq2scala
cd /opt/coq2scala/coq-*
./configure -prefix /opt/coq
make world
make install

echo "export PATH=/opt/coq/bin:/opt/ocamlbrew/ocaml/bin:$PATH" > /etc/profile.d/coq2scala.sh
