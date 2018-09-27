OUTDATED: Please refer to https://github.com/jt-nti/composer-devenv

# hyperledger-composer-box
A ready-to-go Vagrant Box (VM) for working with Hyperledger Fabric via Hyperledger Composer and Hyperledger Explorer. The setup mostly follows the guide at https://hyperledger.github.io/composer/installing/development-tools.html .

Note: The installation process is a bit complicated at the moment and there is little to no error handling. However, 
in most cases the setup should cancel if an error occurs. Still, it is advised to check the console output for errors.
Furthermore, you can't start more than one VM, because there will be conflicts with ip's and forwarded ports. You'd have to 
edit the Vagrantfile to allow multiple VM's.

## Requirements
You need Vagrant to use the VM: https://www.vagrantup.com/

## Installation
First, initialise and connect to the Vagrant VM:
```
vagrant up
vagrant ssh
```

Then, run the first setup and reload the VM (This is required to refresh permissions):
```
./setup_1.sh
exit
vagrant reload
vagrant ssh
```

After that, run the second setup:
```
./setup_2.sh
```

At last, you should check the output for errors.

## Getting started
To start a preconfigured fabric chain, run the following commands:
```
cd fabric-tools
./startFabric.sh
./createComposerProfile.sh
```

After that you should follow the developer guide at https://hyperledger.github.io/composer/tutorials/developer-guide.html .

To stop the fabric chain, run the following:
```
cd fabric-tools
./stopFabric.sh
./teardownFabric.sh
```

Additional info can be found at https://hyperledger.github.io/composer/installing/development-tools.html .


## Start the Hyperledger Playground
To start the playground, simply run `composer-playground`.

## Use Hyperledger Explorer
To use Hyperledger Explorer, follow the instructions at https://github.com/hyperledger/blockchain-explorer .
The MySQL Password is `root`.

## Additional info
The Vagrant base box used is bento ubuntu: https://app.vagrantup.com/bento/boxes/ubuntu-16.04
Hyperledger Composer: https://hyperledger.github.io/composer/
Hyperledger Fabric: https://www.hyperledger.org/projects/fabric

