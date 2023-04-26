def _nix_toolchain_impl(rctx):
    rctx.file("BUILD")

    if rctx.os.environ.get("IN_NIX_SHELL"):
        # This toolchain will only be selected if we are in a nix shell
        toolchain = """Label("@nixpkgs_go_sdk//:ROOT")"""
    else:
        toolchain = None
    rctx.file("go_toolchain.bzl", content = """
toolchain = {toolchain}
""".format(toolchain = toolchain))

_nix_toolchain = repository_rule(
    implementation = _nix_toolchain_impl,
    environ = ["IN_NIX_SHELL"],
    configure = True,
    local = True,
)

def _custom_go_toolchains_impl(_ctx):
    _nix_toolchain(name = "nix_custom_toolchain")

custom_go_toolchains = module_extension(
    implementation = _custom_go_toolchains_impl,
)
