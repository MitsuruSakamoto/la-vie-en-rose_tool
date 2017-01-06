#!/bin/bash

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
  echo "指定された引数は$#個です" 1>&2
  echo "実行するにはブランチの名称を第一引数として設定する必要があります" 1>&2
  echo "第二引数は置換用ドメインの指定です(任意指定)。指定がない場合は置換しないのでpublic_html/test配下のテスト用htmlからはs.sh.adingo.jpへ広告取得リクエストが飛びます。" 1>&2
  exit 0;
fi

if [ $# -ge 1 ]; then
  BRANCH=$1
  # Build artifact
  echo "target branch: $BRANCH"

  sudo su -l fluct -c "make -C /home/fluct/deployment/dlv/ artifact BRANCH=$BRANCH"
  # Deploy
  sudo su -l fluct -c "make -C /home/fluct/deployment/dlv/ deploy BRANCH=$BRANCH"
fi

if [ $# -ge 2 ]; then
  MYDOMAIN=$2
  echo "replace domain: $MYDOMAIN"
  grep  -l 's.sh.adingo.jp' /xfs0/home/fluct_dlv/sh/public_html/test/adnw/*/*.html | sudo xargs sed -i.bak -e "s/s.sh.adingo.jp/$MYDOMAIN/g"
  grep  -l 's.sh.adingo.jp' /xfs0/home/fluct_dlv/sh/public_html/test/dsp/*/*.html | sudo xargs sed -i.bak -e "s/s.sh.adingo.jp/$MYDOMAIN/g"
fi
