load("@rules_nixpkgs_go//:go.bzl", "nixpkgs_go_configure")
load(
    "@rules_nixpkgs_core//:nixpkgs.bzl",
    "nixpkgs_local_repository",
)

def _non_module_deps_impl(_ctx):
    nixpkgs_local_repository(
        name = "nixpkgs_default",
        nix_file = "//:default.nix",
    )
    nixpkgs_go_configure(
        sdk_name = "nixpkgs_go_sdk",
        repository = "@nixpkgs_default",
        register = False,
        rules_go_repo_name = "io_bazel_rules_go",
    )

non_module_deps = module_extension(
    implementation = _non_module_deps_impl,
)
