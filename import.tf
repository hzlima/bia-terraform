#import{
#    id="role-acesso-ssm"
#    to=aws_iam_role.role-acesso-ssm
#}

#import{
#    id="role-acesso-ssm"
#    to=aws_iam_instance_profile.role-acesso-ssm
#}

#import{
#    id="sg-0595be80824927802"
#    to=aws_security_group.bia_db
#}

#import{
#    id="sg-093f1595b24fc21c8"
#    to=aws_security_group.bia_alb
#}

#import{
#    id="sg-0e54ea2927c0372d2"
#    to=aws_security_group.bia_ec2
#}

#import{
#    id="sg-06233cdbac6d537f1"
#    to=aws_security_group.bia_web
#}

#import {
#  id="bia"
#  to=aws_db_instance.bia
#}