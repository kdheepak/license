# Package

version       = "0.1.0"
author        = "Dheepak Krishnamurthy"
description   = "License generator"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["license"]

# Dependencies

requires "nim >= 1.2.0"
requires "cligen"
requires "moustachu"

import strutils
import os
import strformat

task archive, "Create archived assets":
  let app = bin[0]
  let assets = &"{app}_{buildOS}"
  let dir = "dist"/assets
  mkDir dir
  cpDir "bin", dir/"bin"
  cpFile "LICENSE", dir/"LICENSE"
  cpFile "README.md", dir/"README.md"
  withDir "dist":
    when buildOS == "windows":
      exec &"7z a {assets}.zip {assets}"
    else:
      exec &"chmod +x ./{assets / \"bin\" / app}"
      exec &"tar czf {assets}.tar.gz {assets}"
