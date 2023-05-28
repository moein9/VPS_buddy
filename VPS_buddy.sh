#!/bin/bash

## GLOBAL VARIABLES

ToolsPath="/root/tools"
mkdir $ToolsPath 2>/dev/null
mkdir $ToolsPath/VPS_buddy
mkdir /root/codes
mkdir /root/targets




if [[ ! -f  $ToolsPath/VPS_buddy/update_done ]]
then 

echo "updating and upgrading"
apt-get -y update
apt-get -y upgrade
apt-get -y install sudo
sudo apt -y install git-all
sudo apt full-upgrade -y

touch $ToolsPath/VPS_buddy/update_done
echo "done"

fi


#set -e
#the above line id for exit on error un comment it if you want it ,it is better to exit if an error detected IMO.


if [[ ! -f $ToolsPath/VPS_buddy/common_tools ]]; then
    echo "Installing common tools and Python and few dependencies"
    
     # Install common packages
    APT_INSTALL="sudo apt-get install -y"
    PIP_INSTALL="pip3 install"
    PACKAGES="cargo jq ruby-full rubygems libcurl4-openssl-dev libssl-dev libxml2 libxml2-dev libxslt1-dev build-essential libgmp-dev zlib1g-dev dnsutils ghex parallel python2 python3 python-is-python3"
    for pkg in $PACKAGES; do
        $APT_INSTALL $pkg
    done


    # Install pip
    cd ~ && curl  https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
    python get-pip.py
    python3 get-pip.py
    rm get-pip.py
    pip3 install --upgrade pip

   
    # Install Python packages
    $PIP_INSTALL snallygaster py-altdns truffleHog dnspython==2.0.0 ddgr s3scanner dnsgen arjun aiohttp aiodns

    # Install docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh

    # Install other packages
    $APT_INSTALL transmission-cli awscli snapd sshpass neofetch googler nmap wget figlet

    # Install wpscan
    gem install wpscan

    # Enable snapd
    systemctl enable --now snapd apparmor

    touch $ToolsPath/VPS_buddy/common_tools
    echo "Done"
fi





# Check if Go is already installed
if ! command -v go &> /dev/null; then
  echo "Installing Go"
  
  # Determine the machine architecture
  machine_arch="$(uname -m)"
  
  # Set the appropriate download URL based on the machine architecture
  case "${machine_arch}" in
    "x86_64")
      download_url="https://go.dev/dl/go1.20.4.linux-amd64.tar.gz"
      ;;
    "aarch64")
      download_url="https://go.dev/dl/go1.20.4.linux-arm64.tar.gz"
      ;;
    "i386"|"i686")
      download_url="https://go.dev/dl/go1.20.4.linux-386.tar.gz"
      ;;
    "arm64")
      download_url="https://go.dev/dl/go1.20.4.darwin-arm64.tar.gz"
      ;;
    *)
      echo "Unsupported machine architecture: ${machine_arch}"
      exit 1
      ;;
  esac

  # Download and extract the appropriate version of Go
  curl -L -s "${download_url}" -o go.tar.gz
  sudo tar -C /usr/local -xzf go.tar.gz

  # Set up environment variables
  export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
  echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.bashrc
  source ~/.bashrc
fi

 if [[ -f ./bash_profile ]]
then
 cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
fi

#create a tools folder in ~/
#mkdir $ToolsPath
cd $ToolsPath/

go env -w GO111MODULE=auto
export GO111MODULE="on"

# Install Aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "Aquatone installed"

# Install Chromium
echo "Installing Chromium"
sudo snap install chromium
echo "Chromium installed"

# Install Amass
echo "Installing Amass"
sudo snap install amass
export PATH=$PATH:/snap/bin
echo "Amass installed"

# Install JSParser
echo "Installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser
sudo python setup.py install
cd ..
echo "JSParser installed"

# Install GitDorker
echo "Installing GitDorker"
git clone https://github.com/obheda12/GitDorker.git
cd GitDorker
python3 -m pip install -r requirements.txt
cd ..
echo "GitDorker installed"

# Install smuggler
echo "Installing smuggler"
git clone https://github.com/defparam/smuggler.git
echo "smuggler installed"

# Install 403bypasser
echo "Installing 403bypasser"
git clone https://github.com/yunemse48/403bypasser.git
echo "403bypasser installed"

# Install LinEnum
echo "Installing LinEnum"
git clone https://github.com/rebootuser/LinEnum.git
echo "LinEnum installed"

