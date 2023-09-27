# analyze_Molprobity
Setup Molprobity for local run and analyze its results
# Prepare environment
As introduce in https://github.com/rlabduke/MolProbity
1. install subversion: sudo apt-get install -y subversion
2. install gcc: sudo apt install build-essential
3. install java: sudo apt install default-jre
4. **Install php v5.6:**
  ** 4.1.** sudo apt-get install python-software-properties
  ** 4.2.** sudo add-apt-repository ppa:ondrej/php
   **4.3.** sudo apt-get install -y php5.6
  ** 4.4.** sudo apt-get install -y php5.6-common php5.6-cli php5.6-curl php5.6-mcrypt php5.6-soap php5.6-bz2 php5.6-gd php5.6-mysql php5.6-sqlite3 php5.6-json php5.6-opcache php5.6-xml php5.6-mbstring php5.6-readline php5.6-xmlrpc php5.6-zip
  ** 4.5.** Switching between installed PHP versions: sudo update-alternatives --config php
**6. Install openssl v1.0.0 or 1.0.2:**
   6.1. wget http://www.openssl.org/source/openssl-1.0.0g.tar.gz
   6.2. Unpack and install:
 tar xzvf openssl-1.0.0g.tar.gz
 cd openssl-1.0.0g
 ./config
 make
 make test
 sudo make install
Edit the file /etc/manpath.config adding the following line before the first MANPATH_MAP:
MANPATH_MAP     /usr/local/ssl/bin      /usr/local/ssl/man
# Donwnload and install Molprobity for CLI run:
1. svn --quiet --non-interactive --trust-server-cert export https://github.com/rlabduke/MolProbity.git/trunk/install_via_bootstrap.sh
2. chmod u+rx install_via_bootstrap.sh
3. ./install_via_bootstrap.sh
# Using Molprobity CLI
