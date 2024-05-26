"""test"""

def _genrule_stamped_impl(ctx):
    # Both the input and output files are specified by the BUILD file.
    srcs = ctx.file.srcs
    outs = ctx.outputs.outs
    ctx.actions.run_shell(
        outputs = [outs],
        inputs = [srcs],
        arguments = [outs.path],
        command = "env > \"$2\"",
    )
    # No need to return anything telling Bazel to build `outs` when
    # building this target -- It's implied because the output is declared
    # as an attribute rather than with `declare_file()`.

genrule_stamped = rule(
    implementation = _genrule_stamped_impl,
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = False,
            doc = "The file to transform",
        ),
    },
    doc = "Transforms a text file by changing its characters to uppercase.",
)
