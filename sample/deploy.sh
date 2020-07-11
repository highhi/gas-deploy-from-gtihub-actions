#!/bin/bash

# このコメントがついたdeployment idがwebappとして公開されているバージョンと判断する
# 「web app meta-version」はスクリプトエディタで公開したときに付与されるコメントと同じ
DESCRIPTION='web app meta-version'

deployments=$(clasp deployments)
regexp="- ([0-9a-zA-Z_-]+) @[0-9] - ${DESCRIPTION}"

if [[ ${deployments} =~ ${regexp} ]]; then
  id=${BASH_REMATCH[1]}
  echo ${id}
  clasp push
  # 必ずDESCRIPTIONを" "で囲む
  clasp deploy -i ${id} -d "${DESCRIPTION}"
else
  echo "Could not be deployed. No valid deployment ID was found."
  exit 1;
fi