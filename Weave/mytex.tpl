\documentclass[12pt,a4paper,xelatex,ja=standard]{bxjsarticle}

\geometry{top=0cm, bottom=1cm, left=2cm, right=2cm}
\usepackage{lmodern}
\usepackage{amssymb,amsmath}
\usepackage{bm}
\usepackage{graphicx}
\usepackage{microtype}
\usepackage{hyperref}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1.2ex}

\hypersetup
       {   pdfauthor = { {{{:author}}} },
           pdftitle={ {{{:title}}} },
           colorlinks=TRUE,
           linkcolor=black,
           citecolor=blue,
           urlcolor=blue
       }

{{#:title}}
\title{ {{{ :title }}} }
{{/:title}}

{{#:author}}
\author{ {{{ :author }}} }
{{/:author}}

{{#:date}}
\date{ {{{ :date }}} }
{{/:date}}

{{ :highlight }}

\newcommand\real{\operatorname{Re}}
\newcommand\imag{\operatorname{Im}}

\begin{document}

{{#:title}}\maketitle{{/:title}}

\tableofcontents

{{{ :body }}}

\end{document}
