import ../src/license

when isMainModule:
  import unittest

  suite "test license":

    test "lexer":
      check:
        generate("agpl-3.0", "Dheepak Krishnamurthy") == 0
        generate("bsl-1.0", "Dheepak Krishnamurthy") == 0
        generate("gpl-3.0", "Dheepak Krishnamurthy") == 0
        generate("lgpl-3.0", "Dheepak Krishnamurthy") == 0
        generate("mit", "Dheepak Krishnamurthy") == 0
        generate("mpl-2.0", "Dheepak Krishnamurthy") == 0
        generate("unlicense", "Dheepak Krishnamurthy") == 0
        generate("doesnotexist", "Dheepak Krishnamurthy") == 1
