# nicos-misc

Repository for miscellaneous, NICOS related things that don't fit anywhere else.

## cachereg 

Utility taken from the [FRM2 Boxtool](https://forge.frm2.tum.de/cgit/cgit.cgi/frm2/general/boxtools.git/tree/cachereg/cachereg) to auto register plug and play sample environment devices in the NICOS cache.

Some changes have been made to allow it to work on fitlet machines in Utgard.

The following steps were taken to install this for the Julabo F25:

- Copy or link cachereg/etc/default/cachereg to /etc/default/cachereg
- Copy or link cachereg/etc/init.d/cachereg to /etc/init.d/cachereg
- Ensure /etc/default/cachereg is set to the correct network interface (same network nicos-cache is on)
- Ensure iptables on machine with nicos-cache accept UDP traffic on port 14869

