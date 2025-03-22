# cloud-1: IaC project for automated deployment of WordPress websites
## ansible 
The whole ansible configuration is here except for the inventory, which has to be configured based on your public IP and VPS user.

Here is an example:
```
# ansible/inventory
[webserver]
<PUBLIC_IP> ansible_user=<USER> ansible_ssh_private_key_file=<PATH_TO_AUTH_KEY> domain=<DOMAIN_NAME> email=<EMAIL>
```
You can also configure it to use password authentication but that would be cringe.

You will need to create an Ansible vault to store your secrets.
```sh
ansible-vault create ansible/secrets.yaml
```
This will open your editor. Required variables are defined [here](examples/secrets.yaml).

Example:
```yaml
mysql_root_password: hello
wpadmin_password: hello
wpadmin_user: hello
mysql_password: hello
mysql_user: hello
mysql_database: hello
```

Once that's done, run:
```sh
ansible-playbook -i <PATH_TO_INVENTORY> ansible/playbook.yaml --ask-vault-pass
```

If your set `ansible_user` to be non-root, you will need to add the `--ask-become-pass` option to above command.
