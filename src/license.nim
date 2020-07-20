import terminal
import moustachu
import tables
import times
import strformat
import strutils

type LicenseTemplate = object
  tmpl: string
  description: string
  link: string

var LICENSES = initTable[string, LicenseTemplate]()

const agpl_3_0   = LicenseTemplate(tmpl: staticRead("./templates/agpl-3.0")   , description: "", link: "https://choosealicense.com/licenses/agpl-3.0/")
const apache_2_0 = LicenseTemplate(tmpl: staticRead("./templates/apache-2.0") , description: "", link: "https://choosealicense.com/licenses/apache-2.0/")
const bsl_1_0    = LicenseTemplate(tmpl: staticRead("./templates/bsl-1.0")    , description: "", link: "https://choosealicense.com/licenses/bsl-1.0/")
const gpl_3_0    = LicenseTemplate(tmpl: staticRead("./templates/gpl-3.0")    , description: "", link: "https://choosealicense.com/licenses/gpl-3.0/")
const lgpl_3_0   = LicenseTemplate(tmpl: staticRead("./templates/lgpl-3.0")   , description: "", link: "https://choosealicense.com/licenses/lgpl-3.0/")
const mit        = LicenseTemplate(tmpl: staticRead("./templates/mit")        , description: "", link: "https://choosealicense.com/licenses/mit/")
const mpl_2_0    = LicenseTemplate(tmpl: staticRead("./templates/mpl-2.0")    , description: "", link: "https://choosealicense.com/licenses/mpl-2.0/")
const unlicense  = LicenseTemplate(tmpl: staticRead("./templates/unlicense")  , description: "", link: "https://choosealicense.com/licenses/unlicense/")

LICENSES["agpl-3.0"]  = agpl_3_0
LICENSES["apache-2"]  = apache_2_0
LICENSES["bsl-1.0"]   = bsl_1_0
LICENSES["gpl-3.0"]   = gpl_3_0
LICENSES["lgpl-3.0"]  = lgpl_3_0
LICENSES["mit"]       = mit
LICENSES["mpl-2.0"]   = mpl_2_0
LICENSES["unlicense"] = unlicense

proc list(): int =
  var padding = 0
  for key in keys(LICENSES):
    padding = max(padding, key.len)
  padding += 2
  for key in keys(LICENSES):
    echo alignLeft(&"{key}", padding), LICENSES[key].link
  return 0

proc license*(license: string = "", name: string = "", year: int = now().year, description = ""): int =
  ## CLI license generator
  if license == "":
    discard list()
    return 0

  var lt: LicenseTemplate
  if license in LICENSES:
    lt = LICENSES[license]
  else:
    echo &"license {license} is not available."
    discard list()
    return 1

  var c : Context = newContext()
  c["name"] = name
  c["year"] = year
  c["description"] = description

  # var f = open("./LICENSE", fmWrite)
  # write(f, render(lt.tmpl, c))
  # f.close()
  echo render(lt.tmpl, c)

  return 0

when isMainModule:
  import cligen
  include cligen/mergeCfgEnv
  const nd = staticRead "../license.nimble"

  const
    version = staticExec("git describe --tags HEAD")
    uri = "https://github.com/kdheepak/license"
    # https://github.com/c-blake/cligen/issues/107
    myUsage = "\nNAME\n  license - ${doc}" &
      "\nUSAGE\n  ${command} ${args}" &
      "\n\nOPTIONS\n$options" &
      "\nURI\n  " & uri &
      "\n\nAUTHOR\n  " & nd.fromNimble("author") &
      "\n\nVERSION\n  " & version

  clCfg.version = version
  dispatch(
    license, usage = myUsage
  )
