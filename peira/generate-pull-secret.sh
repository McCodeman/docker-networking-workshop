#!/usr/bin/env bash

CONFIG_BASE64=$(openssl base64 -A -in tigera-demo-peira-auth.json)

cat > tigera-pull-secret.yaml <<EOF
apiVersion: v1
data:
  .dockerconfigjson: $CONFIG_BASE64
kind: Secret
metadata:
  namespace: peira
  name: tigera-pull-secret
type: kubernetes.io/dockerconfigjson
EOF