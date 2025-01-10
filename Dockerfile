FROM swift:6.0.3-jammy as build

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y wget gpg curl
RUN wget -qO - https://patrick-zippenfenig.github.io/ecCodes-ubuntu/public.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/ecCodes-ubuntu.gpg
RUN echo "deb https://patrick-zippenfenig.github.io/ecCodes-ubuntu/ jammy main" > /etc/apt/sources.list.d/ecCodes-ubuntu.list
RUN apt update && apt install -y libnetcdf-dev libeccodes0 libbz2-dev build-essential && rm -rf /var/lib/apt/lists/*