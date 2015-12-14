ID=$(sudo docker run -d $2 boynux:nginx)
PID=$(docker inspect -f '{{.State.Pid}}' $ID)

sudo mkdir -p /var/run/netns
sudo ln -sf /proc/$PID/ns/net /var/run/netns/$PID

sudo ip netns exec $PID ip addr add $1/32 dev lo

echo $ID

