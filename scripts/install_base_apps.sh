apt-get install -y firefox

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code # or code-insiders

# wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/Downloads/vscode-install.deb
# dpkg -i ~/Downloads/vscode-install.deb
# apt-get install -f
# rm ~/Downloads/vscode-install.deb
