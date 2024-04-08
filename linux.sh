# Systeminformationen in Datei speichern

# IP-Adresse
echo "IP-Adresse(n):" > file
ip addr show | grep 'inet ' | awk '{print $2}' >> file

# MAC-Adresse(n)
echo -e "\nMAC-Adresse(n):" >> file
ip link show | awk '/ether/ {print $2}' >> file

# Standard-Gateway
echo -e "\nStandard-Gateway:" >> file
ip route | awk '/default/ {print $3}' >> file

# Arbeitsspeicher
echo -e "\nVerfügbarer Arbeitsspeicher:" >> file
free -h | grep 'Mem' | awk '{print $2}' | awk '{print "Arbeitsspeicher: " $1}' >> file

# Festplattenspeicher
echo -e "\nVerfügbarer Festplattenspeicher:" >> file
df -h | grep '/dev/' | awk '{print $2}' | awk '{print "Festplattenspeicher: " $1}' >> file

# Ausgabe der gesammelten Informationen
echo "Die gesammelten Systeminformationen wurden in file gespeichert."