# Install IIS-ShortName-Scanner
echo "Installing IIS-ShortName-Scanner"
git clone https://github.com/irsdl/IIS-ShortName-Scanner.git
echo "IIS-ShortName-Scanner installed"

# Install Lilly
echo "Installing Lilly"
git clone https://github.com/Dheerajmadhukar/Lilly.git
echo "Lilly installed"

# Install VHostScan
echo "Installing VHostScan"
git clone https://github.com/codingo/VHostScan.git
echo "VHostScan installed"

# Install Bug-Bounty-Toolz
echo "Installing Bug-Bounty-Toolz"
git clone https://github.com/m4ll0k/Bug-Bounty-Toolz.git
echo "Bug-Bounty-Toolz installed"

# Install Autorize
echo "Installing Autorize"
git clone https://github.com/Quitten/Autorize.git
echo "Autorize installed"

# Install Dr.-Watson
echo "Installing Dr.-Watson"
git clone https://github.com/prodigysml/Dr.-Watson.git
echo "Dr.-Watson installed"

# Install Reflector
echo "Installing Reflector"
git clone https://github.com/elkokc/reflector.git
echo "Reflector installed"

# Install BurpSuite_403Bypasser
echo "Installing BurpSuite_403Bypasser"
git clone https://github.com/sting8k/BurpSuite_403Bypasser.git
echo "BurpSuite_403Bypasser installed"

# Install tplmap
echo "Installing tplmap"
git clone https://github.com/epinna/tplmap.git
echo "tplmap installed"

# Install scripthunter
echo "Installing scripthunter"
git clone https://github.com/robre/scripthunter.git
echo "scripthunter installed"

# Install Sublist3r
echo "Installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip install -r requirements.txt
cd ..
echo "Sublist3r installed"

echo "Installing urlgrab"
cd $ToolsPath/
git clone https://github.com/IAmStoxe/urlgrab.git
cd urlgrab
go build
go install

cd $ToolsPath/

echo "Installing takeover"
git clone https://github.com/m4ll0k/takeover.git
cd takeover
python3 -m pip install -r requirements.txt
python3 setup.py install

cd $ToolsPath/

echo "Installing thorin"
git clone https://github.com/raoufmaklouf/Thorin.git
cd Thorin
python3 -m pip install -r requirements.txt

cd $ToolsPath/

echo "Installing crlfuzz"
git clone https://github.com/dwisiswant0/crlfuzz
cd crlfuzz/cmd/crlfuzz
go build .
sudo mv crlfuzz /usr/local/bin
cd $ToolsPath/

echo "Installing theHarvester"
git clone https://github.com/laramies/theHarvester
cd theHarvester
python3 -m pip install -r requirements/base.txt

cd $ToolsPath/

echo "Installing ParamSpider"
git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
python3 -m pip install -r requirements.txt

cd $ToolsPath/

echo "Installing x8"
git clone https://github.com/Sh1Yo/x8
cd x8
cargo build --release

cd $ToolsPath/

echo "Installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git

cd $ToolsPath/

echo "Installing SubDomainizer"
git clone https://github.com/nsonaniya2010/SubDomainizer.git
cd SubDomainizer
python3 -m pip install -r requirements.txt

cd $ToolsPath/

echo "Installing Linkfinder"
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
python3 setup.py install
python3 -m pip install -r requirements.txt

cd $ToolsPath/

echo "Installing apkleak"
git clone https://github.com/dwisiswant0/apkleaks
cd apkleaks/
python3 -m pip install -r requirements.txt

cd $ToolsPath/

echo "Installing Knock"
git clone https://github.com/guelfoweb/knock.git
cd knock
sudo python3 setup.py install

cd $ToolsPath/

echo "Installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan
sudo gem install bundler && bundle install --without test

cd $ToolsPath/

echo "Installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git

cd $ToolsPath/

echo "Installing lazys3"
git clone https://github.com/nahamsec/lazys3.git

cd $ToolsPath/

echo "Installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git

cd $ToolsPath/

echo "Installing nikto"
git clone https://github.com/sullo/nikto.git

cd $ToolsPath/

echo "Installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev

cd $ToolsPath/
echo "Installing Impacket..."
git clone https://github.com/SecureAuthCorp/impacket.git
cd impacket/
pip3 install .
cd $ToolsPath/
echo "Impacket installed successfully."

echo "Installing Lazyrecon..."
git clone https://github.com/nahamsec/lazyrecon.git
cd lazyrecon/
echo "Lazyrecon installed successfully."

echo "Installing Nmap..."
sudo apt-get install -y nmap
echo "Nmap installed successfully."

