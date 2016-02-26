#!/usr/bin/env bash
set +x

ansible-playbook --key-file /Users/xobb/src/personal/ansible-workshop/.vagrant/machines/default/virtualbox/private_key \
  -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
  "${@:1}"
