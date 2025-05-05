FROM swift:6.1.0-jammy as build

ENV DEBIAN_FRONTEND=noninteractive
RUN <<EOF
apt update && apt install -y wget gpg curl ca-certificates lsb-release
wget -qO - https://patrick-zippenfenig.github.io/ecCodes-ubuntu/public.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/ecCodes-ubuntu.gpg
echo "deb https://patrick-zippenfenig.github.io/ecCodes-ubuntu/ jammy main" > /etc/apt/sources.list.d/ecCodes-ubuntu.list
wget https://apache.jfrog.io/artifactory/arrow/ubuntu/apache-arrow-apt-source-latest-jammy.deb
apt install -y -V ./apache-arrow-apt-source-latest-jammy.deb
apt update && apt install -y libnetcdf-dev libeccodes0 libbz2-dev build-essential libparquet-glib-dev
rm -rf /var/lib/apt/lists/*
EOF