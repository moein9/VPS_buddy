#!/bin/bash

## GLOBAL VARIABLES

ToolsPath="/root/tools"
mkdir $ToolsPath/VPS_buddy_trash

if [[ ! -f  $ToolsPath/VPS_buddy_trash/.update_done ]]
then 

echo "updating and upgrading"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt full-upgrade -y

touch $ToolsPath/VPS_buddy_trash/.update_done
echo "done"

fi

if [[ ! -f  $ToolsPath/VPS_buddy_trash/.common_tools ]]
then
echo "installing common tools and python and few dependencies"


echo "Installing pip"
cd ~ && curl  https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
python get-pip.py
sudo python get-pip.py
rm get-pip.py

sudo apt-get install software-properties-common
sudo apt-add-repository universe
sudo apt install python-pip
sudo apt install python3-pip
sudo apt install cargo
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install rubygems
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install libssl-dev swig -y
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs
sudo apt-get install -y httpie
sudo apt-get install curl
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install docker
sudo apt-get install dnsutils
sudo apt-get install python3-pip


sudo apt install figlet
sudo pip install snallygaster
sudo pip install py-altdns
sudo pip install dnspython==2.0.0
sudo pip install truffleHog
sudo gem install wpscan
sudo apt install transmission-cli
sudo apt install -y awscli
sudo apt install snapd
sudo apt install chromium
sudo apt install sshpass
sudo systemctl enable --now snapd apparmor
sudo pip3 install ddgr
sudo pip3 install --upgrade pycurl
sudo pip3 install s3scanner
sudo pip3 install dnsgen
sudo pip3 install arjun
sudo apt-get install neofetch
sudo apt-get install googler
sudo apt-get install nmap
sudo apt-get install sublime-text

touch $ToolsPath/VPS_buddy_trash/.common_tools
echo "done"

fi 

#create a tools folder in ~/
mkdir $ToolsPath
cd $ToolsPath/

#install go
 if [[ -z "$GOPATH" ]]
 then
cd ~
curl -O https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source $HOME/.profile

cd $ToolsPath/
git clone https://github.com/udhos/update-golang
cd update-golang
sudo ./update-golang.sh				
	
cd ~/
 fi

 if [[ -f ./bash_profile ]]
then
 cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
fi




#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"

#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "done"

#install amass
echo "Installing amass"
sudo snap install amass
export PATH=$PATH:/snap/bin

echo "done"

echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd $ToolsPath/
echo "done"



echo "installing GitDorker"
git clone https://github.com/obheda12/GitDorker.git
cd GitDorker
python3 -m pip3 install -r requirements.txt
cd $ToolsPath/
echo " done"


echo "installing 403bypasser"
git clone https://github.com/yunemse48/403bypasser.git

echo "installing LinEnum"
git clone https://github.com/rebootuser/LinEnum.git

echo "installing IIS-ShortName-Scanner"
git clone https://github.com/irsdl/IIS-ShortName-Scanner.git

echo "installing Lilly"
git clone https://github.com/Dheerajmadhukar/Lilly.git

echo "installing VHostScan"
git clone https://github.com/codingo/VHostScan.git

echo "installing Bug-Bounty-Toolz"
gti clone https://github.com/m4ll0k/Bug-Bounty-Toolz.git

echo "installing Autorize"
git clone https://github.com/Quitten/Autorize.git

echo "installing Dr.-Watson"
git clone https://github.com/prodigysml/Dr.-Watson.git

echo "installing reflector"
git clone https://github.com/elkokc/reflector.git

echo "installing BurpSuite_403Bypasser"
git clone https://github.com/sting8k/BurpSuite_403Bypasser.git

echo "installing tplmap"
git clone https://github.com/epinna/tplmap.git

echo "installing scripthunter"
git clone https://github.com/robre/scripthunter.git
echo "done"

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
echo "done"



echo "installing urlgrab"
cd $ToolsPath/
git clone https://github.com/IAmStoxe/urlgrab.git
cd urlgrab
go build 
go get -u github.com/iamstoxe/urlgrab

cd $ToolsPath/

echo "installing takeover"
git clone https://github.com/m4ll0k/takeover.git
cd takeover
python3 setup.py install

cd $ToolsPath/

echo "installing thorin"
git clone https://github.com/raoufmaklouf/Thorin.git
cd Thorin
pip3 install -r requirements.txt 
cd $ToolsPath/


echo "installing theHarvester"
git clone https://github.com/laramies/theHarvester 
cd theHarvester
python3 -m pip install -r requirements/base.txt


cd $ToolsPath/

echo "installing ParamSpider"
git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
pip3 install -r requirements.txt

cd $ToolsPath/

echo "installing x8"
git clone https://github.com/Sh1Yo/x8
cd x8
cargo build --release

cd $ToolsPath/

echo "done"


echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd $ToolsPath/
echo "done"



echo "installing SubDomainzer"
git clone https://github.com/nsonaniya2010/SubDomainizer.git
cd SubDomainizer
pip3 install -r requirements.txt
cd $ToolsPath/
echo "done"


echo "installing Linkfinder"
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
python setup.py install
pip3 install -r requirements.txt
cd $ToolsPath/
echo "done"

