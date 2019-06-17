wget https://dl.google.com/go/go1.11.11.linux-arm64.tar.gz
sudo tar -C /usr/local -xzf go1.11.11.linux-arm64.tar.gz
export PATH=$PATH:/usr/local/go/bin

sudo snap install docker --classic
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock
sudo apt install make

git clone https://github.com/RaspiRepo/fabric-baseimage.git
make docker

docker tag hyperledger/fabric-baseos:latest hyperledger/fabric-baseos:arm64-0.4.16
docker tag hyperledger/fabric-basejvm:latest hyperledger/fabric-basejvm:arm64-0.4.16
docker tag hyperledger/fabric-baseimage:latest hyperledger/fabric-baseimage:arm64-0.4.16

mkdir -p github.com/hyperledger
cd github.com/hyperledger
git clone https://github.com/RaspiRepo/fabric.git
cd fabric/
make docker

docker tag hyperledger/fabric-baseimage:latest  mkdocker2020/fabric-baseimage:arm64-0.4.16
docker push mkdocker2020/fabric-baseimage:arm64-0.4.16

docker tag hyperledger/fabric-basejvm:latest  mkdocker2020/fabric-basejvm:arm64-0.4.16
docker push mkdocker2020/fabric-basejvm:arm64-0.4.16

docker tag hyperledger/fabric-baseos:latest mkdocker2020/fabric-baseos:arm64-0.4.16
docker push mkdocker2020/fabric-baseos:arm64-0.4.16

docker tag hyperledger/fabric-tools:arm64-latest mkdocker2020/fabric-tools:arm64-1.4.2
docker push mkdocker2020/fabric-tools:arm64-1.4.2

docker tag hyperledger/fabric-buildenv:arm64-latest mkdocker2020/fabric-buildenv:arm64-1.4.2
docker push mkdocker2020/fabric-buildenv:arm64-1.4.2

docker tag hyperledger/fabric-ccenv:arm64-latest mkdocker2020/fabric-ccenv:arm64-1.4.2
docker push mkdocker2020/fabric-ccenv:arm64-1.4.2

docker tag hyperledger/fabric-orderer:arm64-latest mkdocker2020/fabric-orderer:arm64-1.4.2
docker push mkdocker2020/fabric-orderer:arm64-1.4.2

docker tag hyperledger/fabric-peer:arm64-latest mkdocker2020/fabric-peer:arm64-1.4.2
docker push mkdocker2020/fabric-peer:arm64-1.4.2
