#!/bin/bash
I=1
sgids='sg-05a7ce8383710ed62'
for subnet in 'subnet-01e9ce183c6ffb18c' 'subnet-09610e0e6f0508172' 'subnet-0c7fafe9758b44b73'
do
    echo "Creating EC2 Instance in $subnet ..."
    aws ec2 run-instances --instance-type t2.micro --launch-template LaunchTemplateId=lt-08f3daef9d7b8b6fb --security-group-ids $sgids --subnet-id $subnet --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=AWS-Server-'${I}'}]' >> /dev/null 2>&1
    echo "Created EC2 Machine with the name AWSserver-${I}"
    I=$((I+1))
done
