set -e

echo 'Performing apt-get-update...'
	sudo apt-get update
echo 'Done!'
echo '#'

echo 'Installing unzip...'
	sudo apt-get install unzip zip
echo 'Done!'
echo '#'

echo 'Installing Aptidude...'
	sudo apt-get install aptitude -y
echo 'Done!'
echo '#'

echo 'Installing Hyperledger Composer prerequisites from https://hyperledger.github.io/composer/prereqs-ubuntu.sh ...'
	curl -O https://hyperledger.github.io/composer/prereqs-ubuntu.sh
	chmod u+x prereqs-ubuntu.sh
	./prereqs-ubuntu.sh
	rm prereqs-ubuntu.sh
echo "Done! Please run 'exit', then 'vagrant reload', then 'vagrant ssh', then './setup_2.sh'"