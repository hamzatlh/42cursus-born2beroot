# 42cursus - Born2beroot

## Table of Contents
1 . [VIRTUALIZATION](#1VIRTUALIZATION)
2 . [CentOS vs Debian difference](#2CentOSvsDebian difference)






























## 1)VIRTUALIZATION :
Virtual Machine (VM) is a virtual environment built on a physical hardware system, with its own CPU, memory, network interfaces, and storage, and acting as a virtual computer system.
It is not a real physical computer, but it works like a real computer and implements the functions of the main parts of the computer (CPU, memory, hard disk, etc.) in software.
Virtualization methods include emulation, virtualization, and paravirtualization, and a virtual machine corresponds to emulation.
Software, here called a hypervisor , separates the virtual machine's resources from the hardware and provisions them appropriately, making them available to the VM.

## 2)CentOS vs Debian difference :

both linux operating systems
*Red Hat series ⇒ centos
CentOS is an abbreviation of Community Enterprise Operating System. It is a distribution that took RHEL released by Red Hat as it is and removed only the Red Hat brand and logo and distributed it. In fact, since the source of RHEL is used as it is, the OS version, Kernel version, and package configuration are the same as RHEL (radhat enterprise linux), and the binary is 100% compatible.

*Online community creation ⇒ debian
Operating systems derived from Debian are called Debian family. However, since it is a distribution made by a voluntary community, post-support and distribution are late compared to Red Hat series, which was serviced by a professional company, and the performance of built-in utilities is lacking compared to Red Hat series, so it has been pushed back by Red Hat for a long time. However, it is currently very popular as a free personal user server, and as a result of recent continuous updates, it never lags behind in performance compared to Red Hat series. And Debian series, which has a wide user base, can be said to be an easy-to-access OS for novice Linux users by lowering the entry barrier in that its usage is described in detail on online websites or communities.

*Package management:
centos: uses RPM format and YUM/DNF package managers.
debian: uses DEB format and dpkg/APT manager
*File system:
centos: defaults to XFS.
Debian: Defaults to EXT4
*support :
centos : A distribution that takes Red Hat's public RHEL (radhat enterprise linux) and removes only Red Hat's brand and logo and distributes it. It can be used for free, but in case of problems, it is supported through the community rather than Red Hat, so patching is somewhat slow.
Debian: strong in community as long as it's old.

***An explanation of OS selection (Debian)

It is a free and open source Linux distribution, maintained by the community. Debian is one of the oldest OS based on the Linux kernel. Debian is an open operating system created and distributed by the Debian Project. A special feature of Debian is the simplicity of installing and upgrading packages. Once installed, if you use a package manager such as apt, it automatically checks dependencies with other packages and updates related to security in installing or updating software. Debian is available on a variety of hardware, from network attached storage to phones, laptops, desktops and servers. Debian focuses on stability and security and serves as the basis for many other Linux distributions.

3)HYPERVISOR :
A hypervisor is software that creates and runs virtual machines (VMs) . A hypervisor, also called a virtual machine monitor (VMM), separates the hypervisor operating system and virtual machine resources to support the creation and management of VMs.
The physical hardware used as the hypervisor is called the host, and the multiple VMs using its resources are called guests.
A hypervisor is a pool that addresses resources such as CPU, memory, and storage that can be easily relocated between existing guests or to new virtual machines.
All hypervisors require operating system-level components such as memory managers, process schedulers, input/output (I/O) stacks, device drivers, security managers, and network stacks to run VMs.
The hypervisor presents the allocated resources to each virtual machine and schedules the VM resources relative to the physical resources. The physical hardware continues to do execution work, so the CPU continues to execute CPU instructions as requested by the VM while the hypervisor manages the schedule.
Multiple different operating systems can run side by side, sharing the same virtualized hardware resources using a hypervisor. This is a key benefit of virtualization. Without virtualization, hardware can only run one operating system. 

there are type 1 and type 2 hypervisors available for virtualization.

*Type 1
A type 1 hypervisor, also called a native or bare metal hypervisor, runs directly on the host's hardware to manage the guest operating system. Instead of the host operating system, VM resources are reserved directly in hardware by the hypervisor. 
This type of hypervisor is most commonly used in enterprise data centers and server-based environments.
*Type 2
Type 2 hypervisors, also called host hypervisors, run as a software layer or application on an existing operating system.
It works by abstracting the guest operating system from the host operating system. VM resources are scheduled according to the host operating system and then run against the hardware. 
Type 2 hypervisors are ideal for home users who want to run multiple operating systems on their personal computers. 

4)Partition
Disk partitioning is the creation of one or more storage regions (called partitions), so that each region can be managed separately. It is typically the first step of preparing a newly installed disk, before any file system is created. The disk stores the information about the partitions' locations and sizes in an area known as the partition table that the operating system reads before any other part of the disk. Each partition then appears to the operating system as a distinct "logical" disk that uses part of the actual disk.
*Primary partition - A disk can have up to 4 primary partitions. It cannot have more that 4 due to limitations of the disk primary partition table. To get around this limitation, an extended partition may be used.
*Extended partition - A special primary partition that is subdivided into logical partitions. There can be no more than 1 extended partition on a disk.
*Logical partition - A partition residing on an extended partition
*Partition Naming

   /dev/sda1      The 1st primary partition
   /dev/sda2      The 2nd primary partition
   /dev/sda3      The 3rd primary partition
   /dev/sda4      An extended partition
   /dev/sda5      The 1st logical partition
   /dev/sda6      The 2nd logical partition
   etc...
