set -e

echo 'Installing Composer CLI...'
	npm install -g composer-cli
echo 'Done!'
echo '#'

echo 'Installing Composer Generator...'
	npm install -g generator-hyperledger-composer
echo 'Done!'
echo '#'

echo 'Installing Composer Rest Server...'
	npm install -g composer-rest-server
echo 'Done!'
echo '#'

echo 'Installing Yeoman...'
	npm install -g yo
echo 'Done!'
echo '#'

echo 'Installing Composer Playground...'
	npm install -g composer-playground
echo 'Done!'
echo '#'

echo 'Cleaning possible created docker environments...'
	set +e
	sudo docker kill $(docker ps -q)
	sudo docker rm $(docker ps -aq)
	sudo docker rmi $(docker images dev-* -q)
	set -e
echo 'Done!'
echo '#'

echo 'Installing fabric-tools...'
	cd ~/
	mkdir ~/fabric-tools
	cd ~/fabric-tools
	curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.zip
	unzip fabric-dev-servers.zip
	rm fabric-dev-servers.zip
	cd ~/fabric-tools
	./downloadFabric.sh
	./startFabric.sh
	./createComposerProfile.sh
	cd ~/fabric-tools
	./stopFabric.sh
	./teardownFabric.sh
	cd ~/
echo 'Done!'
echo '#'

echo 'Installing MySQL'
	sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
	sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
	sudo apt-get install mysql-server -y
echo 'Done!'

echo 'Downloading Hyperledger Explorer'
	git clone https://github.com/hyperledger/blockchain-explorer.git
	cd blockchain-explorer
	cd ~/
echo 'Done!'

echo 'Installing playground...'
	set +e
	docker ps -aq | xargs docker rm -f
	docker images -aq | xargs docker rmi -f
	set -e	
	mkdir ~/playground
	cd ~/playground
	curl -sSL https://hyperledger.github.io/composer/install-hlfv1.sh | bash	
	set +e
	docker ps -aq | xargs docker rm -f
	docker images -aq | xargs docker rmi -f	
	set -e
echo 'Done!'
set -e

echo '----------------------------------------'
echo '--- Hyperledger Fabric Box is ready! ---'
echo '----------------------------------------'
echo 'Please check the log for errors, than run exit, then run vagrant reload.'