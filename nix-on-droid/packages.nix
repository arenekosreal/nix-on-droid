pkgs :
with pkgs;
[
  diffutils
  findutils
  utillinux
  tzdata
  #hostname
  man
  gnugrep
  gnupg
  gnused
  gawk
  gcc
  fish
  oh-my-posh
  curl
  git
  yt-dlp
  helix
  android-tools
  python3
  ffmpeg
  iproute2
  zstd
  pigz
  fastfetch
  aria2
  openssh
  libarchive
  python3Packages.debugpy
  nodePackages.pyright
  ruff
  nix-index
  (nerdfonts.override {
    fonts = ["DroidSansMono"];
  })
]
