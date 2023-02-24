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

tar -czvf bkp-grafana.tar.gz -C ${DIR} .