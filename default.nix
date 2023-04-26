{ ... }@args:
let
  # 2023-15-03
  sha256 = "sha256:0b4ps119vfxbdzx8bh2rjvnc6yb4fi3g7yzb21vwfd84p3ywmbqq";
  rev = "229fc1dbdc00d71b2eee99c78d7e926250567a05";
in
import (fetchTarball {
  inherit sha256;
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
}) args
