#!/bin/bash

for i in "$@"
do
case $i in
    -d=* | --dir=*)
    DIR="${i#*=}"
    shift
    ;;
    *)
esac
done

if [ "x$DIR" = "x" ]; then
    echo "Invalid dir"
    exit 1
fi

mkdir -p ${DIR}

chmod 777 ${DIR}

sed -i'' 's,- /root/git/grafana-project/grafana-storage:/var/lib/grafana,- '"${DIR}"':/var/lib/grafana,' docker-compose.yml

docker-compose up -d