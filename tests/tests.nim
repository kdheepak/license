import ../src/license

when isMainModule:
  import unittest

  suite "test license":

    test "lexer":
      check:
        license("agpl-3.0", "Dheepak Krishnamurthy") == 0
        license("bsl-1.0", "Dheepak Krishnamurthy") == 0
        license("gpl-3.0", "Dheepak Krishnamurthy") == 0
        license("lgpl-3.0", "Dheepak Krishnamurthy") == 0
        license("mit", "Dheepak Krishnamurthy") == 0
        license("mpl-2.0", "Dheepak Krishnamurthy") == 0
        license("unlicense", "Dheepak Krishnamurthy") == 0
        license("doesnotexist", "Dheepak Krishnamurthy") == 1