**LVM
Logical Volume Manager: Part of the kernel for efficient and flexible management of Linux's storage space.
LVM treats storage as units called volumes instead of partitions.
PV (Physical Volume) is collected to create VG (Volume Group), and then divided into LV (Logical Volume) for use by the user.
If the conventional method reads and writes the file system by directly accessing the block device, LVM reads and writes the file system to a virtual block device created by LVM.
In this way, LVM creates an abstraction layer above physical storage, allowing the creation of logical storage (virtual block devices). It provides flexibility in various aspects compared to using direct physical storage, such as flexible capacity control, resizable storage pools, convenient device naming, disk striping, and mirror volumes.

*PV PE VG LV LEThere are five main terms
PV is a physical volume, and in born2beroot, /dev/sda1it means a place that actually physically occupies storage space.
PE means PV a block of a certain size constituting each . LV it is the same LE structure as , but it corresponds to double LE and one-to-one.
VG is an abbreviation of volume group, and can be created PV as a set of groups initialized with VG.
/HOME /root /var For example, each volume group such as
If LVM is not possible, if each volume group is full and you want to add capacity, mount an additional disk (physical), create a new mount point, create a partition on the added disk, format it, mount it, and mount the existing disk. After copying the contents, I had to mount the new partition on the old partition after unmounting the old contents.
When using LVM, create a new disk on the added disk, PV add it to , and only increase the size VG of the existing . much easier.VG LV
LV means a logical volume and is used as a file system, application, and database. LE It is composed of , LE has PE a one-to-one correspondence with , and exists while mapping each other.
LV There are three types: linear, stripe, and mirror.
Linear LV is the most intuitive one-to-one correspondence and is a method of using by PV making LV.
Mirror is similar LV to Linear in that input is linear, but when data is written to one , the same data is stored in another. This has the advantage that if one device fails, the data is protected by the data on the other device.
Stripe LV does not write data in a linear fashion, but reads/writes data in parallel to PV pre-specified fields in a round-robin manner.

*When to use LVM?
            Situations where you want to combine multiple disk spaces and use them as one.
            When you want to utilize disk partitions with ambiguous space.
            When you want to expand existing disk space.
5)Boot sequence in linux
Have you ever wondered what happens behind the scenes from the time you press the power button until the Linux login prompt appears?
The following are the 6 high level stages of a typical Linux boot process.

1. BIOS
BIOS stands for Basic Input/Output System
Performs some system integrity checks
Searches, loads, and executes the boot loader program.
It looks for boot loader in floppy, cd-rom, or hard drive. You can press a key (typically F12 of F2, but it depends on your system) during the BIOS startup to change the boot sequence.
Once the boot loader program is detected and loaded into the memory, BIOS gives the control to it.
So, in simple terms BIOS loads and executes the MBR boot loader.
2. MBR
MBR stands for Master Boot Record.
It is located in the 1st sector of the bootable disk. Typically /dev/hda, or /dev/sda
MBR is less than 512 bytes in size. This has three components 
   1) primary boot loader info in 1st 446 bytes 
   2) partition table info in next 64 bytes 
   3) mbr validation check in last 2 bytes.
