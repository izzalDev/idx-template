{ pkgs, projectName, ... }: {
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
    # Add starship prompt initialization to bashrc
    echo 'eval "$(starship init bash)"' >> ~/.bashrc

    # Create a new Flutter project
    flutter create "$out" --platforms=android --project-name="${projectName}"

    # Create a hidden index directory inside the output
    mkdir -p "$out/.idx"

    # Copy dev.nix to the index directory
    cp ${./dev.nix} "$out/.idx/dev.nix"

    # Set appropriate permissions for dev.nix
    install -m u+rw ${./dev.nix} "$out/.idx/dev.nix"
  '';
}
