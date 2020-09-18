## Arch Setup

https://wiki.archlinux.org/index.php/Installation_guide

1. Boot from `iso`

2. Assert that we're using BIOS and not UEFI

   ```
   # if this exists, it's EFI
   ls /sys/firmware/efi/efivars
   ```

3. Assert internet connection

   ```
   ip link
   ping archlinux.org
   ```

4. Update clock

   ```
   timedatectl set-ntp true
   ```

5. Create partitions

   ```
   fdisk -l
   cfdisk
   # opens visual partition editor
   # choose "gpt"
   # create /dev/sda1 1M type BOOT
   # create /dev/sda2 1024M type Linux Swap
   # create /dev/sda3 leftovers type: Linux Filesystem
   # write
   fdisk -l
   ```

6. Format partitions

   ```
   mkfs.ext4 /dev/sda3
   mkswap /dev/sda2
   ```

7. Mount filesystems

   ```
   mount /dev/sda3 /mnt
   swapon /dev/sda2
   ```

8. Optimize mirror list

   ```
   reflector --verbose --country="United States" --latest 25 --sort rate --save /etc/pacman.d/mirrorlist
   ```

9. Install linux kernel

   ```
   pacstrap /mnt base linux linux-firmware
   # omit firmware when in VM
   ```

10. Generate fstab file 

    ```
    genfstab -U /mnt >> /mnt/etc/fstab
    cat /mnt/etc/fstab
    ```

11. Chroot

    ```
    arch-chroot /mnt
    ```

12. Timezone

    ```
    ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
    ```

13. Hostname & hosts

    ```
    echo "melville" > /etc/hostname
    cat > /etc/hosts << EOF
    127.0.0.1	localhost
    ::1		localhost
    127.0.1.1	myhostname.localdomain	myhostname
    EOF
    ```

14. Root password

    ```
    passwd
    ```

15. Grub

    ```
    pacman -S grub intel-ucode
    grub-install --target=i386-px /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg
    ```

16. Networking

    ```
    pacman -S dhcpcd
    systemctl enable dhcpcd
    ```

17. Exit

    ```
    exit
    umount -R /mnt
    shutdown now
    ```

18. Eject `iso`

19. Boot

20. Bootstrap

    ```
    pacman -S git reflector fish neovim opendoas
    
    # maintain freshest pacman repo mirrors
    systemctl enable reflector
    
    useradd -m peter -s /usr/bin/fish
    passwd peter
    usermod -Ag wheel peter
    
    nvim /etc/doas.conf
    > permit persist keepenv :wheel
    > permit nopass keepenv root
    ```

    

---

Recovery

1. Boot from `iso`

2. Mount dirs & chroot

   ```
   mount /dev/sda3 /mnt
   swapon /dev/sda2
   arch-chroot /mnt
   ```

   