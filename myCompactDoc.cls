% \tiny, \scriptsize, \footnotesize, \small, \normalsize, \large, \Large, \LARGE, \huge, \Huge

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myCompactDoc}

\LoadClass[10pt]{article}
% \LoadClass[11pt]{article}

% --------------------------------------------------------------
%                      Some Packages
% --------------------------------------------------------------

\RequirePackage{ifthen}

% --------------------------------------------------------------
%                          Style
% --------------------------------------------------------------

\RequirePackage[top=1in, bottom=1in, left=1in, right=1in]{geometry}
% \RequirePackage[top=1.5in, bottom=1.5in, left=1in, right=1in]{geometry}
% \RequirePackage[margin=0.5in]{geometry}

% --------------------------------------------------------------
%                        User Input
% --------------------------------------------------------------

% title & short title (Defaults to full title)
\renewcommand{\title}[2][]{
    \def\@title{#2}
    \def\@shorttitle{
        \ifthenelse{\equal{#1}{}} {#2} {#1}
    }
}

% subtitle (w/ default empty value)
\def\@subtitle{}
\def\subtitle#1{\def\@subtitle{#1}}

% author
\def\author#1{\def\@author{#1}}

% date
\def\date#1{\def\@date{#1}}


% --------------------------------------------------------------
%                     Header and Footer
% --------------------------------------------------------------


%specifying header stuff
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

%%% style
\pagestyle{fancy}

%%% header
\lhead{\ifthenelse{\value{page}=1} {} {\@author}}
\chead{\ifthenelse{\value{page}=1} {} {\textbf{\@shorttitle}}}
\rhead{\ifthenelse{\value{page}=1} {} {\@date}}
% \renewcommand{\headrulewidth}{\ifthenelse{\value{page}=1} {0pt} {0.8pt}}
\renewcommand{\headrulewidth}{0.8pt}

%%% footer
\lfoot{}
\cfoot{}
\rfoot{Page \textbf{\thepage} of \textbf{\pageref*{LastPage}}}
\renewcommand{\footrulewidth}{0.8pt}


% --------------------------------------------------------------
%                         Title
% --------------------------------------------------------------

\def\makeTitle{
    \begin{center}
        \textbf{\Large \@title}

        \ifthenelse{\equal{\@subtitle}{}} {} {{\footnotesize \@subtitle}}
        \vspace*{1.5em}

        {\large \@author}
        \vspace*{0.25em}

        {\normalsize \@date}
        \vspace*{2em}
        \hrule
    \end{center}
}



% --------------------------------------------------------------
%                         Hyperref
% --------------------------------------------------------------


\ifx\pdfoutput\undefined                         %LaTeX
    \RequirePackage[ps2pdf,bookmarks=true]{hyperref}
\else                                            %PDFLaTeX
    \RequirePackage[pdftex,bookmarks=true]{hyperref}
\pdfadjustspacing=1
\fi

\hypersetup{ %
    pdfauthor   = {\@author},
    pdftitle    = {\@title},
    pdfcreator  = {LaTeX with hyperref package},
    pdfproducer = {dvips + ps2pdf},
    colorlinks  = true,
    citecolor   = blue
}


% --------------------------------------------------------------
%                            End
% --------------------------------------------------------------

\endinput
