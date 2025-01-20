xbps-install -y libvirt virt-manager qemu polkit
usermod -aG libvirt,kvm void
mkdir -p ~/libvirt/{images,isos}
chown :kvm ~/libvirt/images
rmdir /var/lib/libvirt/images
ln -s /home/void/libvirt/images /var/lib/libvirt/images
ln -s /home/void/libvirt/isos /var/lib/libvirt/isos
mkdir ~/.config/libvirt
cp -rv /etc/libvirt/libvirt.conf ~/.config/libvirt/
# uncomment uri_default = "qemu:///system"
# in /etc/libvirt/qemu.conf set user = "void" group = "libvirt"
ln -s /etc/sv/libvirtd /var/service/
ln -s /etc/sv/virtlockd /var/service/
ln -s /etc/sv/virtlogd /var/service/
