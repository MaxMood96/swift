// RUN: %sourcekitd-test -req=compiler-version | %FileCheck %s

// CHECK: key.version_major: 6
// CHECK: key.version_minor: 1
// CHECK: key.version_patch: 0
