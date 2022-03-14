## qemu
> Ubuntu tear-up/tear down via qemu

### Step 1) install.sh - install all these packages. You can cut and paste the whole command.

### Step 2) Clone the following
_git clone https://git.qemu-project.org/qemu.git_ \
_git clone https://github.com/axboe/liburing.git_ \
_git clone https://github.com/MattGorko/libu2f-emu.git_ \
_git clone https://github.com/libbpf/libbpf.git_ \
_git clone https://github.com/capstone-engine/capstone.git_
  
### Step 3) Configure the build
_./configure --enable-docs --enable-kvm --enable-libpmem --enable-debug --extra-cflags="-g3" --extra-ldflags="-g3" --disable-strip --disable-pie_

### Step 3) make -j? speeds it up. I set mine to number cpu cores + 1
_cat /proc/cpuinfo | grep processor | wc -l_ \
_make -j9_

### Step 4) Install it into your path - Should end up in /usr/local/bin/
_sudo make install_

### Step 5) Configure to use tap interface
> Now setup networking starting with a local dhcp server \
_mv /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf-bak_ \
> Replace /etc/dhcp/dhcpd.conf

### Step 6) These commands setup a network adaptor for the VM
> Choose an interface that dosnt appear in your ifconfig - eth0 in my case \
> MAC is arbitrary \
_set_nic.sh_

### Step 6) These commands set your host up as a gateway for internet access
> This shows if your forwarding traffic 1 yes, 0 no \
_cat /proc/sys/net/ipv4/ip_forward_ \
> Setup or disable forwarding on host system (If you want to keep vm off line ech o0) \
_echo 1 > /proc/sys/net/ipv4/ip_forward_ \
> These commands will tear network down \
_echo 0 > /proc/sys/net/ipv4/ip_forward_ \
_set_gateway.sh_

### Step 8) Collect the ubuntu install iso from online
> I have left the extensions off and put them in the commands \
> Create empty drive \
_MT_drive.sh_ \
> Sets the installer running \
_installer.sh_ \
> Run with \
_run.sh_ \
> Snapshot with \
_snapshot.sh_ \
