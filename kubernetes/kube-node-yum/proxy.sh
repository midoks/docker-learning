#!/bin/bash


MASTER_ADDRESS=${1:-"8.8.8.18"}
NODE_ADDRESS=${2:-"8.8.8.20"}

cat <<EOF >/opt/kubernetes/cfg/kube-proxy
#启动日志标准错误
KUBE_LOGTOSTDERR="--logtostderr=true"

#日志级别
KUBE_LOG_LEVEL="--v=4"

#Kuberlet服务器IP地址
NODE_HOSTNAME="--hostname-override=${NODE_ADDRESS}"

#MASTER地址
KUBE_MASTER="--master=http://${MASTER_ADDRESS}:8080"
EOF

KUBE_PROXY_OPTS="   \${KUBE_LOGTOSTDERR} \\
                    \${KUBE_LOG_LEVEL}   \\
                    \${NODE_HOSTNAME}    \\
                    \${KUBE_MASTER}"

cat <<EOF >/usr/lib/systemd/system/kube-proxy.service
[Unit]
Description=Kubernetes Proxy
After=network.target

[Service]
EnvironmentFile=-/opt/kubernetes/cfg/kube-proxy
ExecStart=/bin/kube-proxy ${KUBE_PROXY_OPTS}
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable kube-proxy
systemctl restart kube-proxy
