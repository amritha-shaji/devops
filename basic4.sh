dir_name="Tools"
if [ -d "$dir_name" ]; then
echo -e " \e[1;31m Directory already exists \e[0m" #red
else
`mkdir -p $dir_name`;
echo -e "\e[1;32m $dir_name directory is created \e[0m"

fi
cd Tools
echo -e "\e[0;36m Setting up Anydesk repository \e[0m" #cyan
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
echo -e "\e[1;32m Added Anydesk repository Successfully  \e[0m" #green

#download packet tracer
echo -e "\e[0;36m Downloading packet tracer \e[0m" #cyan
wget https://my.opendesktop.org/s/wDRLrNPPSgjd5ps/download/cpt.deb 
packet=cpt.deb
if [[ -f "$packet" ]]; then
    echo -e "\e[1;32m packet tracer Download Successfully  \e[0m" #green
else
echo -e " \e[1;31m Not Downloaded \e[0m" #red
fi
