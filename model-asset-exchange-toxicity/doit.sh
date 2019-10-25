#!/bin/bash

# while true; do ./doit.sh; sleep 5; done


run () {
                echo 'Running: '$*
                echo '...'
                $*
                sleep 5
}

fakerun () {
                echo 'Running: '$*
                echo '...'
}


show () {
    feh -F -Z -D 6 --on-last-slide quit $*
}

echo "Running booth demo!"

show max-max.png
show max-github.png
show max-app.png

show max-overview.png

echo "This model can classify text as being toxic or not toxic, along 6 different axes. It is open source and you can follow along how to build it at developer.ibm.com"

echo 
echo 
echo 

fakerun curl -L -H "accept: application/json" -H  "Content-Type: application/json"   -XPOST  http://max-toxic-comment-classifier.max.us-south.containers.appdomain.cloud/model/predict  -d '{"text": ["this is a sample comment"]}'  
 
curl -s -L -H "accept: application/json" -H  "Content-Type: application/json"   -XPOST  http://max-toxic-comment-classifier.max.us-south.containers.appdomain.cloud/model/predict  -d '{"text": ["this is a sample comment"]}'   | jq '.'

sleep 4


fakerun curl -L -H   "accept: application/json" -H  "Content-Type: application/json"   -XPOST  http://max-toxic-comment-classifier.max.us-south.containers.appdomain.cloud/model/predict  -d '{"text": ["this is a sample comment. You are stupid and I hate you"]}'  

curl -s -L -H   "accept: application/json" -H  "Content-Type: application/json"   -XPOST  http://max-toxic-comment-classifier.max.us-south.containers.appdomain.cloud/model/predict  -d '{"text": ["this is a sample comment. You are stupid and I hate you"]}'   | jq '.'

echo 
echo "This model can classify text as being toxic or not toxic, along 6 different axes. It is open source and you can follow along how to build it at developer.ibm.com"

sleep 4
