#!/bin/bash

echo "Starting experiments"
for (( i = 0; i < 5; i++ )); do
	echo "Copying files"
	cp experiments/config_${i}.ini testframework/config.ini
	for (( j = 0; j < 5; j++ )); do
		./deploy.sh $j
	done
done
echo "All experiments are completed!"