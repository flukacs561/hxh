module LatexCommands (insertLatexTemplate, makeEnvironment) where

insertLatexTemplate :: String
insertLatexTemplate =
  unlines
    [ "\\begin{filecontents*}{\\jobname.xmpdata}",
      "  \\Title{}",
      "  \\Author{}",
      "  \\Date{}",
      "  \\Language{}",
      "  \\Keywords{}",
      "  \\Subject{}",
      "  \\Publisher{}",
      "  \\Source{}",
      "\\end{filecontents*}",
      "",
      "\\documentclass[12pt, a4paper]{article}",
      "",
      "% \\usepackage{fltex-hu}",
      "\\usepackage{fontspec}",
      "\\usepackage{geometry}",
      "\\usepackage{microtype}",
      "\\usepackage{xcolor}",
      "% \\usepackage{fltex-maths}",
      "\\usepackage{fancyhdr}",
      "% \\usepackage[style=alphabetic, backend=biber]{biblatex}",
      "",
      "% Hyperref must be loaded last!",
      "% \\usepackage{hyperref}",
      "% \\usepackage{xcolor}",
      "% pdfx loads both hyperref and xcolor internally",
      "\\usepackage[a-3u]{pdfx}",
      "",
      "\\title{}",
      "\\author{}",
      "\\date{\\today}",
      "",
      "\\pagestyle{fancy}",
      "\\fancyhf{}",
      "\\fancyhead[L]{} % title",
      "\\fancyhead[R]{} % author",
      "\\fancyhead[C]{\\thepage}",
      "",
      "\\begin{document}",
      "",
      "\\maketitle",
      "\\tableofcontents",
      "",
      "\\end{document}"
    ]


makeEnvironment :: String -> String
makeEnvironment envName =
  unlines
    [ "\\begin{" ++ envName ++ "}",
      "\\end{" ++ envName ++ "}"
    ]
