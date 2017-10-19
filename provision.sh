echo '========================================'
echo '= Provisioning Hyperledger Fabric Box  ='
echo '========================================'

#echo  "Disabling IPv6"
#echo "net.ipv6.conf.all.disable_ipv6 = 1
#      net.ipv6.conf.default.disable_ipv6 = 1
#      net.ipv6.conf.lo.disable_ipv6 = 1
#      net.ipv6.conf.eth0.disable_ipv6 = 1" >> /etc/sysctl.conf
#sysctl -p
#echo "Done!"

echo "Preparing setup files"
chmod u+x setup_1.sh
chmod u+x setup_2.sh
echo "Done!"

echo "Done! Run 'vagrant ssh', then './setup_1.sh', then 'exit', then 'reload', then 'vagrant ssh' then './setup_2.sh'"





	
	
	
	








