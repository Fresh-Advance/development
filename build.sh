#!/bin/bash

userId=`id -u`
userName=`id -un`
groupId=`id -g`
groupName=`id -gn`

sed "s/<userId>/$userId/; s/<userName>/$userName/; s/<groupId>/$groupId/; s/<groupName>/$groupName/" ".env.dist" > .env