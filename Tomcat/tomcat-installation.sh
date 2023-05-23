sudo apt update
sudo apt install openjdk-11-jdk -y
sudo curl -o /opt/tomcat9.tar.gz https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.74/bin/apache-tomcat-9.0.74.tar.gz
sudo tar -zxvf /opt/tomcat9.tar.gz -C /opt/
sudo rm -rf /opt/tomcat9.tar.gz
sudo mv /opt/apache-tomcat-9.0.74 /opt/tomcat9
#sudo groupadd tomcat
#sudo useradd -M -s /bin/bash -g tomcat -d /opt/tomcat9 tomcat
sudo tee /etc/systemd/system/tomcat9.service << EOF
[Unit]
Description=Apache Tomcat 9 Servlet Container
After=syslog.target network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
Environment=CATALINA_PID=/opt/tomcat9/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat9
Environment=CATALINA_BASE=/opt/tomcat9

ExecStart=/opt/tomcat9/bin/startup.sh
ExecStop=/opt/tomcat9/bin/shutdown.sh
Restart=on-failure

User=root
Group=root
UMask=0007

[Install]
WantedBy=multi-user.target
EOF

sleep 5
sudo systemctl daemon-reload
sleep 5
sudo systemctl start tomcat9
sleep 5
sudo systemctl enable tomcat9

