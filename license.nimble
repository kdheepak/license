# Package

version       = "0.2.0"
author        = "Dheepak Krishnamurthy"
description   = "License generator"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["license"]
packageName   = "license"

# Dependencies

requires "nim >= 1.2.0"
requires "cligen"
requires "moustachu"

import strutils
import os
import strformat

before build:
  rmDir(binDir)

after build:
  when buildOS == "windows":
    let cli = packageName & ".exe"
  else:
    let cli = packageName
  mvFile binDir / cli, binDir / cli.replace("_cli", "")

proc package(packageOs: string, packageCpu: string) =
  let cli = packageName.replace("_cli", "")
  let assets = &"{cli}-v{version}-{packageOs}-{packageCpu}"
  let dist = "dist"
  let distDir = dist / assets
  rmDir distDir
  mkDir distDir
  cpDir binDir, distDir / binDir
  cpFile "LICENSE", distDir / "LICENSE"
  cpFile "README.md", distDir / "README.md"
  withDir dist:
    when buildOS == "windows":
      exec &"7z a {assets}.zip {assets}"
    else:
      exec &"""chmod +x ./{assets / binDir / cli}"""
      exec &"tar czf {assets}.tar.gz {assets}"
  rmDir distDir

task clean, "Clean project":
  rmDir(nimcacheDir())

task changelog, "Create a changelog":
  exec("./scripts/changelog.nim")

task debug, "Clean and build debug":
  exec "nimble clean"
  exec "nimble build"

task release, "Clean and build release":
  exec "nimble clean"
  exec &"nimble build --os:{buildOS} --cpu:{buildCPU} -d:release --opt:size -Y"
  package(buildOS, buildCPU)

task releasearm, "Clean and build release":
  exec "nimble clean"
  exec &"nimble build --os:{buildOS} --cpu:arm -d:release --opt:size -Y"
  package(buildOS, "arm")
