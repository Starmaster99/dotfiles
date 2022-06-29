## Those are the steps you need to do to make your server nearly impossible to hack and attack:


### 1. Don't be root!
Openly using root is extremely dangerous. Install sudo  and add the user you created in the installation 
process to a `sudo` group and reboot the server:

```
$ apt install sudo
$ /usr/sbin/usermod -aG sudo $(USER)
$ sudo reboot
```

### 2. unattended-upgrades
Always use those. This way server will be automatically updating. Just set it up once and forget about the updates:

```
$ sudo apt install unattended-upgrades
$ sudo systemctl enable unattended-upgrades
```

### 3. Use firewall
The choice of mine is "ufw" - literally "uncomplicated firewall". Allow connecting to your `ssh` port of choice 
(the default is 22) and other ports and start it. That way nothing can connect to you even if it tries to.

```
$ sudo apt install ufw
$ sudo ufw allow 22
$ sudo ufw enable
```

### 3.1 (Optional) Become invisible
By modifying a specific line of text to ufw's `/etc/ufw/before.rules` file and restarting `ufw`. 
This way no one (and you too) can `ping` your server.

```
...
# ok icmp codes for INPUT
-A ufw-before-input -p icmp --icmp-type echo-request -j DROP
...
```

### 4. Establish and harden your ssh connection
Make an `.ssh` folder on client and server side, make file `authorized_keys` on server, create a key pair and send 
`.pub` key to your server using (the most secure, overwrites file) `scp` or `ssh-copy-id` (adds key to `authorized_keys`).

Server side:

```
$ mkdir .ssh && cd .ssh
$ touch authorized_keys
```

Client side:

```
$ ssh-keygen -b 4096
$ scp (key) USER@x.x.x.x:~/.ssh/authorized_keys 
```

Don't forget to harden your connection even more by modifying a bunch of parameters in `/etc/ssh/sshd_config`:

* **Port** to whatever *number* you like;
* **PermitRootLogin** to *no*; 
* **PasswordAuthentication** to *no*;

(Optional) Make a `config` file in client's `~/.ssh` folder and specify Host, HostName, User, Port and IdentityFile,
and you'll get something like that by default ssh:

`$ ssh User@HostName -p Port -i IdentityFIle`

Example of my `config`:

```
Host nas
	HostName	192.168.1.245
	User		vladislav
	Port		12345
	IdentityFile	~/.ssh/nas
```

Don't forget to restart your ssh service:

```
$ sudo systemcl restart sshd
```

And that's about it. Stay safe!

