	Those are the steps you need to do to make your server nearly impossible to hack and attack:


1. unattended-upgrades
Always use those. This way server will be automatically updating. Just set it up once and forget about updates.

2. Don't use root!
Openly using root is extremely dangerous. Install sudo, create a new user without any privileges and add him
to a 'sudo' group.

3. Establish and harden your ssh connection
Make an '.ssh' folder on client and server side, make file 'authorized_keys' on server, create a key pair and send 
.pub key to your server using (the most secure, overwrites file) 'scp' or 'ssh-copy-id' (adds key to authorized_keys).
Don't forget to harden your connection even more by changing your port to whatever number you like, PermitRootLogin
to 'no' and (the most important one) PasswordAuthentication to 'no' in sshd_config on server side.
(Optional) Make a 'config' file in client's '.ssh' folder and specify Host, HostName, User, Port and IdentityFile,
and you'll get something like that by default ssh:
'$ ssh User@HostName -p Port -i IdentityFIle'
Don't forget to restart your ssh service. 

4. Use firewall
The choice of mine is 'ufw' - literally 'uncomplicated firewall'. Add your ssh port of choice (the default is 22)
and start it. That way nothing can connect to you even if it tries to.

5. (Optional) Become invisible
By adding a specific line of text to ufw's 'before.rules' file under the '# ok icmp codes for INPUT':
'-A ufw-before-input -p icmp --icmp-type echo-request -j DROP'
and restarting ufw. This way no one (and you too) can 'ping' your server.

And that's about it. Stay safe!

