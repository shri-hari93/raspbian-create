# raspbian-create
To create a raspbian image with B.A.T.M.A.N configured along with the hostname and a simple simple step to make the raspberry as a worker to k3s cluster

# Steps
1. Clone the repository
2. cd raspbian-create
3. ./build-batman-node.sh -t [gateway|node] -n [hostname] -u [k3s_url] -k [k3s_token]