echo "Installing Massdns..."
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
sudo make install
cd $ToolsPath/
echo "Massdns installed successfully."

echo "Cloning Bug Bounty Toolz..."
git clone https://github.com/m4ll0k/BBTz.git
echo "Bug Bounty Toolz cloned successfully."

echo "Installing ASNlookup..."
git clone https://github.com/yassineaboukir/asnlookup.git
cd asnlookup/
pip install -r requirements.txt
cd $ToolsPath/
echo "ASNlookup installed successfully."


echo "installing live targetfinder"
git clone https://github.com/allyomalley/LiveTargetsFinder.git
cd LiveTargetsFinder
sudo pip3 install -r requirements.txt
chmod +x install_deps.sh
#there is an error in this tool which will be fixed by this line , for more info checkout https://github.com/allyomalley/LiveTargetsFinder/issues/3
sed -i '10s/^/\ngit checkout 65331fb528755621650a0fbacff12102cfdcdde9\n /' ./install_deps.sh
./install_deps.sh
cd $ToolsPath/
echo "done"

echo "Installing Dnsvalidator..."
git clone https://github.com/vortexau/dnsvalidator.git
cd dnsvalidator/
python3 setup.py install
cd $ToolsPath/
echo "Dnsvalidator installed successfully."

echo "Installing Httprobe..."
go get -u github.com/tomnomnom/httprobe
echo "Httprobe installed successfully."

echo "Installing Ppscanner..."
go get -u github.com/Raywando/ppscanner
echo "Ppscanner installed successfully."

echo "Installing Hakrawler..."
go get github.com/hakluke/hakrawler
echo "Hakrawler installed successfully."

echo "Installing Protoscan..."
go get github.com/KathanP19/protoscan
echo "Protoscan installed successfully."

echo "Installing Unfurl..."
go install github.com/tomnomnom/unfurl@latest
echo "Unfurl installed successfully."

echo "Installing Tomnomnom Tools..."
cd $ToolsPath
git clone https://github.com/tomnomnom/hacks.git
echo "Tomnomnom Tools installed successfully."


# Install Tomnomnom tools
cd ~/
go get github.com/tomnomnom/waybackurls
go get -u github.com/tomnomnom/assetfinder
go install -v github.com/tomnomnom/anew@latest
go get -u github.com/tomnomnom/gf
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
mkdir .gf
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf
go get -u github.com/tomnomnom/gron
alias ungron="gron --ungron"
go get -u github.com/tomnomnom/qsreplace

# Install other tools
echo "Installing dalfox"
go get -u github.com/hahwul/dalfox
echo "Done"

echo "Installing Gf-Patterns"
cd ~/
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir ~/.gf
mv ~/Gf-Patterns/*.json ~/.gf
echo "Done"

echo "Installing nuclei"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

nuclei -update-templates
echo "Done"

echo "Installing httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "Done"

echo "Installing subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "Done"

echo "Installing uncover"
go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest
echo "done"

echo "Installing shuffledns"
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
echo "Done"

echo "Installing gau"
$ go install github.com/lc/gau/v2/cmd/gau@latest
echo "Done"

echo "Installing puredns"
go install github.com/d3mondev/puredns/v2@latest
echo "Done"

echo "Installing ffuf"
go install github.com/ffuf/ffuf/v2@latest
echo "Done"

echo "Installing subjack"
go get github.com/haccer/subjack
echo "Done"

echo "Installing gospider"
go get -u github.com/jaeles-project/gospider
echo "Done"

cd $ToolsPath/

echo "Installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "Done"



echo "downloading Seclists and other wordlists"
cd $ToolsPath/
aws s3 sync s3://assetnote-wordlists/data/ ./assetnote-wordlists --no-sign-request
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/TheKingOfDuck/fuzzDicts.git
git clone https://github.com/tennc/fuzzdb.git 
git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/the-xentropy/samlists.git
cd $ToolsPath/SecLists/Discovery/
wget https://raw.githubusercontent.com/rbsec/dnscan/master/tlds.txt
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
dnsvalidator -tL https://public-dns.info/nameservers.txt -threads 20 -o $ToolsPath/resolvers.txt
 ;; 
  n|N) wget https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt -O $ToolsPath/resolvers.txt 

 ;; 
  *) echo "none of them excuted" ;; 
esac

echo "cleaning"
sudo apt autoremove

echo "don't forget amass config.ini (/root/tools/config.ini)"
echo "don't forget uncover provider-config.yaml (/root/.config/uncover/provider-config.yaml)"
echo "don't forget subfinder provider-config.yaml (/.config/subfinder/provider-config.yaml)"



