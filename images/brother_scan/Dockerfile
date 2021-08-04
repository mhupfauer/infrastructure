FROM debian:stable-slim

RUN apt-get update && \
    apt-get install sane-utils imagemagick htop iputils-ping -y

COPY br* /root/

WORKDIR /root

RUN dpkg -i --force-all brscan4-0.4.10-1.amd64.deb && \
    dpkg -i --force-all brscan-skey-0.3.1-2.amd64.deb && \
    apt-get install -f

RUN useradd -rm brscan-skey && \
    gpasswd -a brscan-skey scanner

RUN brsaneconfig4 -a name=Scanner model=MFC-L2710DW ip=192.168.178.40

RUN echo ATTR{idVendor}=="04f9", MODE="0666", GROUP="scanner", ENV{libsane_matched}="yes", SYMLINK+="scanner-%k" > /etc/udev/rules.d/60-brother-libsane-type1.rules

COPY entry.sh /home/brscan-skey
COPY scantofile.sh /opt/brother/scanner/brscan-skey/script/
COPY brscan-skey.config /opt/brother/scanner/brscan-skey

RUN mkdir /consume && \
    mkdir /var/log/brother && \
    touch /var/log/brother/scan_scr.log && \
    chown brscan-skey -R /var/log/brother && \
    chown brscan-skey -R /consume && \
    chown brscan-skey -R /var/log/brother && \
    chmod 777 /consume && \
    chmod +x /opt/brother/scanner/brscan-skey/script/scantofile.sh && \
    chmod +x /home/brscan-skey/entry.sh

WORKDIR /home/brscan-skey

ENTRYPOINT ["./entry.sh"]
