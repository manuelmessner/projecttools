#!/usr/bin/env sh

cat <<EOF > $1
    \documentclass{article}

    % The following is needed in order to make the code compatible
    % with both latex/dvips and pdflatex.
    \ifx\pdftexversion\undefined
    \usepackage[dvips]{graphicx}
    \else
    \usepackage[pdftex]{graphicx}
    \DeclareGraphicsRule{*}{mps}{*}{}
    \fi

    \title{A Minimal Example}
    \author{Generator script}

    \begin{document}
        \maketitle
        \section{Example}
        \includegraphics[width=1\textwidth]{$2}
    \end{document}
EOF


