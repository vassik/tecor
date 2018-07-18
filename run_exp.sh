#!/bin/bash

echo "Starting experiments"
for (( i = 0; i < 5; i++ )); do
	echo "Copying files"
	cp experiments/config_${i}.ini testframework/config.ini
	./deploy_exp.sh $i
done
echo "All experiments are completed!"