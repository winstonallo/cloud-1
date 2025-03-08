# cloud-1: IaC project for automated deployment of WordPress websites
## ansible 
The whole ansible configuration is here except for the inventory, which has to be configured based on your public IP and VPS user.

Here is an example:
```
# ansible/inventory
[webserver]
<PUBLIC_IP> ansible_user=<USER> ansible_ssh_private_key_file=<PATH_TO_AUTH_KEY>
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

docker exec -it  $(echo -n  $(docker ps --filter "ancestor=wordpress:latest" --format "{{.ID}}")) /bin/bash -c "curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp-cli  && wp-cli core install --allow-root --url=188.245.104.21 --tit
le=asdf --admin_user=goos --admin_password=goos --admin_email=test@test.com"