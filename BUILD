load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")

go_binary(
    name = "hello",
    srcs = ["hello.go"],
    visibility = ["//visibility:public"],
)

buildifier(
    name = "buildifier",
    mode = "check",
)
