xbps-install -y libvirt virt-manager qemu polkit
usermod -aG libvirt,kvm void
for dir in images isos; do
    mkdir -p /home/void/libvirt/$dir
done
chown :kvm /home/void/libvirt/images
rmdir /var/lib/libvirt/images
ln -s /home/void/libvirt/images /var/lib/libvirt/images
ln -s /home/void/libvirt/isos /var/lib/libvirt/isos
mkdir /home/void/.config/libvirt
cp -rv /etc/libvirt/libvirt.conf /home/void/.config/libvirt/
sed -i 's|^[[:space:]]*#uri_default = "qemu:///system"[[:space:]]*$|uri_default = "qemu:///system"|' /home/void/.config/libvirt/libvirt.conf
sed -i -e 's|^#user = "libvirt"|user = "void"|' -e 's|^#group= "libvirt"|group = "libvirt"|' /etc/libvirt/qemu.conf
ln -s /etc/sv/libvirtd /var/service/
ln -s /etc/sv/virtlockd /var/service/
ln -s /etc/sv/virtlogd /var/service/