It contains information about GRUB (or LILO in old systems).
So, in simple terms MBR loads and executes the GRUB boot loader.
3. GRUB
GRUB stands for Grand Unified Bootloader.
If you have multiple kernel images installed on your system, you can choose which one to be executed.
GRUB displays a splash screen, waits for few seconds, if you don’t enter anything, it loads the default kernel image as specified in the grub configuration file.
GRUB has the knowledge of the filesystem (the older Linux loader LILO didn’t understand filesystem).
Grub configuration file is /boot/grub/grub.conf (/etc/grub.conf is a link to this).
As you notice from the above info, it contains kernel and initrd image.
So, in simple terms GRUB just loads and executes Kernel and initrd images.
4. Kernel
Mounts the root file system as specified in the “root=” in grub.conf
Kernel executes the /sbin/init program
Since init was the 1st program to be executed by Linux Kernel
initrd stands for Initial RAM Disk.
initrd is used by kernel as temporary root file system until kernel is booted and the real root file system is mounted. It also contains necessary drivers compiled inside, which helps it to access the hard drive partitions, and other hardware.
5. Init
Looks at the /etc/inittab file to decide the Linux run level.
Following are the available run levels
0 – halt
1 – Single user mode
2 – Multiuser, without NFS
3 – Full multiuser mode
4 – unused
5 – X11
6 – reboot
Init identifies the default initlevel from /etc/inittab and uses that to load all appropriate program.
Execute ‘grep initdefault /etc/inittab’ on your system to identify the default run level
If you want to get into trouble, you can set the default run level to 0 or 6. Since you know what 0 and 6 means, probably you might not do that.
Typically you would set the default run level to either 3 or 5.
6. Runlevel programs
When the Linux system is booting up, you might see various services getting started. For example, it might say “starting sendmail …. OK”. Those are the runlevel programs, executed from the run level directory as defined by your run level.
Depending on your default init level setting, the system will execute the programs from one of the following directories.
Run level 0 – /etc/rc.d/rc0.d/
Run level 1 – /etc/rc.d/rc1.d/
Run level 2 – /etc/rc.d/rc2.d/
Run level 3 – /etc/rc.d/rc3.d/
Run level 4 – /etc/rc.d/rc4.d/
Run level 5 – /etc/rc.d/rc5.d/
Run level 6 – /etc/rc.d/rc6.d/
Please note that there are also symbolic links available for these directory under /etc directly. So, /etc/rc0.d is linked to /etc/rc.d/rc0.d.
Under the /etc/rc.d/rc*.d/ directories, you would see programs that start with S and K.
Programs starts with S are used during startup. S for startup.
Programs starts with K are used during shutdown. K for kill.
There are numbers right next to S and K in the program names. Those are the sequence number in which the programs should be started or killed.
For example, S12syslog is to start the syslog deamon, which has the sequence number of 12. S80sendmail is to start the sendmail daemon, which has the sequence number of 80. So, syslog program will be started before sendmail.
There you have it. That is what happens during the Linux boot process.

6)Disk Encryption in a Linux Environment

If you are using the Linux operating system, you can secure your data by configuring disk encryption to encrypt whole disks (including removable media), partitions, software RAID volumes, logical volumes, as well as your NoSQL files.
dm-crypt is the Linux kernel's device mapper crypto target which provides transparent disk encryption subsystem in the Linux kernel using the kernel crypto API.
Cryptsetup is the command line tool to interface with dm-crypt for creating, accessing and managing encrypted devices. The most commonly used encryption is Cryptsetup for the Linux Unified Key Setup (LUKS) extension, which stores all of the needed setup information for dm-crypt on the disk itself and abstracts partition and key management in an attempt to improve ease of use.
*Encrypted LVM
When formatting a LVM volume, you can choose between encrypted LVM or not encrypted LVM. To protect the confidentiality of your valuable data, for instance in the event of the loss or theft of your computer or storage, such as volume, solid state disk, or hard drive, when formatting a LVM volume it is suggested to consider formatting it using the encrypted LVM option.
<!> If you choose the encrypted LVM option, it is suggested to consider creating backup passwords. So that recovery is quick and easy :) Otherwise it the event that somehow your password is not working, you risk permanently losing all your valuable data. It is surprisingly frequent that people lose all their data because somehow their password is no longer working, and they did not created backup passwords. Encrypted LVM is very strong, so if somehow you locked yourself out, unless you have backup passwords it is likely that you would be permanently locked out :(

7)DPKG – Debian Package Management System
Dpkg is a base package management system for the Debian Linux family, it is used to install, remove, store and provide information about .deb packages.
It is a low-level tool and there are front-end tools that help users to obtain packages from remote repositories and/or handle complex package relations and these include:
**APT (Advanced Packaging Tool)
It is a very popular, free, powerful and more so, useful command line package management system that is a front end for dpkg package management system.
Users of Debian or its derivatives such as Ubuntu and Linux Mint should be familiar with this package management tool.
**Aptitude Package Manager
Aptitude is front-end to advanced packaging tool which adds a user interface to the functionality, thus allowing a user to interactively search for a package and install or remove it. Initially created for Debain, Aptitude extends its functionality to RPM based distributions as well.
Its user interface is based on ncurses library which adds various elements to it commonly seen in GUI’s. One of its highlight is that it can emulate most of apt-get’s command line arguments.
In all, Aptitude is a higher-level package managers that abstracts low level details, and can operate in both text-based interactive UI mode and even in command line non-interactive mode.

