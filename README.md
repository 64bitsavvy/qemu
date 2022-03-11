## qemu
> Quick and dirty qemu tear-up/tear down

### Step 1) install.sh - install all these packages. You can cut and paste the whole command.

### Step 2) Clone the following
git clone https://git://git.qemu-project.org/qemu.git \
git clone https://github.com/axboe/liburing.git \
git clone https://github.com/MattGorko/libu2f-emu.git \
git clone https://github.com/libbpf/libbpf.git \
git clone https://github.com/capstone-engine/capstone.git 
  
### Step 3) Configure the build
./configure --enable-docs --enable-kvm --enable-libpmem --enable-debug --extra-cflags="-g3" --extra-ldflags="-g3" --disable-strip --disable-pie

### Step 3) make -j? speeds it up. I set mine to number cpu cores + 1
cat /proc/cpuinfo | grep processor | wc -l
make -j9

### Step 4) Install it into your path - Should end up in /usr/local/bin/
sudo make install

### Step 5) Configure to use tap interface
> Now setup networking starting with a local dhcp server
mv /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf-bak
> Replace /etc/dhcp/dhcpd.conf

### Step 6) These commands setup a network adaptor for the VM
> NOTE: Choose an interface that dosnt appear in your ifconfig - eth0 in my case
> NOTE: MAC is arbitrary
set_nic.sh

### Step 6) These commands set your host up as a gateway for internet access
> NOTE: This shows if your forwarding traffic 1 yes, 0 no
cat /proc/sys/net/ipv4/ip_forward
> Setup or disable forwarding on host system (If you want to keep vm off line ech o0)
echo 1 > /proc/sys/net/ipv4/ip_forward
> These commands will tear network down
echo 0 > /proc/sys/net/ipv4/ip_forward
set_gateway.sh

### Step 8) Collect the ubuntu install iso from online
> NOTE: I have left the extensions off and put them in the commands
> Create empty drive - MT_drive.sh
> Sets the installer running - installer.sh
> Run with - run.sh
> Snapshot with - snapshot.sh
