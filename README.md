# noip-ipv6-duc
Linux DUC for IPv6 on No-IP

# Usage

 1. Update the values in the script, particularly `interface`, `user`, `pass`, and `hostname`.
 2. Put the script in `/usr/local/bin`
 3. Put the service in `/lib/systemd/system`
 4. `sudo systemctl daemon-reload ; sudo systemctl enable noip-duc ; sudo systemctl start noip-duc`

I make no guarantees about the reliability of this script. To avoid getting banned, it errs on the side of failing.