echo "installing apkleak"
git clone https://github.com/dwisiswant0/apkleaks
cd apkleaks/
pip install -r requirements.txt
cd $ToolsPath/
echo "done"


echo "installing Knock"
git clone https://github.com/guelfoweb/knock.git
cd knock
sudo python setup.py install
cd $ToolsPath/
echo "done"



echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd $ToolsPath/
echo "done"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd dirsearch
pip3 install -r requirements.txt
echo "done"


echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd $ToolsPath/
echo "done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd $ToolsPath/
echo "done"


echo "installing nikto"
git clone https://github.com/sullo/nikto
cd $ToolsPath/
echo "done"



echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd $ToolsPath/
echo "done"

echo "installing  impacket"
git clone https://github.com/SecureAuthCorp/impacket.git
cd impacket/
pip3 install .
cd $ToolsPath/
echo "done"

echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd $ToolsPath/
echo "done"

echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd $ToolsPath/massdns
make
sudo make install
cd $ToolsPath/
echo "done"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd $ToolsPath/asnlookup
pip install -r requirements.txt
cd $ToolsPath/
echo "done"


echo "installing live targetfinder"
git clone https://github.com/allyomalley/LiveTargetsFinder.git
cd LiveTargetsFinder
sudo pip3 install -r requirements.txt
chmod +x install_deps.sh
#there is an error in this tool which will be fixed by this line , for more info checkout https://github.com/allyomalley/LiveTargetsFinder/issues/3
sed -i '9s/^/\ngit checkout 65331fb528755621650a0fbacff12102cfdcdde9\n /' ./install_deps.sh
./install_deps.sh
cd $ToolsPath/
echo "done"

echo "installing dnsvalidator"
git clone https://github.com/vortexau/dnsvalidator.git
cd $ToolsPath/dnsvalidator
python3 setup.py install
cd $ToolsPath/
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

echo "installing ppscanner"
go get -u github.com/Raywando/ppscanner
echo "done"

echo "installing hakrawler"
go get github.com/hakluke/hakrawler
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo "installing tomnomnom tools "

cd $ToolsPath
git clone https://github.com/tomnomnom/hacks.git

cd ~/

go get github.com/tomnomnom/waybackurls
go get -u github.com/tomnomnom/assetfinder
go get -u github.com/tomnomnom/anew

go get -u github.com/tomnomnom/gf
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
mkdir .gf
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf

go get -u github.com/tomnomnom/gron
alias ungron="gron --ungron"
go get -u github.com/tomnomnom/qsreplace


echo "installing dalfox  "
go get -u github.com/hahwul/dalfox
echo "done "

echo "installing Gf-Patterns  "
cd ~/
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir ~/.gf
mv ~/Gf-Patterns/*.json ~/.gf
echo "done"

echo "installing nuclei"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
nuclei -update-templates
echo "done"

echo "installing httpx"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
echo "done"

echo "installing subfinder"
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
echo "done"


echo "installing shuffledns"
GO111MODULE=on go get -u -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
echo "done"

echo "installing gau"
GO111MODULE=on go get -u -v github.com/lc/gau
echo "done"

echo "installing puredns"
GO111MODULE=on go get github.com/d3mondev/puredns/v2
echo "done"

echo "installing ffuf"
go get github.com/ffuf/ffuf
echo "done"


echo "installing subjack"
go get github.com/haccer/subjack
echo "done"



echo "installing gospider"
go get -u github.com/jaeles-project/gospider
echo "done"

cd $ToolsPath/

echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "done"

echo "downloading Seclists and other wordlists"
cd $ToolsPath/
aws s3 sync s3://assetnote-wordlists/data/ ./assetnote-wordlists --no-sign-request
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/TheKingOfDuck/fuzzDicts.git
git clone https://github.com/tennc/fuzzdb.git 
git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/the-xentropy/samlists.git
cd $ToolsPath/SecLists/Discovery/
wget https://gist.githubusercontent.com/six2dez/a307a04a222fab5a57466c51e1569acf/raw -O subbrute
wget https://gist.githubusercontent.com/nullenc0de/96fb9e934fc16415fbda2f83f08b28e7/raw/146f367110973250785ced348455dc5173842ee4/content_discovery_nullenc0de.txt
wget https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt
cd $ToolsPath/SecLists/Discovery/DNS/
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd $ToolsPath/
echo "done"

echo "installing windscribe vpn"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
echo "deb https://repo.windscribe.com/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/windscribe-repo.list
sudo apt-get update
sudo apt-get install windscribe-cli


echo "do you want to make a list of fresh resolvers (slow) [Y] OR you want to get fastly from a github repo  (Fast) [N]?"


read -n1 -p "[y,n]" doit 
case $doit in  
  y|Y) cd $ToolsPath/dnsvalidator
dnsvalidator -tL https://public-dns.info/nameservers.txt -threads 20 -o resolvers.txt
 ;; 
  n|N) wget https://raw.githubusercontent.com/BonJarber/fresh-resolvers/main/resolvers.txt -O $ToolsPath/resolvers.txt 

 ;; 
  *) echo "enter Y for slowly making list of resolvers or N for fastly downloading it from github" ;; 
esac

echo "cleaning"
sudo apt autoremove
