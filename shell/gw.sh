ip=$(ifconfig ppp0 | awk '$2 ~/172/ {print $2}')
r=$(sudo route add -net 10.1.2.0/24 $ip)
echo $r
