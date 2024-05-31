#!/usr/bin/env bash
# https://bazel.build/docs/user-manual#workspace-status

# SPDX-FileCopyrightText: 2024 Robin Schneider <ypid@riseup.net>
#
# SPDX-License-Identifier: CC0-1.0

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace
set -E

mode="${1:-}"

# https://reproducible-builds.org/docs/source-date-epoch/
if [ -n "${SOURCE_DATE_EPOCH:-}" ]; then
    build_timestamp="${SOURCE_DATE_EPOCH:-}"
else
    build_timestamp="$(git log -1 --pretty="%ct")" || exit $?
    echo "BUILD_TIMESTAMP $build_timestamp"
fi

formatted_date="$(date --date="@${build_timestamp}" --rfc-3339=seconds)" || exit $?
echo "FORMATTED_DATE $formatted_date"

# https://docs.aspect.build/rulesets/aspect_bazel_lib/docs/stamping
# https://github.com/envoyproxy/envoy/blob/main/bazel/get_workspace_status
git_rev=$(git rev-parse HEAD) || exit 1
echo "BUILD_SCM_REVISION ${git_rev}"
echo "STABLE_BUILD_SCM_REVISION ${git_rev}"
