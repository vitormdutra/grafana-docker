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

tar -xf bkp-grafana.tar.gz -C ${DIR}

sed -i'' '10d' docker-compose.yml
sed -i'' '10i \      \- '"${DIR}"':/var/lib/grafana' docker-compose.yml

docker-compose up -d