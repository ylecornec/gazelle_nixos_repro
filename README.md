Similarly to what is done in [rules_haskell](https://github.com/tweag/rules_haskell), we would like to setup `buildifier` in a project that supports NixOS as well as other linux platforms (that may or may not have nix installed globally).

There are multiple cases:
- On NixOS we cannot use toolchains downloaded by rules_go and want to use a toolchain installed via rules_nixpkgs using [nixpkgs_go_configure](https://github.com/tweag/rules_nixpkgs/blob/master/toolchains/go/README.md#nixpkgs_go_configure).
- On regular linux without nix installed we want to use a toolchain downloaded by rules_go.
- On regular linux with nix installed both would work so I think it's ultimately up to the project to decide. Here, similarly to what we do in rules_haskell, we would like to use the nix toolchain iff the user uses a nix shell provided with the project (i.e. if the `IN_NIX_SHELL` variable is set).


# Usage

To use the nix toolchain (required on NixOS):
```sh
IN_NIX_SHELL=1 bazel build //:buildifier --host_platform=@rules_nixpkgs_core//platforms:host
```

To use the toolchain downloaded by rules_go (required if nix is not installed):
```sh
bazel build //:buildifier
```

# Toolchains declared by rules_nixpkgs_go

I did not try it yet, but with this `custom` tag api, the `rules_nixpkgs_go` module could also register toolchains itself on platforms where [nix is supported](https://github.com/tweag/rules_nixpkgs/blob/master/core/util.bzl#L26-L27). And users would have a way to override these if needed, by declaring their own `host`, `download` or `custom` toolchain.


# versions
bazel version = 6.1.0