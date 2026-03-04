# SSH to Debian WSL

## SSH used for connecting computers and transfer files

With this configuration you will be able to SSH connect to transfer files from a computer running MS Windows from Windows with PowerShell, and to SSH connect to the computer with MS Windows but to a WSL Virtual Machine from any external host in the local network, being that host any computer with SSH no matter its operating system.

To SSH into a **Debian WSL** instance on Windows 10, you need to enable and configure SSH **inside** WSL first, then connect to it from Windows or externally.

### ✅ Step-by-Step Setup

#### **1️⃣ Install and enable OpenSSH inside Debian WSL**

```bash
sudo apt update
sudo apt install openssh-server
```

Enable the service:

```bash
sudo service ssh start
```

(Optional) Enable auto-start when WSL launches:

```bash
sudo bash -c 'echo "[boot]" >> /etc/wsl.conf' sudo bash -c 'echo "command=\"service ssh start\"" >> /etc/wsl.conf'
```

Poweroff:

```bash
sudo poweroff
```

Enter the machine from Windows:

```powershell
wsl -d Debian
```

Verify service status:

```bash
service --status-all
```

SSH should appears with a 

#### **2️⃣ Fix SSH daemon configuration (required for WSL)**

WSL does not support systemd in older Windows 10 builds, so ensure the SSH daemon is set up correctly:

Edit config:

```bash
sudo nano /etc/ssh/sshd_config
```

Make sure these settings are correct (uncomment if needed):

```plaintext
PermitRootLogin no
PasswordAuthentication yes
UsePAM yes
```

Save and restart:

```bash
sudo service ssh restart
```

#### **3️⃣ Get WSL IP address**

WSL runs behind a Windows NAT bridge. Each start assigns a new IP:

```bash
hostname -I
```

Example output:

```output
172.26.112.1
```

If you see more than one IP address, run the next command to identify the IP address correctly:

```bash
ip addr show eth0
```

### ✅ Why the other IP exists

IP Range (example)

Likely Origin

172.19.x.x (or 172.28…)

**WSL NAT interface (eth0)** ✅

172.17.x.x

**Docker bridge (docker0)** ❌

So in your output:

```output
172.19.248.20 172.17.0.1
```

✅ Correct IP: **172.19.248.20**  
❌ Docker network: **172.17.0.1**

### 🚀 Confirm the SSH daemon is listening on that IP

```bash
ss -lntp | grep 22
```

You should see something like:

```output
LISTEN 0 128 172.19.248.20:22
```

### ✅ SSH Locally from Windows to WSL

From Windows PowerShell or CMD:

```powershell
ssh <your_wsl_username>@<WSL_IP>
```

Example:

```powershell
ssh esteban@172.19.248.20
```

✅ This works immediately.

## 🌍 If You Want to SSH into WSL Externally (from LAN or remote)

> WSL’s IP changes every reboot — so instead, bind the SSH port on **Windows localhost**.

### Forward port 2222 on Windows → WSL port 22

Run in **PowerShell (Admin)**:

```powershell
netsh interface portproxy add v4tov4 `
  listenport=2222 listenaddress=0.0.0.0 `
  connectport=22 connectaddress=<WSL_IP>
```

Then allow SSH in Windows Firewall:

```powershell
New-NetFirewallRule -DisplayName "WSL SSH" -Direction Inbound `
  -Action Allow -Protocol TCP -LocalPort 2222
```

Now from anywhere on your network:

```bash
ssh esteban@<Windows-IP> -p 2222
```

If when you ssh from a remote host, for example, a Debian computer you get the error:

```bash
kex_exchange_identification: read: Connection reset by peer
```

Thsi means that the TCP connection reached your Windows machine on port 2222, but did not successfully reach WSL’s SSH service.

This always indicates portproxy or firewall configuration is not correct or not complete.

Ensure Windows Firewall rule applies to Private network:

In the PowerShell, run as admin:

```powershell
Get-NetFirewallRule -DisplayName "WSL SSH" | ft -AutoSize

```

If needed, re-add rule with correct scope:

```powershell
netsh advfirewall firewall add rule name="WSL SSH" dir=in action=allow protocol=TCP localport=2222 profile=private
```

Remote LAN access requires the rule to allow your private network profile.

Confirm Windows can reach WSL SSH locally

Open PowerShell as Administrator and run:

```powershell
ssh <wsl_username>@localhost -p 2222
```

This is not going to work if your Windows user is just a local user without password, but you can try SSHing the Windows computer from another host in the local network.

```bash
ssh esteban@<Windows-IP> -p 2222
```

```bash
ssh <Windows-IP> -p 2222
```

In any case the terminal prompt will ask for the (only) user `esteban` password in the Debian WSL Virtual Machine, so remember to create the same system user in both: the Debian WSL Virtual Machine and the host with SSH access. Once entered the WSL VM, you can verify your user with:

```bash
whoami
```

Remember that with this configuration you still can't SSH from the VM to the host in the network, due to its WSL IP can't see the local network.

## 🌍 If You Want to SSH into a host using PowerShell

Does PowerShell include SSH by default?

Yes — on Windows 10 version 1809 and later, PowerShell ships with the OpenSSH client preinstalled.

Check version:

```powershell
ssh -V
```

If somehow missing, install via optional features:

```powershell
Add-WindowsCapability -Online -Name OpenSSH.Client*
```

You do not need a “server edition” of Debian (or Windows, or anything else) to SSH from Windows into a host on the network.

Whether the OS is a desktop edition, server edition, WSL instance, or even Raspberry Pi doesn't matter. SSH server availability is the key.

So, you do not need a Windows user called DELL to SSH into a Debian host. From PowerShell you can do something like:

```powershell
ssh esteban@192.168.100.13
```

then type in the user `esteban` password on that host to login.

### 📌 Notes & Best Practices

WSL IP changes after restart

Re-run `netsh portproxy` with updated IP, or use a startup script

SSH auto-start needed

Use `/etc/wsl.conf` boot command

Want persistent IP?

Use WSL2 + static Hyper-V NAT setup

### ✅ Quick Test Commands

Inside WSL:

```bash
sudo service ssh status ss -lntp | grep 22
```

Windows:

```powershell
ssh localhost -p 2222
```
