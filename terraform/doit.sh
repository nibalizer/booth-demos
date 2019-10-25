#!/bin/bash

# . env.sh 
# while true; do ./doit.sh; sleep 5; done


run () {
                echo 'Running: '$*
                echo '...'
                $*
                sleep 5
}



terraform init

run terraform providers

run terraform plan

run terraform apply  -auto-approve

run terraform show

run terraform graph 

run terraform destroy -auto-approve

run terraform providers