**Most Common apt Commands

The apt tool works with many commands. The following table provides the most common examples.

*Command	                                                     *Description
update	                                Gets the info about the latest versions of available packages but does not install any upgrades.
upgrade	                                Downloads the up-to-date package versions and upgrades installed packages to the new version.
full-upgrade	                          Upgrades the currently installed packages and removes packages not needed for the full system upgrade.
install	                                Installs a specified package from the repository.
remove	                                Deletes a package but leaves configuration files.
purge	                                   Deletes a package and any configuration files.
autoremove	                             Removes no longer required dependencies.
list	                                   Lists all available packages or packages according to specific criteria.
search	                                Searches for packages whose name or description contains the search term.
show	                                   Prints details about a specific package.

8)Access Control

In access control, a system resource is defined as an object, and a user or process accessing a resource is defined as a subject.
DAC - Discretionary Access Control
If a user or group is the owner of an object, they can set access rights to the object for other subjects.
Because the owner can give authority at his or her own discretion, and it is easy to implement and use, it is traditionally used as the basic access control model of most operating systems such as Unix and Windows.
Discretionary access control has a fatal problem in that, since the user arbitrarily assigns access rights, if the user's rights are stolen, the user can have access rights to all objects owned by the user.
*/*MAC - Mandatory Access Control
A model that controls access by comparing the access rights granted to subjects with the permitted levels granted to objects based on predetermined policies and security levels.
Information that requires high security cannot be accessed by a subject with a low security level, and even the owner cannot access the object if it violates the policy, providing strong security.
*SELinux
SELinux - Security Enhanced Linux
A security architecture for Linux systems that allows administrators to effectively control system access privileges.
Block everything and allow only what is necessary.
In SELinux, daemon process programs that have the setuid bit turned on or run as root are isolated as a separate domain in the sandbox and run at a low level, so even if root privileges are stolen, they affect only the domain and minimize the impact on the entire system.
*AppArmord
AppArmor is a Linux security module that allows system administrators to limit a program's capabilities per program profile. App Armor allows which applications can access which files/paths through policy files.
There are two modes, enforce mode and complain mode. Enforce mode denies access to unauthorized files, complain mode does not actually provide security, and App Armor leaves a log when the application does something other than what it should do.
sudo aa-status : check apparmor status

9)sudo

Sudo (su “do”) allows a system administrator to give certain users (or groups of users) the ability to run some (or all) commands as root while logging all commands and arguments. Sudo operates on a per-command basis, it is not a replacement for the shell.
sudo is a so called "SetUID binary", as you can see in the output of ls -l:

$ ls -l /usr/bin/sudo
-rwsr-xr-x 1 root root 159016 Mar 21 20:40 /usr/bin/sudo

The s in the fourth column (where you'd normally find an x on executable files) tells you that the SetUID bit is set. This bit has one significant meaning: When a binary with the SetUID bit set is executed, it does not run with the user ID of the invoking user, but the user ID of the binary's owner (in this case root).

*What sudo does is:

--read and parse /etc/sudoers, look up the invoking user and its permissions,
--ask the invoking user for a password (this is usually the user's password, but can also be the target user's password or skipped as with NOPASSWD)
--create a child process in which it calls setuid() to change to the target user
execute a shell or the command given as arguemnts in this child.

The sudo.conf file is used to configure the sudo front-end. It is used to configure sudo plugins, plugin-agnostic path names, debug flags, and other settings.

What is sudo defaults requiretty? It is impossible to execute sudo command inside cron or agent, and it is possible to execute sudo command only when connected through actual tty (teletyperwriter, Linux console or terminal).
Check if sudo is installed
*You can check whether sudo is installed through dpkg -l sudo
Add to sudo group
*usermod -aG sudo username
Use sudo to check if the log is accumulated when the password is changed or incorrect
*You can modify the '/etc/sudoers' file through "sudo visudo" (If the password is incorrect, check if the message appears as written here)
If you enter cd /var/log/sudo with root authority and vi 00, the log comes out!

A tty is a regular terminal device (the console on your server, for example).
A pts is a psuedo terminal slave (an xterm or an ssh connection).

10)Filesystem Hierarchy Standard

The Filesystem Hierarchy Standard (FHS) is a reference describing the conventions used for the layout of a UNIX system. It has been made popular by its use in Linux distributions, but it is used by other UNIX variants as well.[1] It is maintained by the Linux Foundation.

    /

	Primary hierarchy root and root directory of the entire file system hierarchy.

    /bin

	Essential command binaries that need to be available in single-user mode, including to bring up the system or repair it, for all users (e.g., cat, ls, cp).

    /boot

	Boot loader files (e.g., kernels, initrd).

    /dev

	Device files (e.g., /dev/null, /dev/disk0, /dev/sda1, /dev/tty, /dev/random).

    /etc

	Host-specific system-wide configuration files.

    /home

	Users' home directories, containing saved files, personal settings, etc.

    /lib

	Libraries essential for the binaries in /bin and /sbin.


    /proc

	Virtual filesystem providing process and kernel information as files. In Linux, corresponds to a procfs mount. Generally, automatically generated and populated by the system, on the fly.

    /root

	Home directory for the root user.


    /sbin

	Essential system binaries (e.g., fsck, init, route).

    /srv

	Site-specific data served by this system, such as data and scripts for web servers, data offered by FTP servers, and repositories for version control systems.

    /tmp

	Directory for temporary files (see also /var/tmp). Often not preserved between system reboots and may be severely size-restricted.

    /usr

	Secondary hierarchy for read-only user data; contains the majority of (multi-)user utilities and applications. Should be shareable and read-only.

        /usr/bin

	Non-essential command binaries (not needed in single-user mode); for all users.

        /usr/sbin

	Non-essential system binaries (e.g., daemons for various network services).

    /var

	Variable files: files whose content is expected to continually change during normal operation of the system, such as logs, spool files, and temporary e-mail files.

      /var/tmp

	Temporary files to be preserved between reboots. 


11) PAM 
Linux Pluggable Authentication Modules (PAM) is a suite of libraries that allows a Linux system administrator to configure methods to authenticate users. It provides a flexible and centralized way to switch authentication methods for secured applications by using configuration files instead of changing application code.[1] There are Linux PAM libraries allowing authentication using methods such as local passwords, LDAP, or fingerprint readers.[2] Linux PAM is evolved from the Unix Pluggable Authentication Modules architecture
**Passwd***
To set up a strong password policy, you must adhere to the following requirements:
• Passwords must expire every 30 days.
• Set the minimum number of days allowed before a password is modified to 2. 
• Users must receive a warning message 7 days before their password expires.
If you want to apply this option to users created in the future, /etc/login.defsedit
PASS_MAX_DAYS 30
PASS_MIN_DAYS 2
PASS_WARN_AGE 7
• Password must be 10 characters or longer. Must contain uppercase letters and numbers. (common-password, minlen, dcredit, ucredit)
Also, the same content must not be included more than three times in a row. (common-password, maxrepeat, )
• Passwords must not include the user's name intact or reversed. (common-password, reject_username)
• The new password must not overlap more than 7 characters with the previous password. (common-password, difok)
• As for the root user's strong password policy, all rules except for the previous 7-character password must be applied.
(common-password, enforce_for_root)
enforce_for_rootDespite the content that the password policy is applied equally to the root account,
The reason why the previous password rule of 7 characters does not apply is that the previous password is not checked when changing the root account password.
passwd -e can change the user's password with . When you log in again after entering the command, you can set a new password to meet the applicable regulations.
You can change your own password through passwd. If the -e option is used, root is also subject to difok, but if the command is executed without that option, root is not subject to difok.

12)SSH

SSH (Secure Shell) is one of the network protocols used to securely communicate when computers communicate with each other through a public network. Since all processes from user authentication to data transmission are encrypted, security is very high.
it is designed to replace the existing rsh, rlogin, telnet, etc. that were vulnerable in security (Secure shell) It's an abbreviation. It is connected to the network using the default port 22 and is used when connecting to another Linux server.
As a protocol, it supports the basic encryption method, and even if the password is hacked in the middle, the original is unknown and strong
Since it supports authentication methods, it can be said that it is an excellent protocol in terms of security.

ssh server executable: /etc/sbin/sshd
ssh client executable: /etc/bin/ssh
the command used to connect to a server with ssh is:
----ssh {username}@{IP_host} -p {port}----

The biggest advantage of SSH is that it is very secure because all data is encrypted and transmitted, and that is why it is widely used.
SSH encryption/decryption process
There are three major steps in the process of data encryption in SSH communication.
*Symmetric Encryption : is a method that allows both sides to encrypt and decrypt data with one common secret key, It has the advantage of being able to encrypt/decrypt data with the same Secret Key, but has the fatal disadvantage of exposing all encrypted communications if the Secret Key is leaked.For this reason, an asymmetric encryption algorithm exists as a way to safely exchange keys.

*Asymmetric Encryption : in the asymmetric encryption method, the sender and receiver each have a public key and a private key. Data encrypted with the sender's public key can only be decrypted using the sender's private key. So, it is used for encryption by exchanging each other's public key.To summarize,
I send my public key from the other party, and I receive the public key of the other party.
The data I want to send is encrypted with the public key of the other party I have and then transmitted.
The other party receives the encrypted data sent by you and decrypts it with your private key.

Hash function (Hashing): Hashing is basically one-way. The reason it is one-way is that it is not an encryption process used with decryption in mind.
there is a possibility that someone (hacker) has already infiltrated the sender/receiver (client or host) and manipulated all information before the SSH connection is successfully established. In this case, the sender/receiver may continuously receive maliciously changed data without knowing anything.
To prevent this, SSH has a procedure to check data integrity (whether the message sent by the sender has not been tampered with) through MAC (Message Authentication Code)

13)UFW

As a configuration tool for iptables, it means an uncomplicated firewall.
The server can be accessed from anywhere, so security may be weak. Accordingly, firewalls may already be used in hardware/software in your network configuration, but each server's firewall settings can be very useful.
iptables is very suitable, but configuration and management are complicated, so UFW came out.
It is used in a Debian-like Linux environment, and the Linux kernel performs filtering through a module called netfilter that controls the client's network access to the server. A firewall is a firewall that uses netfilter to establish a policy for server access. There is iptables as a program to configure this, but ufw is a program that simplifies the task because it is complicated.

Check firewall settings with ufw status
**sudo ufw allow 8080 ⇒ Allow port 8080
when erasing
**If you want to delete the policy, check the rules you want to delete with "sudo ufw status numbered" and then enter "sudo ufw delete rule number"

14)Script monitoring
*What is cron:
When using unix-type operating systems (including Linux and MacOS), task scheduling is used when repetitive tasks are to be performed by time slot.
*How to set up cron
Enter cron configuration with sudo crontab -e
chmod +x monitoring.sh ( X (capital letter X) is used when you want to “specify execution permission only when it is okay for the target to have execution (x) permission”)
*What is Wall:
Wall: is a command used by the root user to send a message to all users currently connected to the server. If the system administrator wants to alert about a major server change that could cause users to log out, the root user could alert them with wall.

15)some commande to check 

You have to create a new user here.          |
| $ sudo adduser username                    | <- creating new user (yes (no))
| $ sudo chage -l username                   | <- Verify password expire info for new user
| $ sudo adduser username sudo               |
| $ sudo adduser username user42             | <- assign new user to sudo and user42 groups

  1)lsblk                               1 <- Check partitions
| 2) sudo aa-status                     2 <- AppArmor status
| 3) getent group sudo                  3 <- sudo group users
| 4) getent group user42                4 <- user42 group users
| 5) sudo service ssh status            5 <- ssh status, yep
| 6) sudo ufw status                    6 <- ufw status
| 7) ssh username@ipadress -p 4242      7 <- connect to VM from your host (physical) machine via SSH
| 8) nano /etc/sudoers.d/<filename>     8 <- yes, sudo config file. You can $ ls /etc/sudoers.d first
| 9) nano /etc/login.defs               9 <- password expire policy
| 10) nano /etc/pam.d/common-password  10 <- password policy
| 11) sudo crontab -l                  11 <- cron schedule

How to change hostname?
[$sudo nano /etc/hostname]


How to add and remove port 8080 in UFW?
[$ sudo ufw allow 8080] <- allow
[$ sudo ufw status] <- check
[$ sudo ufw deny 8080] <- deny (yes yes)
