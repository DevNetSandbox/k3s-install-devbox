#open firewall temporarily
sudo iptables -P OUTPUT ACCEPT

# k3s install and developer association
wget -O /home/developer/k3s https://github.com/rancher/k3s/releases/download/v0.10.0/k3s
chmod +x /home/developer/k3s
chown developer /home/developer/k3s

# Make sure BashRC profile exists
FILE=/home/developer/.bashrc
if [ -f "$FILE" ]; then
    # k3s add to path
    sudo echo "export PATH=/home/developer:$PATH" >> /home/developer/.bashrc
else 
    # add bash profile
    sudo touch /home/developer/.bashrc
    
    # k3s add to path
    sudo echo "export PATH=/home/developer:$PATH" >> /home/developer/.bashrc
fi

#shutdown outbound firewall
sudo iptables -P OUTPUT REJECT
