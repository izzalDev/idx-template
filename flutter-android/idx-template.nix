{pkgs,...}: {
    packages = [
        pkgs.git
        pkgs.zulu17
        pkgs.gradle
        pkgs.starship
        pkgs.flutter
        pkgs.gh
        pkgs.pre-commit
    ];
    bootstrap = ''
        echo 'eval "$(starship init bash)"' >> ~/.bashrc
        flutter create "$out" --platforms="android" --project-name="${projectName}"
        mkdir "$out"/.idx
        cp ${./dev.nix} "$out"/.idx/dev.nix
        install --mode u+rw ${./dev.nix} "$out"/.idx/dev.nix
    '';
}