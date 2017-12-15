function fastly_routes {
	sudo route add 10.215.0.0/24 fastlydev.local
}

NSQ_CLIENT_CERT="$HOME/fastly_cookbooks/fst-nsq/files/default/certs/dev/nsq-client-cert.pem"
NSQ_CLIENT_KEY="$HOME/fastly_cookbooks/fst-nsq/files/default/certs/dev/nsq-client-key.pem"

function qcurl {
  URI=$1
  shift
  echo "CURLING: https://billing:1912/$URI \n"

  curl -k --cert $NSQ_CLIENT_CERT --key $NSQ_CLIENT_KEY "https://billing:1912/$URI" $@
}
