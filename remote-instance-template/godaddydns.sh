cd ~/terraform/remote-instance-template

terraform apply -auto-approve -var-file="variables.tfvars"

sleep 1m

domain="aaronhorne.co"                              # your domain
type="A"                                            # Record type A, CNAME, MX, etc.
name="ssh"                                            # name of record to update
ttl="3600"                                          # Time to Live min value 600
port="1"                                            # Required port, Min value 1
weight="1"                                          # Required weight, Min value 1
key="$(cat keyfile.txt | awk '{print $1}')"         # key for godaddy developer API
secret="$(cat keyfile.txt | awk '{print $2}')"      # secret for godaddy developer API
headers="Authorization: sso-key $key:$secret"

currentIp=$(cat public_ips.txt)
echo " @ currentIp:" $currentIp

curl -X PUT "https://api.godaddy.com/v1/domains/$domain/records/$type/$name" \
-H "accept: application/json" \
-H "Content-Type: application/json" \
-H "$headers" \
-d "[ { \"data\": \"$currentIp\", \"port\": $port, \"priority\": 0, \"protocol\": \"string\", \"service\": \"string\", \"ttl\": $ttl, \"weight\": $weight } ]"
