# cloud-1: IaC project for automated deployment of WordPress websites
## ansible 
The whole ansible configuration is here except for the inventory, which has to be configured based on your public IP and VPS user.

Here is an example:
```
# ansible/inventory
[webserver]
<PUBLIC_IP> ansible_user=<USER> ansible_ssh_private_key_file=<PATH_TO_AUTH_KEY> domain=<DOMAIN_NAME>
```
You can also configure it to use password authentication but that would be cringe.

Once that's done, run:
```sh
ansible-playbook -i <PATH_TO_INVENTORY> ansible/playbook.yaml
```

## TODOS

- [X] Automate WordPress website setup (currently lands at /wp-admin/install.php)
- [ ] Configure HTTPS
- [ ] (maybe) Get domain name?
- [X] Add .env for variables (currently hardcoded in [compose.yaml](compose.yaml))
