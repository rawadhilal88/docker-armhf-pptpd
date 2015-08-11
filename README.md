This docker file enables you to easily configure a pptpd docker container.
<br/>
To run it call:
<br/>
<code>
docker run --name pptpd --privileged -p 1723:1723 -v /opt/ppptd/etc/ppp/chap-secrets:/etc/ppp/chap-secrets eagos/armhf-pptpd
</code>

<br/>
The following is an example of a systemd service.
```
[Unit]
Description=Docker server.
After=docker.service

[Service]
ExecStartPre=-/usr/local/bin/docker rm pptpd
ExecStart=/usr/local/bin/docker run --name pptpd --privileged -p 1723:1723 -v /opt/ppptd/etc/ppp/chap-secrets:/etc/ppp/chap-secrets eagos/armhf-pptpd 
Restart=on-failure
TimeoutSec=20

[Install]
WantedBy=multi-user.target
```
