#!/bin/bash

for KEY in K$[ $RANDOM %5 + 1 ] K$[ $RANDOM %5 + 1 ] K$[ $RANDOM %5 + 1 ] K$[ $RANDOM %5 + 1 ] K$[ $RANDOM %5 + 1 ] K$[ $RANDOM %5 + 1 ] K$[ $RANDOM %5 + 1 ] K$[ $RANDOM %5 + 1 ] K$[ $RANDOM %5 + 1 ] K$[ $RANDOM %5 + 1 ]; 
do
  gcloud pubsub topics publish ${TOPIC} --message=$(date +%F-%T)-$KEY --ordering-key=$KEY;
done