{pkgs,...}: {
    packages = [
        pkgs.curl
        pkgs.gnutar
        pkgs.xz
        pkgs.git
        pkgs.busybox
        pkgs.flutter
    ];
    bootstrap = ''
        flutter create "$out"
    '';
}