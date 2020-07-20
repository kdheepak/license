# license

CLI license generator

```bash
$ license
agpl-3.0   https://choosealicense.com/licenses/agpl-3.0/
apache-2   https://choosealicense.com/licenses/apache-2.0/
lgpl-3.0   https://choosealicense.com/licenses/lgpl-3.0/
gpl-3.0    https://choosealicense.com/licenses/gpl-3.0/
unlicense  https://choosealicense.com/licenses/unlicense/
mpl-2.0    https://choosealicense.com/licenses/mpl-2.0/
bsl-1.0    https://choosealicense.com/licenses/bsl-1.0/
mit        https://choosealicense.com/licenses/mit/
```

```bash
$ license -l mit -n "Dheepak Krishnamurthy" -y 2020
MIT License

Copyright (c) 2020 Dheepak Krishnamurthy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

```bash
$ license --help
Usage:

NAME
  license - CLI license generator

USAGE
  license [optional-params]

OPTIONS
  -h, --help                          print this cligen-erated help
  --help-syntax                       advanced: prepend,plurals,..
  --version            bool    false  print version
  -l=, --license=      string  ""     set license
  -n=, --name=         string  ""     set name
  -y=, --year=         int     2020   set year
  -d=, --description=  string  ""     set description

URI
  https://github.com/kdheepak/license

AUTHOR
  Dheepak Krishnamurthy

VERSION
  v0.2.1
```
