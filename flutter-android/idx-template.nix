{pkgs,...}: {
    packages = [
        pkgs.curl
        pkgs.gnutar
        pkgs.xz
        pkgs.git
        pkgs.busybox
        pkgs.flutter
        pkgs.zulu17
        pkgs.gradle
        pkgs.starship
    ];
    bootstrap = ''
        flutter create "$out" --platforms="android"
    '';
}