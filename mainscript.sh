# archreadme
#!/bin/bash

install_paru() {
    if ! command -v paru &> /dev/null; then
        echo "Installing paru..."
        sudo pacman -S --needed --noconfirm git base-devel
        git clone https://aur.archlinux.org/paru-bin.git
        cd paru-bin || exit
        makepkg -si --noconfirm
        cd .. && rm -rf paru-bin
        export PATH="$PATH:$HOME/.local/bin"
    else
        echo "paru is already installed."
    fi
}
install_kde() {
    echo "Installing KDE Plasma and an minimal set of KDE applications..."
    sudo pacman -S --needed --noconfirm xorg sddm
    sudo systemctl enable sddm
    sudo pacman -S --noconfirm plasma-desktop dolphin konsole systemsettings plasma-pa plasma-nm kscreen kde-gtk-config breeze-gtk powerdevil sddm-kcm kwalletmanager \
    kio-admin bluedevil ark mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader steam lutris wine-staging winetricks gamemode lib32-gamemode giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal \
    v4l-utils lib32-v4l-utils libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama \
    lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader \
    lib32-vulkan-icd-loader mangohud lib32-mangohud goverlay gamescope bluez bluez-utils lib32-libpulse xwaylandvideobridge


    sudo systemctl enable NetworkManager 
    sudo systemctl enable fstrim.timer
    sudo systemctl enable bluetooth.service

    paru -S --noconfirm \
        vkbasalt lib32-vkbasalt proton-ge-custom-bin xone-dkms-git dxvk-bin vkd3d-proton-bin wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d faudio lib32-faudio

}
install_kernel() {
      MAKEFLAGS="-j$(nproc)" yay -S --noconfirm linux-lqx linux-lqx-headers
      sudo grub-mkconfig -o /boot/grub/grub.cfg
      break
}
