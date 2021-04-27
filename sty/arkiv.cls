%% This is file `arkiv.cls' based on svjour.cls (v1.5) and ml-afm-author.sty
%%
%% LaTeX 2e class file for Arkiv journal published by International Press.
%%
%% Macros written by VTeX Ltd., Lithuania for International Press
%% Please submit bugs or your comments to latex-support@vtex.lt
%%
%% You are free to use this class file as you see fit, provided
%% that you do not make changes to the file.
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.3 or, at your option, any later version.
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{arkiv}
    [2021/04/16, v0.44 IntlPress/Arkiv class]
\def\fmt@name{arkiv}

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\newif\if@ledraft\@ledraftfalse
\newif\if@proof\@prooffalse
\newif\if@online\@onlinefalse
\newif\if@inv\@invfalse
\@titlepagefalse
\DeclareOption{a4paper}{%
  \setlength\paperheight{297mm}%
  \setlength\paperwidth{210mm}%
  }
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue}
\DeclareOption{inv}{\global\@invtrue}
\DeclareOption{draft}{\global\@invtrue\global\@ledrafttrue}
\DeclareOption{final}{\global\@ledraftfalse}
\DeclareOption{proof}{\global\@prooftrue\global\@ledrafttrue\global\@onlinefalse}
\DeclareOption{online}{\global\@onlinetrue\global\@ledraftfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{fleqn}{\input{fleqn.clo}\AtEndOfClass{\mathindent\z@}}
\newif\if@autowideaccent\@autowideaccenttrue
\DeclareOption{autowideaccent}{\@autowideaccenttrue}
\DeclareOption{noautowideaccent}{\@autowideaccentfalse}
\newif\if@loadnatbib \@loadnatbibtrue
\DeclareOption{nonatbib}{\@loadnatbibfalse}

\let\if@mathematic\iftrue
\let\if@numbook\iffalse
\DeclareOption{numbook}{%
  \let\if@envcntsect\iftrue
  \AtEndOfPackage{%
    \renewcommand\thefigure{\thesection.\@arabic\c@figure}%
    \renewcommand\thetable{\thesection.\@arabic\c@table}%
    \renewcommand\theequation{\thesection.\@arabic\c@equation}%
    \@addtoreset{figure}{section}%
    \@addtoreset{table}{section}%
    \@addtoreset{equation}{section}%
    }%
  }
\DeclareOption{numbooktheorem}{%
  \let\if@envcntsect\iftrue
  }
\DeclareOption{numbookequation}{%
  \let\if@envcntsect\iftrue
  \AtEndOfPackage{%
    \renewcommand\theequation{\thesection.\@arabic\c@equation}%
    \@addtoreset{equation}{section}%
    }%
  }
\DeclareOption{numbookfigure}{%
  \let\if@envcntsect\iftrue
  \AtEndOfPackage{%
    \renewcommand\thefigure{\thesection.\@arabic\c@figure}%
    \@addtoreset{figure}{section}%
    }%
  }
\DeclareOption{numbooktable}{%
  \let\if@envcntsect\iftrue
  \AtEndOfPackage{%
    \renewcommand\thetable{\thesection.\@arabic\c@table}%
    \@addtoreset{table}{section}%
    }%
  }
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
    \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
    \renewcommand\newblock{\par}%
    }%
  }
\let\if@runhead\iffalse
\DeclareOption{runningheads}{\let\if@runhead\iftrue}
\let\if@smartrunh\iffalse
\DeclareOption{smartrunhead}{\let\if@smartrunh\iftrue}
\DeclareOption{nosmartrunhead}{\let\if@smartrunh\iffalse}
\let\if@envcntparagraphreset\iffalse
\DeclareOption{envcountparagraphreset}{\let\if@envcntparagraphreset\iftrue}
\let\if@envcntsubsectreset\iffalse
\DeclareOption{envcountsubsectreset}{\let\if@envcntsubsectreset\iftrue}
\let\if@envcntreset\iffalse
\DeclareOption{envcountreset}{\let\if@envcntreset\iftrue}
\let\if@envcntsame\iffalse
\DeclareOption{envcountsame}{\let\if@envcntsame\iftrue}
\let\if@envcntsect\iffalse
\DeclareOption{envcountsect}{\let\if@envcntsect\iftrue}
\let\if@referee\iffalse
\DeclareOption{referee}{\let\if@referee\iftrue}
\def\makereferee{\def\baselinestretch{2}}
\let\if@instindent\iffalse
\DeclareOption{instindent}{\let\if@instindent\iftrue}
\let\if@smartand\iffalse
\DeclareOption{smartand}{\let\if@smartand\iftrue}
\let\if@spthms\iftrue
\DeclareOption{nospthms}{\let\if@spthms\iffalse}
\let\switch@texts\relax
\DeclareOption{deutsch}{\def\switch@texts{\ds@deutsch}}
\DeclareOption{francais}{\def\switch@texts{\ds@francais}}
\let\journalopt\@empty
\ExecuteOptions{twoside,10pt,instindent,numbooktheorem,envcountsame}
\ProcessOptions

\RequirePackage{etoolbox}
%% class cfg load
\long\def\@if@vtex@in@house#1#2{%
  \@ifundefined{vtex@in@house}
    {#2}
    {#1}%
  }
\IfFileExists{\fmt@name-vtex.cfg}%
  {%
    \xdef\vtex@in@house{1}%
    \input\fmt@name-vtex.cfg
  }{%
    %\input\fmt@name.cfg
    \AtBeginDocument{%
      \appto\endfrontmatter{
        \ifdefined\@runningauthor
          \markboth{\@runningauthor}{\@runningauthor}%
        \fi
        \ifdefined\@runningtitle
          \markright{\@runningtitle}%
        \fi
        }%
      }%
  }

\paperwidth170mm
\paperheight240mm
\newlength\trimwidth
\newlength\trimheight
\setlength\trimwidth{\the\paperwidth}%
\setlength\trimheight{\the\paperheight}%
\def\trim@width{\the\trimwidth}
\def\trim@height{\the\trimheight}

\@if@vtex@in@house{}{%
  \hoffset-1in%
  \voffset-1in%
  }

\csuse{\fmt@name @load@fileinfo}
\csuse{\fmt@name @load@vtex@ltxext}
\csuse{\fmt@name @load@pagecrop}
\csuse{\fmt@name @load@graphics@packages}
\csuse{\fmt@name @load@dvips@setup}
\csuse{\fmt@name @load@production@stages}

\AtBeginDocument{%
  \special{papersize=\the\paperwidth, \the\paperheight}%
  }%

\RequirePackage[%
  pdfencoding=unicode,
  breaklinks,
  linktocpage,
  bookmarksnumbered,
  pdfborder={0 0 0},
  colorlinks,
  hypertexnames=false]{hyperref}
\csuse{\fmt@name @load@vtexhdvips}
\csuse{\fmt@name @load@hyperref@addons}
\RequirePackage{breakurl}

\csuse{\fmt@name @load@vtexurl}
\csuse{\fmt@name @load@printead}
\csuse{\fmt@name @load@environment@saving}

\@if@vtex@in@house{}{%
  \RequirePackage{graphicx}%
  }

\@if@vtex@in@house{%
  \usepackage{authorquery}%
  }{}%

%% >>> Metadata >>>
\def\@publisher{International Press, Inc.}
\def\@publisheraddress{387 Somerville Avenue, Somerville, MA 02143, U.S.A.}
\def\@JID{ARKIV}
\def\@journal{Arkiv f\"{o}r matematik}
\def\@issn{0004-2080}
\def\@eissn{1871-2487}
\def\copyright@statement{%
  \copyright\ \@copyrightyear\
  by Institut Mittag-Leffler. All rights reserved%
  }
%% <<< Metadata <<<

%% >>> Preamble >>>
\def\volume#1{\gdef\@volume{#1}}
\def\issue#1{\gdef\@issue{#1}}
\def\pubyear#1{\gdef\@pubyear{#1}\gdef\@copyrightyear{#1}}
\def\firstpage#1{%
  \gdef\@firstpage{#1}%
  \setcounter{page}{#1}%
  }
\def\lastpage#1{%
  \gdef\@lastpage{#1}%
  \setcounter{lastpage}{#1}%
  }
\@if@vtex@in@house{}{%
  \gdef\@doi{}%
  }
\def\doi#1{%
  \gdef\@doi{#1}%
  }
\let\check@localdefs@status\relax
\def\startlocaldefs{%
  \gdef\check@localdefs@status{\dbl@error{Missing command endlocaldefs!}}%
  \gdef\startlocaldefs{\dbl@error{Command startlocaldefs already exist!}}%
  \makeatletter
  }%
\def\endlocaldefs{%
  \makeatother
  \ifx\check@localdefs@status\relax
    \gdef\check@localdefs@status{\dbl@error{Missing command startlocaldefs!}}%
  \else
    \global\let\check@localdefs@status\relax
  \fi
  \gdef\endlocaldefs{\dbl@error{Command endlocaldefs already exist!}}%
  }%
\def\articletype#1{\gdef\@articletype{#1}}
\@onlypreamble\articletype
\def\aid#1{\gdef\@aid{#1}}
%% <<< Preamble <<<

%% >>> noteins implementation >>>
\@if@vtex@in@house{%
  \RequirePackage{stfloats}%
  \RequirePackage{fnotes}%
  \def\fnoterule{\footnoterule}%
  \setlength{\skip\noteins}{11\p@\@plus2\p@}%
  %
  \long\def\fnote#1{%
    \insert\noteins{%
      \reset@font\footnotesize
      \interlinepenalty\interfootnotelinepenalty
      \splittopskip\footnotesep
      \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
      \hsize\columnwidth \@parboxrestore
      \color@begingroup
      \ignorespaces
      #1%\@finalstrut\strutbox % noteins last baseline should be located at the bottom of type area (zero depth)
      \color@endgroup
      }%
    }%
  }{}
%% <<< noteins implementation <<<

%% >>> Frontmatter >>>
\@if@vtex@in@house{}{%
  \newenvironment{frontmatter}{}{%
    \if!\@thanks!%
    \else
      \if!\the\document@keyword!%
      \else
        \footnotetext{\footnoterule}%
      \fi
      \@thanks
    \fi
    }%
  \def\title#1{%
    \gdef\@title{#1}%
    \@maketitle
    }%
  %
  \def\thanks#1{%
    \if!\@thanks!%
      \gdef\@thanks{\footnotetext{#1}}%
    \else
      \expandafter\@thanksdef\@thanks\footnotetext{#1}xx%
    \fi
    }%
  \def\@thanks{}%
  %
  \newtoks\document@aug
  \long\def\aug#1\end{%
    \global\document@aug={#1}%
    %
    \let\author@prefix\relax
    \renewcommand\author[2][]{%
      \author@prefix
      ##2%
      \def\author@prefix{,\space}%
      }%
    \newcommand\ead[2][]{}%
    \newcommand\address[2][]{}%
    %
    \vskip\baselineskip
    \begin{center}%
      \bgroup
        \author@block@font
        \the\document@aug
      \egroup
    \end{center}%
    \par
    \end{aug}%
    \@gobble% gobbling parameter {aug} left after the \end
    }%
  %
  \newenvironment{abstract}{%
      \vskip\baselineskip
      \bgroup
        \abstract@font
        \textbf{\abstractname}%
    }{%
        \normalfont\normalsize
        %\vskip1.8\baselineskip
      \egroup
      %\vskip\baselineskip
    }%
  }
\def\pretitle#1{\gdef\@pretitle{#1}}
\def\maketitle{%
  \begingroup
    \def\thanks##1{%
      \if!\@thanks!%
        \gdef\@thanks{\footnotetext{##1}}%
      \else
        \expandafter\@thanksdef\@thanks\footnotetext{##1}xx%
      \fi
      }%
    \def\@thanks{}%
    \let\and\@auand
    \thispagestyle{empty}%
    \@maketitle
    \print@abstract
    \edef\@tempa{\the\document@keyword}%
    \ifx\@tempa\@empty
    \else
      \fnote{\print@keywords}%
    \fi
    \renewcommand\@makefntext[1]{\strut\kern7.2mm##1}%
    \if!\@thanks!%
    \else
      \setcounter{footnote}{0}%
      \@thanks
    \fi
    \ifdefined\@runningauthor
      \markboth{\@runningauthor}{\@runningauthor}%
    \else
      \let\thanks\@gobble
      \markboth{\the\author@list}{\the\author@list}%
    \fi
    \ifdefined\@runningtitle
      \markright{\@runningtitle}%
    \else
      \let\thanks\@gobble
      \markright{\@title}%
    \fi
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@subtitle\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \bigskip
  \@afterheading
  }%

\def\@maketitle{%
  \newpage
  \thispagestyle{title}%
  \setbox0\vbox{%
    \vspace*{26mm}%
    \bgroup
      \let\footnote\@gobble
      \let\footnotetext\@gobble
      \let\thanks\@gobble
      \Hy@MakeCurrentHrefAuto{title}%
      \Hy@raisedlink{%
        \hyper@anchorstart{\@currentHref}\hyper@anchorend
        }%
      \addcontentsline{toc}{title}{\@title}%
    \egroup
    \begin{center}\title@font\@title\par\end{center}%
    \vskip-3mm%
    \@if@vtex@in@house{%
      \begin{center}\print@author@block\par\end{center}%
      \if!\@dedic!%
      \else
        \@dedic@fmt
      \fi
      \vskip5mm
      }{}%
    }%
  \box0
  }

\def\add@tok#1#2{\global#1\expandafter{\the#1#2}}
\def\add@xtok#1#2{%
  \begingroup
    %\no@harm
    \xdef\@act{\global\noexpand#1{\the#1#2}}%
    \@act
  \endgroup
  }

\let\prefix\@firstofone
\let\fnms\@firstofone
\let\inits\@gobble
\let\snm\@firstofone
\let\suffix\@firstofone
\let\cny\@firstofone
\let\dept\@firstofone
\let\institution\@firstofone
\let\addr\@firstofone
\let\city\@firstofone
\let\author@block@list\relax
\def\author@block@font{\author@font}
\def\runningtitle#1{%
  \gdef\@runningtitle{#1}%
  }
\def\runningauthor#1{%
  \gdef\@runningauthor{#1}%
  }

\newcounter{author}
\def\print@author@block{%
  \bgroup
    \DeclareRobustCommand\ead[2][]{{\relax}}%
    \long\def\start@tex@env##1[##2]##3\end@tex@env{%
      \def\author{%
        \@ifstar
         {\let\cor@author\relax\@auth@r}
         {\let\cor@author\@undefined\@auth@r}}%
      \setcounter{author}{0}%
      \newcommand\@auth@r[2][]{%
        \stepcounter{author}%
        \xdef\number@of@authors{\the\c@author}%
        \csgdef{author\the\c@author}{%
          ####2%
          }%
        \ifx\cor@author\relax
          \csdef{author\the\c@author corresp}{1}%
        \else
          \cslet{author\the\c@author corresp}{\@undefined}%
        \fi
        \ifx\author@block@list\relax
          \cseappto{author@block@list}{author\the\c@author}%
        \else
          \cseappto{author@block@list}{,author\the\c@author}%
        \fi
        \ignorespaces
        }%
      \let\address\undefined
      \newcommand\address[2][]{\ignorespaces}%
      ##3%
      }%
    \@if@vtex@in@house{%
      \the\document@aug
      \author@block@fmt
      }{}%
  \egroup
  }

\newtoks\author@list
\newcounter{temp@author@cnt}
\def\author@block@fmt{%
  \bgroup
    \author@block@font
    \let\author@prefix\@empty
    \setcounter{temp@author@cnt}{0}%
    \def\do##1{%
      \stepcounter{temp@author@cnt}%
      \ifnum\c@temp@author@cnt>\@ne
        \ifnum\c@temp@author@cnt=\number@of@authors
          \def\author@prefix{\relax\space and\space}%
        \else
          \def\author@prefix{,\space}%
        \fi
      \fi
      \add@xtok\author@list{%
        \author@prefix
        \noexpand\csuse{##1}%
        }%
      }%
    \ifx\author@block@list\relax\else
      \expandafter\docsvlist\expandafter{\author@block@list}%
    \fi
    \the\author@list
    \par
  \egroup
  }

\newcounter{address}
\let\address@block@list\relax
\def\address@block@font{\small\sffamily\raggedright\nohyphen}
\def\printead@prefix{\relax}
\def\orcid@prefix{,\space}
\def\orcid@hrefprefix{http://orcid.org/}
\def\ead@sep{\par}
\def\ead@prefixsep{\relax}
\def\ead@prefix@email{\relax}
\def\ead@prefix@m@email{\relax}
\def\ead@prefix@url{\relax}
\def\ead@prefix@m@url{\relax}
\def\ead@prefix@fax{Fax:\space}
\def\ead@prefix@m@fax{Faxes:\space}
\def\ead@prefix@phone{Tel.:\space}
\def\ead@prefix@m@phone{Tels.:\space}
\def\ead@href#1#2{\href{#1}{#2}}

\RequirePackage{multicol}
\def\address@block@fmt{%
  \@if@vtex@in@house{%
    \vskip1.2\baselineskip
    \raggedcolumns
    \multicolsep\z@
    \addressblock@size
    \begin{multicols}{2}%
      \def\do##1{%
        \seperate@address@block@fmt{##1}%
        }%
      \ifx\author@block@list\relax\else
        \expandafter\docsvlist\expandafter{\author@block@list}%
      \fi
    \end{multicols}%
    }{}%
  }%

\@if@vtex@in@house{}{%
  \long\def\setpkgattr#1#2#3{%
    \expandafter\long\expandafter\gdef\csname #1@#2\endcsname{#3}%
    }%
  }
\setpkgattr{addressblock}{size}{\fontsize{9}{11}\selectfont}
\setpkgattr{history}     {size}{\fontsize{9}{11}\selectfont}
\def\seperate@address@block@fmt#1{%
  \bgroup
    \let\fnms\@firstofone
    \let\inits\@gobble
    \parindent\z@
    \vtop{%
      \csuse{#1}%
      \par
      \csuse{address\@currentaddressblock}%
      \par
      \ifcsname #1ead@ids\endcsname
        \printead@prefix
        \expandafter\printead\expandafter{\csname #1ead@ids\endcsname}%
        \par
      \fi
      }%
    \par
    \vskip\baselineskip
  \egroup
  }

\def\setauthor#1#2#3{%
  \csdef{author#1}{%
    \edef\@currentauthor{#1}%
    \edef\@currentaddressblock{#2}%
    #3%
    }%
  }
\def\print@address@block{%
  \bgroup
    \DeclareRobustCommand\ead[2][]{{%
      \csname before@ead@hook\endcsname
      \setkeys{ead}{label={},email,##1}%
      \@setead{\ead@id}{options}{##1}%
      \@setead{\ead@id}{type}{\ead@type}%
      \@setead{\ead@id}{value}{##2}%
      \@ifundefined{author\@currentauthor ead@ids}
        {%
          \csxdef{author\@currentauthor ead@ids}{\ead@id}%
        }{%
          \csxappto{author\@currentauthor ead@ids}{,\ead@id}%
        }%
      \csname after@ead@hook\endcsname
      }\ignorespaces}%
    \long\def\start@tex@env##1[##2]##3\end@tex@env{%
      \def\author{%
        \@ifstar
         {\let\cor@author\relax\@auth@r}
         {\let\cor@author\@undefined\@auth@r}}%
      \setcounter{author}{0}%
      \let\author@block@list\relax
      \newcommand\@auth@r[2][]{%
        \stepcounter{author}%
        \expandafter\setauthor\expandafter{\the\c@author}{####1}{####2}%
        \ifx\author@block@list\relax
          \cseappto{author@block@list}{author\the\c@author}%
        \else
          \cseappto{author@block@list}{,author\the\c@author}%
        \fi
        \ignorespaces
        }%
      \setcounter{address}{0}%
      \let\address\undefined
      \newcommand\address[2][]{%
        \stepcounter{address}%
        \csdef{address\the\c@address}{####2}%
        }%
      ##3%
      }%
    \@if@vtex@in@house{%
      \the\document@aug
      \address@block@fmt
      }{}%
  \egroup
  }

\def\abstract@fmt#1{%
  \textbf{#1}%
  }
\def\print@abstract{%
  \bgroup
    \ifdefined\document@abstract
      \abstract@font
      \abstract@fmt{\abstractname}%
      \space
      \abovedisplayskip=2mm plus1pt minus 1pt%
      \belowdisplayskip=2mm plus1pt minus 1pt%
      \abovedisplayshortskip=0.0mm%
      \belowdisplayshortskip=2mm plus1pt minus 1pt%
      \long\def\start@tex@env##1[##2]##3\end@tex@env{%
        ##3%
        \par
        \normalfont\normalsize
        \vskip1.8\baselineskip
        }%
      \the\document@abstract
    \fi
  \egroup
  }
%% history month - full name
\def\setvaluelist#1#2{%
  \@tempcnta=0\relax
  \@for\@curr@val:=#2\do{%
    \advance\@tempcnta by1\relax
    \expandafter\protected@xdef\csname #1@item@\the\@tempcnta\endcsname{\@curr@val}%
    }%
  \expandafter\protected@xdef\csname #1@item@0\endcsname{\the\@tempcnta}%
  }
\xdef\getitemvalue#1#2{\noexpand\csname #1@item@#2\endcsname}
\def\sday#1{\gdef\@sday{#1}}
\def\syear#1{\gdef\@syear{#1}}
\def\smonth#1{%
  \gdef\@smonth{%
    \@ifundefined{month@item@#1}%
      {\vtxClassError{\fmt@name}{There is no month with number '#1'!}\@ehc}%
      {\getitemvalue{month}{#1}}%
    }%
  }%
\setvaluelist{month}{January,February,March,April,May,June,July,August,September,October,November,December}
\expandafter\def\csname month@item@0\endcsname{????}

\def\@s@date@undefined{%
  \let\@sday\undefined
  \let\@smonth\undefined
  \let\@syear\undefined
  }
\def\define@history@date#1{%
  \expandafter\def\csname #1\endcsname##1{%
    \@s@date@undefined
    \csgdef{@#1}{##1}%
    \csuse{@#1}%
    \@ifundefined{@sday}
      {\vtxClassError{\fmt@name}{\string\sday{}, \string\smonth{}, \string\syear{} commands missing!}\@ehc}
      {\expandafter\xdef\csname @#1@fmt\endcsname{\@smonth\space\@sday,\space\@syear}}%
    }%
  }
\define@history@date{received}
\define@history@date{revised}
\define@history@date{accepted}
\define@history@date{registered}
\define@history@date{pubonline}
\setpkgattr{history}{preskip}{1.75\baselineskip}
\def\print@history{%
  \vskip\history@preskip
  \bgroup
  \raggedright
  \history@size
  \ifcsname @received\endcsname
    \noindent\textit{Received \@received@fmt}\par
  \fi
  \ifcsname @accepted\endcsname
    \noindent\textit{accepted \@accepted@fmt}\par
  \fi
  \ifcsname @revised\endcsname
    \noindent\textit{in revised form \@revised@fmt}\par
  \fi
  \ifcsname @pubonline\endcsname
    \noindent\textit{published online \@pubonline@fmt}\par
  \fi
  \egroup
  }

\define@key{keyword}{class}{\def\keyword@class{#1}}
\def\keyword@class{KWD}
\setpkgattr{keyword}{KWD}{Key words and phrases}
\setpkgattr{keyword}{MSC}{2010 Mathematics Subject Classification}
\setpkgattr{keyword}{AMS}{AMS Subject Classification}
\setpkgattr{keyword}{JEL}{JEL Classification}
\setpkgattr{keyword}{PACS}{PACS}
\setpkgattr{keyword}{titlesep}{:\ }
\setpkgattr{keyword}{sep}{,\ }
\setpkgattr{keyword}{postfix}{\unskip.}
\setpkgattr{keyword}{titlefont}{\itshape}

\newif\if@firstkwd
\newcommand\kwd[2][]{%
  \bgroup
    \def\@tempa{#1}%
    \if@firstkwd
      \global\@firstkwdfalse
      \let\keyword@sep\@empty
    \fi
    \ifx\@tempa\@empty
      \keyword@sep
    \else
      \@tempa
    \fi
    #2%
  \egroup
  \ignorespaces
  }

\edef\sv@parindent{\the\parindent}
\newtoks\document@keyword
\@if@vtex@in@house{%
    \get@env@toks{keyword}{\document@keyword}%
    \def\print@keywords{%
      \bgroup
        \parindent\sv@parindent
        \rule\z@\footnotesep
        \long\def\start@tex@env##1[##2]##3\end@tex@env{%
          \@firstkwdtrue
          \setkeys{keyword}{##2}%
          \bgroup
            \keyword@titlefont
            \csname keyword@\keyword@class\endcsname
            \csname keyword@titlesep\endcsname
          \egroup
          \ignorespaces
          ##3%
          \csname keyword@postfix\endcsname
          \par
          }%
        \the\document@keyword
      \egroup
      }%
  }{%
    \def\keyword{%
      \@ifnextchar[%
        {\@keyword}%
        {\@keyword[]}%
      }%
    \long\def\@keyword[#1]#2\end{%
      \bgroup
        \@firstkwdtrue
        \global\document@keyword={\ignorespaces #2}%
        \footnotetext{%
          \setkeys{keyword}{#1}%
          \bgroup
            \keyword@titlefont
            \csname keyword@\keyword@class\endcsname
            \csname keyword@titlesep\endcsname
          \egroup
          \the\document@keyword
          }%
        \egroup
      %
      \end{keyword}%
      \@gobble% gobbling parameter {keyword} left after the \end
      }%
  }
%% <<< Frontmatter <<<

\csuse{\fmt@name @load@lastpage@control}
\csuse{\fmt@name @load@arkiv@sections}

\@if@vtex@in@house{}{%
  \newcounter{section}%
  \setcounter{secnumdepth}{6}%
  }

\if@smartrunh\AtEndDocument{\islastpageeven\getlastpagenumber}\fi

\DeclareMathSymbol{\Gamma}{\mathalpha}{letters}{"00}
\DeclareMathSymbol{\Delta}{\mathalpha}{letters}{"01}
\DeclareMathSymbol{\Theta}{\mathalpha}{letters}{"02}
\DeclareMathSymbol{\Lambda}{\mathalpha}{letters}{"03}
\DeclareMathSymbol{\Xi}{\mathalpha}{letters}{"04}
\DeclareMathSymbol{\Pi}{\mathalpha}{letters}{"05}
\DeclareMathSymbol{\Sigma}{\mathalpha}{letters}{"06}
\DeclareMathSymbol{\Upsilon}{\mathalpha}{letters}{"07}
\DeclareMathSymbol{\Phi}{\mathalpha}{letters}{"08}
\DeclareMathSymbol{\Psi}{\mathalpha}{letters}{"09}
\DeclareMathSymbol{\Omega}{\mathalpha}{letters}{"0A}

\setlength\parindent{15\p@}
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{12\p@}
\setlength\headsep{16.74dd}
\setlength\topskip{10\p@}
\setlength\footskip{30\p@}
\setlength\maxdepth{.5\topskip}

\@settopoint\textwidth
\setlength\marginparsep{10\p@}
\setlength\marginparpush{5\p@}
\setlength\topmargin{-10pt}
\if@twocolumn
   \setlength\oddsidemargin{-30\p@}
   \setlength\evensidemargin{-30\p@}
\else
   \setlength\oddsidemargin{\z@}
   \setlength\evensidemargin{\z@}
\fi
\setlength\marginparwidth{48\p@}
\setlength\footnotesep{8\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep{20\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@}
\setlength\@fpsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@}
\setlength\@dblfpsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

%% Setup of the layout (based on ml-afm-author.sty)
\textwidth127mm
\textheight178mm
\topmargin13mm
\headheight2mm
\headsep7mm
\evensidemargin24mm
\oddsidemargin19mm
\parindent7.2mm

\def\@listi{%
  \leftmargin\leftmargini
  \parsep\z@
  \topsep 6\p@ \@plus2\p@ \@minus4\p@
  \itemsep\parsep
  }
\let\@listI\@listi
\@listi
\def\@listii{%
  \leftmargin\leftmarginii
  \labelwidth\leftmarginii
  \advance\labelwidth-\labelsep
  \topsep\z@
  \parsep\topsep
  \itemsep\parsep
  }
\def\@listiii{%
  \leftmargin\leftmarginiii
  \labelwidth\leftmarginiii
  \advance\labelwidth-\labelsep
  \topsep\z@
  \parsep\topsep
  \itemsep\parsep
  }
\def\@listiv{%
  \leftmargin\leftmarginiv
  \labelwidth\leftmarginiv
  \advance\labelwidth-\labelsep
  }
\def\@listv{%
  \leftmargin\leftmarginv
  \labelwidth\leftmarginv
  \advance\labelwidth-\labelsep
  }
\def\@listvi{%
  \leftmargin\leftmarginvi
  \labelwidth\leftmarginvi
  \advance\labelwidth-\labelsep
  }

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{4}
\renewcommand\topfraction{.9}
\setcounter{bottomnumber}{2}
\renewcommand\bottomfraction{.7}
\setcounter{totalnumber}{6}
\renewcommand\textfraction{.1}
\renewcommand\floatpagefraction{.85}
\setcounter{dbltopnumber}{3}
\renewcommand\dbltopfraction{.85}
\renewcommand\dblfloatpagefraction{.85}
%% make indentations changeable
\def\setitemindent#1{%
  \settowidth{\labelwidth}{#1}%
  \leftmargini\labelwidth
  \advance\leftmargini\labelsep
  \def\@listi{%
    \leftmargin\leftmargini
    \labelwidth\leftmargini\advance\labelwidth by -\labelsep
    \parsep=\parskip
    \topsep=\medskipamount
    \itemsep=\parskip \advance\itemsep by -\parsep
    }%
  }
\def\setitemitemindent#1{%
  \settowidth{\labelwidth}{#1}%
  \leftmarginii\labelwidth
  \advance\leftmarginii\labelsep
  \def\@listii{%
    \leftmargin\leftmarginii
    \labelwidth\leftmarginii\advance\labelwidth by -\labelsep
    \parsep=\parskip
    \topsep=\z@
    \itemsep=\parskip \advance\itemsep by -\parsep
    }%
  }
%% labels of description
\def\descriptionlabel#1{\hspace\labelsep #1\hfil}
%% adjusted environment "description"
%% if an optional parameter (at the first two levels of lists)
%% is present, its width is considered to be the widest mark
%% throughout the current list.
\def\description{%
  \@ifnextchar[%
    {\@describe}
    {%
      \list{}{%
        \labelwidth\z@
        \itemindent-\leftmargin
        \let\makelabel\descriptionlabel
        }%
    }%
  }
\let\enddescription\endlist
\def\describelabel#1{#1\hfil}
\def\@describe[#1]{%
  \relax
  \ifnum\@listdepth=0
    \setitemindent{#1}%
  \else
    \ifnum\@listdepth=1
      \setitemitemindent{#1}%
    \fi
  \fi
  \list{--}{%
    \let\makelabel\describelabel
    }%
  }

\newdimen\logodepth
\logodepth=2.2cm
\newdimen\headerboxheight
\headerboxheight=180pt % 18 10.5dd-lines - 2\baselineskip
\newdimen\betweenumberspace          % dimension for space between
\betweenumberspace=3.33pt            % number and text of titles.
\newdimen\aftertext                  % dimension for space after
\aftertext=5pt                       % text of title.
\newdimen\headlineindent             % dimension for space between
\headlineindent=1.166cm              % number and text of headings.
\def\andname{and}
\if@mathematic
  \def\runinend{\enspace}
  \def\floatcounterend{\enspace}
  \def\sectcounterend{}
\else
  \def\runinend{.}
  \def\floatcounterend{.\ }
  \def\sectcounterend{.}
\fi
\def\keywordname{{\bfseries Key words\runinend}}
\def\lastandname{, and}
\def\mailname{{\itshape Correspondence to\/}:}
\def\email#1{{e-mail: \tt#1}}

\newcounter{inst}
\newcounter{auth}
\def\authdepth{2}
\newdimen\instindent
\def\authorfont{\bfseries}

\def\combirunning#1{\gdef\@combi{#1}}
\def\@combi{}
\newbox\combirun
\newcounter{lastpage}
\def\islastpageeven{%
  \@ifundefined{lastpagenumber}
    {\setcounter{lastpage}{0}}
    {\setcounter{lastpage}{\lastpagenumber}}%
  \ifnum\value{lastpage}>0
    \ifodd\value{lastpage}%
    \else
      \if@smartrunh
        \thispagestyle{last}%
      \fi
    \fi
  \fi
  }
\def\getlastpagenumber{%
  \clearpage
  \addtocounter{page}{-1}%
  \immediate\write\@auxout{\string\gdef\string\lastpagenumber{\thepage}}%
  \immediate\write\@auxout{\string\newlabel{LastPage}{{}{\thepage}}}%
  \addtocounter{page}{1}%
  }

\def\journalname#1{\gdef\@journalname{#1}}

\def\dedicationfont{\small\itshape}
\def\@dedic@fmt{%
  \par
  \vskip3.5mm
  \dedication@font
  \begin{center}%
    \@dedic\par
  \end{center}%
  }
\def\dedication#1{%
  \gdef\@dedic{#1}%
  \@if@vtex@in@house{}{%
    \@dedic@fmt
    }%
  }
\def\@dedic{}

\let\@date\undefined

\def\institute#1{\gdef\@institute{#1}}
\def\institutename{%
  \par
  \begingroup
    \parindent=0pt
    \parskip=0pt
    \setcounter{inst}{1}%
    \def\and{%
      \par
      \stepcounter{inst}%
      \if@instindent
        \hangindent
        \instindent
      \fi
      \noindent
      \hbox to\instindent{\hss$^{\theinst}$\enspace}%
      \ignorespaces
      }%
    \setbox0=\vbox{\def\thanks##1{}\@institute}%
    \ifnum\value{inst}>9\relax
      \setbox0=\hbox{$^{88}$\enspace}%
    \else
      \setbox0=\hbox{$^{8}$\enspace}%
    \fi
    \instindent=\wd0\relax
    \ifnum\value{inst}=1\relax
    \else
      \setcounter{inst}{1}%
      \if@instindent
        \hangindent
        \instindent
      \fi
      \noindent
      \hbox to\instindent{\hss$^{\theinst}$\enspace}%
      \ignorespaces
    \fi
    \small
    \ignorespaces
    \@institute
    \par
  \endgroup
  }

\def\offprints#1{%
  \begingroup
    \def\protect{\noexpand\protect\noexpand}%
    \xdef\@thanks{%
      \@thanks
      \protect\footnotetext[0]{%
        \unskip
        \hskip-15pt
        {\itshape Send offprint requests to\/}: \ignorespaces#1%
        }%
      }%
  \endgroup
  \ignorespaces
  }
\def\@thanks{}
\def\@fnsymbol#1{%
  \ifcase#1%
  \or
    \star
  \or
    {\star\star}%
  \or
    {\star\star\star}%
  \or
    \dagger
  \or
    \ddagger
  \or
   \mathchar "278%
  \or
    \mathchar "27B%
  \or
    \|
  \or
    **%
  \or
    \dagger\dagger
  \or
    \ddagger\ddagger
  \else
    \@ctrerr
  \fi
  \relax
  }

\def\inst#1{\unskip$^{#1}$}
\def\fnmsep{\unskip$^,$}

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{}

\def\headnote#1{\gdef\@headnote{#1}}
\def\@headnote{}

\def\ch@ckobl#1#2{%
  \@ifundefined{@#1}%
    {%
      \typeout{SVJour warning: Missing
        \expandafter\string\csname#1\endcsname
        }%
      \csname #1\endcsname{#2}%
    }{}%
  }
\def\fnast#1{%
  \ifcase#1
  \or $\ast$%
  \or $\ast\ast$%
  \or $\ast\ast\ast$%
  \or $\ast\ast\ast\ast$%
  \or $\ast\ast\ast\ast\ast$%
  \or $\ast\ast\ast\ast\ast\ast$%
  \or $\ast\ast\ast\ast\ast\ast\ast$%
  \fi
  }

\def\tens#1{\ensuremath{\mathsf{#1}}}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\def\labelitemi  {\textbullet}
\def\labelitemii {\textendash}
\def\labelitemiii{\textasteriskcentered}
\def\labelitemiv {{\footnotesize +}}

\if@spthms
  %% definition of the "\spnewtheorem" command.
  %%
  %% Usage:
  %%
  %%     \spnewtheorem{env_nam}{caption}[within]{cap_font}{body_font}
  %% or  \spnewtheorem{env_nam}[numbered_like]{caption}{cap_font}{body_font}
  %% or  \spnewtheorem*{env_nam}{caption}{cap_font}{body_font}
  %%
  %% New is "cap_font" and "body_font". It stands for
  %% fontdefinition of the caption and the text itself.
  %%
  %% "\spnewtheorem*" gives a theorem without number.
  %%
  %% A defined spnewthoerem environment is used as described
  %% by Lamport.
  %%
  \def\@thmcountersep{}
  \def\@thmcounterend{}
  \def\spnewtheorem{\@ifstar{\@sthm}{\@Sthm}}
  %% definition of \spnewtheorem with number
  \def\@spnthm#1#2{%
    \@ifnextchar[%
      {\@spxnthm{#1}{#2}}
      {\@spynthm{#1}{#2}}%
    }
  \def\@Sthm#1{%
    \@ifnextchar[%
      {\@spothm{#1}}
      {\@spnthm{#1}}%
    }
  \def\@spxnthm#1#2[#3]#4#5{%
    \expandafter\@ifdefinable\csname #1\endcsname{%
      \@definecounter{#1}%
      \@addtoreset{#1}{#3}%
      \expandafter\xdef\csname the#1\endcsname{%
        \expandafter\noexpand
        \csname the#3\endcsname
        \noexpand\@thmcountersep
        \@thmcounter{#1}%
        }%
     \expandafter\xdef\csname #1name\endcsname{#2}%
     \global\@namedef{#1}{%
       \@spthm{#1}{\csname #1name\endcsname}{#4}{#5}%
       }%
     \global\@namedef{end#1}{\@endtheorem}%
     }%
   }
  \def\@spynthm#1#2#3#4{%
    \expandafter\@ifdefinable\csname #1\endcsname{%
      \@definecounter{#1}%
      \expandafter\xdef\csname the#1\endcsname{\@thmcounter{#1}}%
      \expandafter\xdef\csname #1name\endcsname{#2}%
      \global\@namedef{#1}{\@spthm{#1}{\csname #1name\endcsname}{#3}{#4}}%
      \global\@namedef{end#1}{\@endtheorem}%
      }%
    }
  \def\@spothm#1[#2]#3#4#5{%
    \@ifundefined{c@#2}
      {\@latexerr{No theorem environment `#2' defined}\@eha}%
      {%
        \expandafter\@ifdefinable\csname #1\endcsname{%
          \global\@namedef{the#1}{\@nameuse{the#2}}%
          \expandafter\xdef\csname #1name\endcsname{#3}%
          \global\@namedef{#1}{\@spthm{#2}{\csname #1name\endcsname}{#4}{#5}}%
          \global\@namedef{end#1}{\@endtheorem}%
          }%
      }%
    }
  \def\@spthm#1#2#3#4{%
    \topsep 7\p@ \@plus2\p@ \@minus4\p@
    \refstepcounter{#1}%
    \@ifnextchar[%
      {\@spythm{#1}{#2}{#3}{#4}}
      {\@spxthm{#1}{#2}{#3}{#4}}%
    }
  \def\@spxthm#1#2#3#4{%
    \@spbegintheorem{#2}{\csname the#1\endcsname}{#3}{#4}%
    \ignorespaces
    }
  \def\@spythm#1#2#3#4[#5]{%
    \@ifnextchar[%
      {\@spymthm{#1}{#2}{#3}{#4}[{#5}]}
      {\@spyothm{#1}{#2}{#3}{#4}[{#5}]}%
    }
  \def\@spymthm#1#2#3#4[#5][#6]{%
    \@spopargbegintheorem{#2}{\csname the#1\endcsname#6}{#5}{#3}{#4}%
    \ignorespaces
    }
  \def\@spyothm#1#2#3#4[#5]{%
    \@spopargbegintheorem{#2}{\csname the#1\endcsname }{#5}{#3}{#4}%
    \ignorespaces
    }
  \def\@spbegintheorem#1#2#3#4{%
    \trivlist
    \item[\hskip\labelsep{#3#1\ #2\@thmcounterend}]#4%
    }
  \def\@spopargbegintheorem#1#2#3#4#5{%
    \trivlist
    \item[\hskip\labelsep{#4#1\ #2}]{#4(#3)\@thmcounterend\ }#5%
    }
  %% definition of \spnewtheorem* without number
  \def\@sthm#1#2{%
    \@Ynthm{#1}{#2}%
    }
  \def\@Ynthm#1#2#3#4{%
    \expandafter\@ifdefinable\csname #1\endcsname{%
      \global\@namedef{#1}{\@Thm{\csname #1name\endcsname}{#3}{#4}}%
      \expandafter\xdef\csname #1name\endcsname{#2}%
      \global\@namedef{end#1}{\@endtheorem}%
      }%
    }
  \def\@Thm#1#2#3{%
    \topsep 7\p@ \@plus2\p@ \@minus4\p@
    \@ifnextchar[%
      {\@Ythm{#1}{#2}{#3}}
      {\@Xthm{#1}{#2}{#3}}%
    }
  \def\@Xthm#1#2#3{\@Begintheorem{#1}{#2}{#3}\ignorespaces}
  \def\@Ythm#1#2#3[#4]{\@Opargbegintheorem{#1}{#4}{#2}{#3}\ignorespaces}
  \def\@Begintheorem#1#2#3{%
    #3%
    \trivlist
    \item[\hskip\labelsep{#2#1\@thmcounterend}]%
    }
  \def\@Opargbegintheorem#1#2#3#4{%
    #4%
    \trivlist
    \item[\hskip\labelsep{#3#1}]{#3(#2)\@thmcounterend\ }%
    }
  \if@envcntsect
    \def\@thmcountersep{.}
    \spnewtheorem{theorem}{Theorem}[section]{\bfseries}{\cmrxishape}
  \else
    \spnewtheorem{theorem}{Theorem}{\bfseries}{\cmrxishape}
    \if@envcntreset
      \@addtoreset{theorem}{section}
    \else
      \if@envcntsubsectreset
        \@addtoreset{theorem}{subsection}
      \else
        \if@envcntparagraphreset
          \@addtoreset{theorem}{paragraph}
          \@addtoreset{equation}{paragraph}
        \else
          \@addtoreset{theorem}{chapter}
        \fi
      \fi
    \fi
  \fi
  \spnewtheorem*{claim}{Claim}{\itshape}{\rmfamily}
  \spnewtheorem*{proof}{Proof}{\itshape}{\rmfamily}
  \if@envcntsame
    \def\spn@wtheorem#1#2#3#4{\@spothm{#1}[theorem]{#2}{#3}{#4}}
  \else
    \if@envcntsect
      \def\spn@wtheorem#1#2#3#4{\@spxnthm{#1}{#2}[section]{#3}{#4}}
    \else
      \if@envcntreset
        \def\spn@wtheorem#1#2#3#4{%
          \@spynthm{#1}{#2}{#3}{#4}%
          \@addtoreset{#1}{section}%
          }
      \else
        \let\spn@wtheorem=\@spynthm
      \fi
    \fi
  \fi

  \spn@wtheorem{case}{Case}{\itshape}{\rmfamily}
  \spn@wtheorem{conjecture}{Conjecture}{\itshape}{\rmfamily}
  \spn@wtheorem{corollary}{Corollary}{\bfseries}{\cmrxishape}
  \spn@wtheorem{definition}{Definition}{\itshape}{\rmfamily}
  \spn@wtheorem{example}{Example}{\itshape}{\rmfamily}
  \spnewtheorem*{examplenn}{Example}{\itshape}{\rmfamily}
  \spn@wtheorem{exercise}{Exercise}{\bfseries}{\rmfamily}
  \spn@wtheorem{lemma}{Lemma}{\bfseries}{\cmrxishape}
  \spn@wtheorem{note}{Note}{\itshape}{\rmfamily}
  \spn@wtheorem{problem}{Problem}{\itshape}{\rmfamily}
  \spn@wtheorem{property}{Property}{\itshape}{\rmfamily}
  \spn@wtheorem{proposition}{Proposition}{\bfseries}{\cmrxishape}
  \spn@wtheorem{question}{Question}{\itshape}{\rmfamily}
  \spn@wtheorem{solution}{Solution}{\bfseries}{\rmfamily}
  \spn@wtheorem{remark}{Remark\/}{\itshape}{\rmfamily}

  \def\@takefromreset#1#2{%
    \def\@tempa{#1}%
    \let\@tempd\@elt
    \def\@elt##1{%
      \def\@tempb{##1}%
      \ifx\@tempa\@tempb
      \else
        \@addtoreset{##1}{#2}%
      \fi
      }%
    \expandafter\expandafter\let\expandafter\@tempc\csname cl@#2\endcsname
    \expandafter\def\csname cl@#2\endcsname{}%
    \@tempc
    \let\@elt\@tempd
    }
  \def\theopargself{%
    \def\@spopargbegintheorem##1##2##3##4##5{%
      \trivlist
      \item[\hskip\labelsep{##4##1\ ##2}]{##4##3\@thmcounterend\ }##5%
      }%
    \def\@Opargbegintheorem##1##2##3##4{%
      ##4%
      \trivlist
      \item[\hskip\labelsep{##3##1}]{##3##2\@thmcounterend\ }%
      }%
    }
\fi

\def\squareforqed{\hbox{\rlap{$\sqcap$}$\sqcup$}}
\def\qed{\ifmmode\else\unskip\quad\fi\squareforqed}

\newenvironment{verse}
  {%
    \let\\\@centercr
    \list{}{%
      \itemsep      \z@
      \itemindent   -1.5em%
      \listparindent\itemindent
      \rightmargin  \leftmargin
      \advance\leftmargin 1.5em
      }%
    \item\relax
  }{%
    \endlist
  }
\newenvironment{quotation}
  {%
    \list{}{%
      \listparindent 1.5em%
      \itemindent    \listparindent
      \rightmargin   \leftmargin
      \parsep        \z@ \@plus\p@
      }%
    \item\relax
  }{%
    \endlist
  }
\newenvironment{quote}
  {%
    \list{}{%
      \rightmargin\leftmargin
      }%
    \item\relax
  }{%
    \endlist
  }
\let\appendix\relax
\newcommand\appendix{%
  \par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand\thesection{\@Alph\c@section}%
  }
\setlength\arraycolsep{1.5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand\theequation{\@arabic\c@equation}
\newcounter{figure}
\renewcommand\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
  {\appto\@floatboxreset{\centering\leavevmode}\@float{figure}}
  {\end@float}
\newenvironment{figure*}
  {\appto\@floatboxreset{\centering\leavevmode}\@dblfloat{figure}}
  {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
  {\appto\@floatboxreset{\centering\leavevmode}\@float{table}}
  {\end@float}
\newenvironment{table*}
  {\appto\@floatboxreset{\centering\leavevmode}\@dblfloat{table}}
  {\end@dblfloat}

\def\@floatboxreset{%
  \reset@font
  \small
  \@setnobreak
  \@setminipage
  }

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\newcommand\leftlegendglue{}

\def\fig@type{figure}
\newdimen\figcapgap\figcapgap=3pt
\newdimen\tabcapgap\tabcapgap=5.5pt
\@ifundefined{floatlegendstyle}
  {\def\floatlegendstyle{\rmfamily}}
  {}

\long\def\@caption#1[#2]#3{%
  \par
  \addcontentsline{\csname ext@#1\endcsname}{#1}{%
    \protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}%
    }%
  \begingroup
    \@parboxrestore
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}%
    \par
  \endgroup
  }

\def\capstrut{\vrule\@width\z@\@height\topskip}
\@ifundefined{captionstyle}
  {\def\captionstyle{\normalfont\small}}
  {}

\long\def\@makecaption#1#2{%
  \captionstyle
  \ifx\@captype\fig@type
    \vskip\figcapgap
  \fi
  \setbox\@tempboxa\hbox{%
    {\floatlegendstyle #1\floatcounterend}%
    \capstrut #2%
    }%
  \ifdim\wd\@tempboxa >\hsize
    {\floatlegendstyle #1\floatcounterend}%
    \capstrut #2%
    \par
  \else
    \hbox to\hsize{\leftlegendglue\unhbox\@tempboxa\hfil}%
  \fi
  \ifx\@captype\fig@type
  \else
    \vskip\tabcapgap
  \fi
  }

\newdimen\figgap\figgap=1cc
\long\def\@makesidecaption#1#2{%
  \parbox[b]{\@tempdima}{%
    \captionstyle{\floatlegendstyle #1\floatcounterend}%
    #2%
    }%
  }
\def\sidecaption#1\caption{%
  \setbox\@tempboxa=\hbox{#1\unskip}%
  \if@twocolumn
    \ifdim\hsize<\textwidth
    \else
      \ifdim\wd\@tempboxa<\columnwidth
        \typeout{Double column float fits into single column -
          ^^Jyou'd better switch the environment. }%
      \fi
    \fi
  \fi
  \@tempdima=\hsize
  \advance\@tempdima by-\figgap
  \advance\@tempdima by-\wd\@tempboxa
  \ifdim\@tempdima<3cm
    \typeout{\string\sidecaption: No sufficient room for the legend;
      using normal \string\caption. }%
    \unhbox\@tempboxa
    \let\@capcommand=\@caption
  \else
    \let\@capcommand=\@sidecaption
    \leavevmode
    \unhbox\@tempboxa
    \hfill
  \fi
  \refstepcounter\@captype
  \@dblarg{\@capcommand\@captype}%
  }

\long\def\@sidecaption#1[#2]#3{%
  \addcontentsline{\csname ext@#1\endcsname}{#1}{%
    \protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}%
    }%
  \begingroup
    \@parboxrestore
    \@makesidecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}%
    \par
  \endgroup
  }

\def\acknowledgement{%
  \par
  \addvspace{17pt}%
  \small\rmfamily
  \trivlist
  \if!\ackname!%
    \item[]%
  \else
    \item[\hskip\labelsep{\it\ackname}]%
  \fi
  }
\def\endacknowledgement{%
  \endtrivlist
  \addvspace{6pt}%
  }

\def\noteadd{%
  \par
  \addvspace{17pt}%
  \small\rmfamily
  \trivlist
  \item[\hskip\labelsep{\itshape\noteaddname}]%
  }
\def\endnoteadd{%
  \endtrivlist
  \addvspace{6pt}%
  }

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{1}
\newcommand\tableofcontents{%
  \section*{\contentsname}%
  \@starttoc{toc}%
  \addtocontents{toc}{\begingroup\protect\small}%
  \AtEndDocument{\addtocontents{toc}{\endgroup}}%
  }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {%
        \leavevmode
        \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}%
      }%
      \par
      \nobreak
      \if@compatibility
        \global\@nobreaktrue
        \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi
  }
\newcommand*\l@section{\@dottedtocline{1}{0pt}{1.5em}}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
  \section*{%
    \listfigurename
    \@mkboth{\listfigurename}{\listfigurename}%
    }%
  \@starttoc{lof}%
  }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
  \section*{%
    \listtablename
    \@mkboth{\listtablename}{\listtablename}%
    }%
  \@starttoc{lot}%
  }
\let\l@table\l@figure

\newenvironment{theindex}
  {%
    \if@twocolumn
      \@restonecolfalse
    \else
      \@restonecoltrue
    \fi
    \columnseprule \z@
    \columnsep 35\p@
    \twocolumn[\section*{\indexname}]%
    \@mkboth{\indexname}{\indexname}%
    \expandafter\ifnum\the\c@page>\@firstpage\relax
      \thispagestyle{plain}%
    \fi
    \parindent\z@
    \parskip\z@ \@plus .3\p@\relax
    \let\item\@idxitem
  }{%
    \if@restonecol
      \onecolumn
    \else
      \clearpage
    \fi
  }
\newcommand\@idxitem{%
  \par
  \hangindent 40\p@
  }
\newcommand\subitem{%
  \@idxitem
  \hspace*{20\p@}%
  }
\newcommand\subsubitem{%
  \@idxitem
  \hspace*{30\p@}%
  }
\newcommand\indexspace{%
  \par
  \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax
  }
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@
  }
\newcommand\@makefntext[1]{%
  \noindent
  \hb@xt@\bibindent{\hss\@makefnmark\enspace}%
  #1%
  }

\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Fig.}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract\runinend}
\newcommand\ackname{Acknowledgements\runinend}
\newcommand\noteaddname{Note added in proof}
\def\ds@francais{%
  \typeout{On parle francais.}%
  \def\abstractname{R\'esum\'e\runinend}%
  \def\ackname{Remerciements\runinend}%
  \def\andname{et}%
  \def\lastandname{ et}%
  \def\appendixname{Appendice}
  \def\chaptername{Chapitre}%
  \def\claimname{Pr\'etention}%
  \def\conjecturename{Hypoth\`ese}%
  \def\contentsname{Table des mati\`eres}%
  \def\corollaryname{Corollaire}%
  \def\definitionname{D\'efinition}%
  \def\examplename{Exemple}%
  \def\exercisename{Exercice}%
  \def\figurename{Fig.}%
  \def\keywordname{{\bfseries Mots-cl\'e\runinend}}
  \def\indexname{Index}
  \def\lemmaname{Lemme}%
  \def\contriblistname{Liste des contributeurs}
  \def\listfigurename{Liste des figures}%
  \def\listtablename{Liste des tables}%
  \def\mailname{{\itshape Correspondence to\/}:}
  \def\noteaddname{Note ajout\'ee \`a l'\'epreuve}%
  \def\notename{Remarque}%
  \def\partname{Partie}%
  \def\problemname{Probl\`eme}%
  \def\proofname{\'Epreuve}%
  \def\propertyname{Caract\'eristique}%
  \def\questionname{Question}%
  \def\remarkname{Remarque}%
  \def\seename{voyez}
  \def\solutionname{Solution}%
  \def\tablename{Tableau}%
  \def\theoremname{Th\'eor\`eme}%
  }
\def\ds@deutsch{%
  \typeout{Man spricht deutsch.}%
  \def\abstractname{Zusammenfassung\runinend}%
  \def\ackname{Danksagung\runinend}%
  \def\andname{und}%
  \def\lastandname{ und}%
  \def\appendixname{Anhang}%
  \def\chaptername{Kapitel}%
  \def\claimname{Behauptung}%
  \def\conjecturename{Hypothese}%
  \def\contentsname{Inhaltsverzeichnis}%
  \def\corollaryname{Korollar}%
  \def\examplename{Beispiel}%
  \def\exercisename{\"Ubung}%
  \def\figurename{Abb.}%
  \def\keywordname{{\bfseries Schl\"usselw\"orter\runinend}}
  \def\indexname{Index}
  \def\contriblistname{Mitarbeiter}
  \def\listfigurename{Abbildungsverzeichnis}%
  \def\listtablename{Tabellenverzeichnis}%
  \def\mailname{{\itshape Correspondence to\/}:}
  \def\noteaddname{Nachtrag}%
  \def\notename{Anmerkung}%
  \def\partname{Teil}%
  \def\proofname{Beweis}%
  \def\propertyname{Eigenschaft}%
  \def\questionname{Frage}%
  \def\refname{Literatur}%
  \def\remarkname{Anmerkung}%
  \def\seename{siehe}
  \def\solutionname{L\"osung}%
  \def\tablename{Tabelle}%
  }
\AtBeginDocument{\switch@texts}
\newcommand\today{}
\edef\today{%
  \ifcase\month
  \or
    January%
  \or
    February%
  \or
    March%
  \or
    April%
  \or
    May%
  \or
    June%
  \or
    July%
  \or
    August%
  \or
    September%
  \or
    October%
  \or
    November%
  \or
    December%
  \fi
  \space\number\day, \number\year
  }
\setlength\columnsep{1.5cc}
\setlength\columnseprule{0\p@}
\frenchspacing
\clubpenalty=10000
\widowpenalty=10000
\def\thisbottomragged{%
  \def\@textbottom{%
    \vskip\z@ plus.0001fil
    \global\let\@textbottom\relax
    }%
  }
\pagenumbering{arabic}
\if@twocolumn
   \twocolumn
\fi
\if@referee
   \makereferee
\fi
\flushbottom

%% Experimental Eqnarray
\def\@@eqnl{2.5em}

\def\Eqnarray{%
  \stepcounter{equation}%
  \def\@currentlabel{\p@equation\theequation}%
  \global\@eqnswtrue
  \m@th
  \global\@eqcnt\z@
  \tabskip\z@
  \let\\\@eqncr
  $$%
    \everycr{}%
    \halign to\displaywidth
    \bgroup
      \hskip\z@
      \hbox to 0pt{\hskip\@@eqnl$\displaystyle\tabskip0pt {##}$\hss}
      \@eqnsel
      &\global\@eqcnt\@ne
      \hskip\tw@\arraycolsep
      \hfil${##}$%\hfil
      \tabskip0pt \@plus1fil
      &\global\@eqcnt\tw@  %\hskip \tw@\arraycolsep
      $\displaystyle{##}$%\hfil
      \tabskip\z@
      &\global\@eqcnt\thr@@
      \hb@xt@\z@\bgroup\hss##\egroup
      \tabskip\z@skip
      \cr
  }
\def\endEqnarray{%
      \@@eqncr
    \egroup
    \global\advance\c@equation\m@ne
  $$\@ignoretrue
  }
\let\@eqnsel=\relax
\def\nonumber{\global\@eqnswfalse}
\def\@eqncr{%
  {\ifnum0=`}\fi
  \@ifstar
    {%
      \global\@eqpen\@M\@yeqncr
    }{%
      \global\@eqpen\interdisplaylinepenalty
      \@yeqncr
    }%
  }
\def\@yeqncr{\@testopt\@xeqncr\z@skip}
\def\@xeqncr[#1]{%
  \ifnum0=`{\fi}%
  \@@eqncr
  \noalign{\penalty\@eqpen\vskip\jot\vskip #1\relax}%
  }
\def\@@eqncr{%
  \let\reserved@a\relax
  \ifcase\@eqcnt
    \def\reserved@a{& & &}%
  \or
    \def\reserved@a{& &}%
  \or
    \def\reserved@a{&}%
  \else
    \let\reserved@a\@empty
    \@latex@error{Too many columns in eqnarray environment}\@ehc
  \fi
  \reserved@a
  \if@eqnsw
    \@eqnnum\stepcounter{equation}%
  \fi
  \global\@eqnswtrue
  \global\@eqcnt\z@
  \cr
  }
\let\@seqncr=\@eqncr
\@namedef{Eqnarray*}{%
  \def\@eqncr{\nonumber\@seqncr}%
  \def\@@eqnl{0em}%
  \Eqnarray
  }
\@namedef{endEqnarray*}{%
  \nonumber
  \endEqnarray
  }
\def\lefteqn#1{\rlap{$\displaystyle #1$}}

%% >>> from ml-afm-author.sty >>>
\usepackage[leqno]{amsmath}
\usepackage{amssymb}
\@if@vtex@in@house{%
  \usepackage[cmtip]{xypic}%
  }{}
\def\DOIt{}
\def\doit@xtcode{}
\def\DOImsnr#1{}
\def\DOIyear#1{}

%% In draft mode all italic numbers, parantheses, colons and dots appear
%% invers. We want to find them.
\if@inv
  \DeclareFontShape{OT1}{cmr}{m}{it}{ <->LECMTI10 }{}
\fi

%% Current TeX distributions use the bluesky type-1 fonts
%% but the original cm big arrowheads are wanted
%% Hence we use old-cmsy to replace the arrow heads with
%% that of the BaKoMa font set

%% We first save the small arrow heads
\let\rightsmallarrow\rightarrow
\let\leftsmallarrow\leftarrow
\let\leftrightsmallarrow\leftrightarrow
\let\upsmallarrow\uparrow
\let\downsmallarrow\downarrow
\let\updownsmallarrow\updownarrow
\let\nesmallarrow\nearrow
\let\sesmallarrow\searrow
\let\nwsmallarrow\nwarrow
\let\swsmallarrow\swarrow

%% Here we make sure that \varinjlim, \varprojlim, \overrightarrow, ...
%% use the small arrow heads

%% This code has to be run after amsmath is loaded
%% This is modifications of definitions in amsmath.sty and amsopn.sty
\def\leftsmallarrowfill@{\arrowfill@\leftsmallarrow\relbar\relbar}
\def\rightsmallarrowfill@{\arrowfill@\relbar\relbar\rightsmallarrow}
\def\leftrightsmallarrowfill@{\arrowfill@\leftsmallarrow\relbar\rightsmallarrow}
\def\varinjlim{%
  \mathop{\mathpalette\varlim@{\rightsmallarrowfill@\textstyle}}\nmlimits@
  }
\def\varprojlim{%
  \mathop{\mathpalette\varlim@{\leftsmallarrowfill@\textstyle}}\nmlimits@
  }
\renewcommand{\overrightarrow}{%
  \mathpalette{\overarrow@\rightsmallarrowfill@}%
  }
\renewcommand{\overleftarrow}{%
  \mathpalette{\overarrow@\leftsmallarrowfill@}%
  }
\renewcommand{\overleftrightarrow}{%
  \mathpalette{\overarrow@\leftrightsmallarrowfill@}%
  }
\renewcommand{\underrightarrow}{%
  \mathpalette{\underarrow@\rightsmallarrowfill@}%
  }
\renewcommand{\underleftarrow}{%
  \mathpalette{\underarrow@\leftsmallarrowfill@}%
  }
\renewcommand{\underleftrightarrow}{%
  \mathpalette{\underarrow@\leftrightsmallarrowfill@}%
  }

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
%% lmodern largesymbols switch to cmex (lmodern bug - lmex contains only fixed size lmex10)
%% declare `cmex` to be arbitrary scalable
\DeclareFontShape{OMX}{cmex}{m}{n}{
  <-7.5> cmex7
  <7.5-8.5> cmex8
  <8.5-9.5> cmex9
  <9.5-> cmex10
}{}
\SetSymbolFont{largesymbols}{normal}{OMX}{cmex}{m}{n}
\SetSymbolFont{largesymbols}{bold}  {OMX}{cmex}{m}{n}

\DeclareFontFamily{U}{old-cmsy}{}
\DeclareFontShape{U}{old-cmsy}{m}{n}{ <->cmsy10 }{}
\DeclareSymbolFont{old-symbols}{U}{cmsy}{m}{n}
\SetSymbolFont{old-symbols}{normal}{U}{old-cmsy}{m}{n}

\DeclareMathSymbol{\leftrightarrow}{\mathrel}{old-symbols}{"24}
\DeclareMathSymbol{\leftarrow}{\mathrel}{old-symbols}{"20}
\let\gets=\leftarrow
\DeclareMathSymbol{\rightarrow}{\mathrel}{old-symbols}{"21}
\DeclareMathDelimiter{\uparrow}{\mathrel}{old-symbols}{"22}{largesymbols}{"78}
\DeclareMathDelimiter{\downarrow}{\mathrel}{old-symbols}{"23}{largesymbols}{"79}
\DeclareMathDelimiter{\updownarrow}{\mathrel}{old-symbols}{"6C}{largesymbols}{"3F}
\DeclareMathSymbol{\nearrow}{\mathrel}{old-symbols}{"25}
\DeclareMathSymbol{\searrow}{\mathrel}{old-symbols}{"26}
\DeclareMathSymbol{\nwarrow}{\mathrel}{old-symbols}{"2D}
\DeclareMathSymbol{\swarrow}{\mathrel}{old-symbols}{"2E}

\DeclareFontFamily{OT1}{ml-cmr}{\hyphenchar\font45 }
\DeclareFontShape{OT1}{ml-cmr}{m}{n}
  { <-> cmr10}{}
\DeclareFontShape{OT1}{ml-cmr}{m}{sl}
  { <-> cmsl10}{}
\DeclareFontShape{OT1}{ml-cmr}{m}{it}
  { <-> cmti10}{}
\DeclareFontShape{OT1}{ml-cmr}{m}{sc}
  { <-> cmcsc10}{}
\DeclareFontShape{OT1}{ml-cmr}{m}{ui}
  { <-> cmu10}{}
\DeclareFontShape{OT1}{ml-cmr}{b}{n}
  { <-> cmb10}{}
\DeclareFontShape{OT1}{ml-cmr}{bx}{n}
  { <-> cmbx10}{}
\DeclareFontShape{OT1}{ml-cmr}{bx}{sl}
  { <-> cmbxsl10}{}
\DeclareFontShape{OT1}{ml-cmr}{bx}{it}
  { <-> cmbti10}{}

%% Capital greek letters should be upright
\DeclareMathSymbol{\Gamma}{\mathalpha}{operators}{"00}
\DeclareMathSymbol{\Delta}{\mathalpha}{operators}{"01}
\DeclareMathSymbol{\Theta}{\mathalpha}{operators}{"02}
\DeclareMathSymbol{\Lambda}{\mathalpha}{operators}{"03}
\DeclareMathSymbol{\Xi}{\mathalpha}{operators}{"04}
\DeclareMathSymbol{\Pi}{\mathalpha}{operators}{"05}
\DeclareMathSymbol{\Sigma}{\mathalpha}{operators}{"06}
\DeclareMathSymbol{\Upsilon}{\mathalpha}{operators}{"07}
\DeclareMathSymbol{\Phi}{\mathalpha}{operators}{"08}
\DeclareMathSymbol{\Psi}{\mathalpha}{operators}{"09}
\DeclareMathSymbol{\Omega}{\mathalpha}{operators}{"0A}

%% re-enable \everydisplay that is suppressed by amsmath
\let\save@displaystyle\displaystyle
\def\displaystyle{\save@displaystyle\the\everydisplay}

%% math skips for display formulas
\everydisplay\@xp{\the\everydisplay\set@mu@display}
\def\set@mu@display{%
  \thinmuskip3mu%
  \medmuskip1mu%
  \thickmuskip3mu%
  }

%% math skips for inline formulas
\everymath\@xp{\the\everymath\set@my@inline}
\def\set@my@inline{%
  \thinmuskip3mu%
  \medmuskip1mu%
  \thickmuskip1mu%
  }

%% Special Mittag-Leffler fonts
\@if@vtex@in@house
  {%
    \DeclareFontFamily{OMS}{mlsy}{}%
    \DeclareFontShape{OMS}{mlsy}{m}{n}{ <-> mlsy10 }{}%
    \DeclareSymbolFont{mlsymbols}{OMS}{mlsy}{m}{n}%
    \SetSymbolFont{mlsymbols}{normal}{OMS}{mlsy}{m}{n}%
    %
    \DeclareMathSymbol{\ltop}{\mathord}{mlsymbols}{0}%
    \DeclareMathSymbol{\rtop}{\mathord}{mlsymbols}{1}%
    \DeclareMathSymbol{\lbot}{\mathord}{mlsymbols}{2}%
    \DeclareMathSymbol{\rbot}{\mathord}{mlsymbols}{3}%
    \DeclareMathSymbol{\circ}{\mathrel}{mlsymbols}{4}%
    \DeclareMathSymbol{\bullet}{\mathord}{mlsymbols}{5}%
    \DeclareMathSymbol{\digamma}{\mathord}{mlsymbols}{6}%
    \DeclareMathSymbol{\varkappa}{\mathord}{mlsymbols}{7}%
    %
    \DeclareMathSymbol{\widebarcA}{\mathalpha}{mlsymbols}{8}%
    \DeclareMathSymbol{\widebarcB}{\mathalpha}{mlsymbols}{9}%
    \DeclareMathSymbol{\widebarcC}{\mathalpha}{mlsymbols}{10}%
    \DeclareMathSymbol{\widebarcD}{\mathalpha}{mlsymbols}{11}%
    \DeclareMathSymbol{\widebarcE}{\mathalpha}{mlsymbols}{12}%
    \DeclareMathSymbol{\widebarcF}{\mathalpha}{mlsymbols}{13}%
    \DeclareMathSymbol{\widebarcG}{\mathalpha}{mlsymbols}{14}%
    \DeclareMathSymbol{\widebarcH}{\mathalpha}{mlsymbols}{15}%
    \DeclareMathAccent{\widebarA}{\mathalpha}{mlsymbols}{8}%
    \DeclareMathAccent{\widebarB}{\mathalpha}{mlsymbols}{9}%
    \DeclareMathAccent{\widebarC}{\mathalpha}{mlsymbols}{10}%
    \DeclareMathAccent{\widebarD}{\mathalpha}{mlsymbols}{11}%
    \DeclareMathAccent{\widebarE}{\mathalpha}{mlsymbols}{12}%
    \DeclareMathAccent{\widebarF}{\mathalpha}{mlsymbols}{13}%
    \DeclareMathAccent{\widebarG}{\mathalpha}{mlsymbols}{14}%
    \DeclareMathAccent{\widebarH}{\mathalpha}{mlsymbols}{15}%
    %
    \DeclareMathSymbol{\widecheckcA}{\mathalpha}{mlsymbols}{16}%
    \DeclareMathSymbol{\widecheckcB}{\mathalpha}{mlsymbols}{17}%
    \DeclareMathSymbol{\widecheckcC}{\mathalpha}{mlsymbols}{18}%
    \DeclareMathSymbol{\widecheckcD}{\mathalpha}{mlsymbols}{19}%
    \DeclareMathSymbol{\widecheckcE}{\mathalpha}{mlsymbols}{20}%
    \DeclareMathSymbol{\widecheckcF}{\mathalpha}{mlsymbols}{21}%
    \DeclareMathSymbol{\widecheckcG}{\mathalpha}{mlsymbols}{22}%
    \DeclareMathSymbol{\widecheckcH}{\mathalpha}{mlsymbols}{23}%
    \DeclareMathAccent{\widecheckA}{\mathalpha}{mlsymbols}{16}%
    \DeclareMathAccent{\widecheckB}{\mathalpha}{mlsymbols}{17}%
    \DeclareMathAccent{\widecheckC}{\mathalpha}{mlsymbols}{18}%
    \DeclareMathAccent{\widecheckD}{\mathalpha}{mlsymbols}{19}%
    \DeclareMathAccent{\widecheckE}{\mathalpha}{mlsymbols}{20}%
    \DeclareMathAccent{\widecheckF}{\mathalpha}{mlsymbols}{21}%
    \DeclareMathAccent{\widecheckG}{\mathalpha}{mlsymbols}{22}%
    \DeclareMathAccent{\widecheckH}{\mathalpha}{mlsymbols}{23}%
    %
    \DeclareMathSymbol{\widebrevecA}{\mathalpha}{mlsymbols}{24}%
    \DeclareMathSymbol{\widebrevecB}{\mathalpha}{mlsymbols}{25}%
    \DeclareMathSymbol{\widebrevecC}{\mathalpha}{mlsymbols}{26}%
    \DeclareMathSymbol{\widebrevecD}{\mathalpha}{mlsymbols}{27}%
    \DeclareMathSymbol{\widebrevecE}{\mathalpha}{mlsymbols}{28}%
    \DeclareMathSymbol{\widebrevecF}{\mathalpha}{mlsymbols}{29}%
    \DeclareMathSymbol{\widebrevecG}{\mathalpha}{mlsymbols}{30}%
    \DeclareMathSymbol{\widebrevecH}{\mathalpha}{mlsymbols}{31}%
    \DeclareMathAccent{\widebreveA}{\mathalpha}{mlsymbols}{24}%
    \DeclareMathAccent{\widebreveB}{\mathalpha}{mlsymbols}{25}%
    \DeclareMathAccent{\widebreveC}{\mathalpha}{mlsymbols}{26}%
    \DeclareMathAccent{\widebreveD}{\mathalpha}{mlsymbols}{27}%
    \DeclareMathAccent{\widebreveE}{\mathalpha}{mlsymbols}{28}%
    \DeclareMathAccent{\widebreveF}{\mathalpha}{mlsymbols}{29}%
    \DeclareMathAccent{\widebreveG}{\mathalpha}{mlsymbols}{30}%
    \DeclareMathAccent{\widebreveH}{\mathalpha}{mlsymbols}{31}%
    %
    \DeclareMathSymbol{\wideveccA}{\mathalpha}{mlsymbols}{32}%
    \DeclareMathSymbol{\wideveccB}{\mathalpha}{mlsymbols}{33}%
    \DeclareMathSymbol{\wideveccC}{\mathalpha}{mlsymbols}{34}%
    \DeclareMathSymbol{\wideveccD}{\mathalpha}{mlsymbols}{35}%
    \DeclareMathSymbol{\wideveccE}{\mathalpha}{mlsymbols}{36}%
    \DeclareMathSymbol{\wideveccF}{\mathalpha}{mlsymbols}{37}%
    \DeclareMathSymbol{\wideveccG}{\mathalpha}{mlsymbols}{38}%
    \DeclareMathSymbol{\wideveccH}{\mathalpha}{mlsymbols}{39}%
    \DeclareMathAccent{\widevecA}{\mathalpha}{mlsymbols}{32}%
    \DeclareMathAccent{\widevecB}{\mathalpha}{mlsymbols}{33}%
    \DeclareMathAccent{\widevecC}{\mathalpha}{mlsymbols}{34}%
    \DeclareMathAccent{\widevecD}{\mathalpha}{mlsymbols}{35}%
    \DeclareMathAccent{\widevecE}{\mathalpha}{mlsymbols}{36}%
    \DeclareMathAccent{\widevecF}{\mathalpha}{mlsymbols}{37}%
    \DeclareMathAccent{\widevecG}{\mathalpha}{mlsymbols}{38}%
    \DeclareMathAccent{\widevecH}{\mathalpha}{mlsymbols}{39}%
  }{}

\newdimen\mytestdimen
\def\@widecheck#1{%
  \let\@cc\widecheckA
  \setbox\mytestbox\hbox{$#1$}%
  \mytestdimen0.2\wd\mytestbox
  \setbox\mytestbox\hbox{$\widecheckcA$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widecheckB\fi
  \setbox\mytestbox\hbox{$\widecheckcB$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widecheckC\fi
  \setbox\mytestbox\hbox{$\widecheckcC$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widecheckD\fi
  \setbox\mytestbox\hbox{$\widecheckcD$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widecheckE\fi
  \setbox\mytestbox\hbox{$\widecheckcE$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widecheckF\fi
  \setbox\mytestbox\hbox{$\widecheckcF$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widecheckG\fi
  \setbox\mytestbox\hbox{$\widecheckcG$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widecheckH\fi
  \@cc{#1}%
  }
\def\@widebar#1{%
  \let\@cc\widebarA
  \setbox\mytestbox\hbox{$#1$}%
  \mytestdimen\wd\mytestbox
  \setbox\mytestbox\hbox{$\widebarcA$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebarB\fi
  \setbox\mytestbox\hbox{$\widebarcB$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebarC\fi
  \setbox\mytestbox\hbox{$\widebarcC$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebarD\fi
  \setbox\mytestbox\hbox{$\widebarcD$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebarE\fi
  \setbox\mytestbox\hbox{$\widebarcE$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebarF\fi
  \setbox\mytestbox\hbox{$\widebarcF$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebarG\fi
  \setbox\mytestbox\hbox{$\widebarcG$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebarH\fi
  \@cc{#1}%
  }
\def\@widebreve#1{%
  \let\@cc\widebreveA
  \setbox\mytestbox\hbox{$#1$}%
  \mytestdimen\wd\mytestbox
  \setbox\mytestbox\hbox{$\widebrevecA$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebreveB\fi
  \setbox\mytestbox\hbox{$\widebrevecB$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebreveC\fi
  \setbox\mytestbox\hbox{$\widebrevecC$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebreveD\fi
  \setbox\mytestbox\hbox{$\widebrevecD$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebreveE\fi
  \setbox\mytestbox\hbox{$\widebrevecE$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebreveF\fi
  \setbox\mytestbox\hbox{$\widebrevecF$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebreveG\fi
  \setbox\mytestbox\hbox{$\widebrevecG$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widebreveH\fi
  \@cc{#1}%
  }
\def\@widevec#1{%
  \let\@cc\widevecA
  \setbox\mytestbox\hbox{$#1$}%
  \mytestdimen\wd\mytestbox
  \setbox\mytestbox\hbox{$\wideveccA$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widevecB\fi
  \setbox\mytestbox\hbox{$\wideveccB$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widevecC\fi
  \setbox\mytestbox\hbox{$\wideveccC$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widevecD\fi
  \setbox\mytestbox\hbox{$\wideveccD$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widevecE\fi
  \setbox\mytestbox\hbox{$\wideveccE$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widevecF\fi
  \setbox\mytestbox\hbox{$\wideveccF$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widevecG\fi
  \setbox\mytestbox\hbox{$\wideveccG$}\ifdim\mytestdimen>\wd\mytestbox\let\@cc\widevecH\fi
  \@cc{#1}%
  }

%% Arrows have different lengths in display and text mode
\let\@rightarrow\rightarrow
\def\longrightarrow{\mathrel{\relbar\joinrel\@rightarrow}}
\def\rightarrow{\mathchoice{\longrightarrow}{\@rightarrow}{\@rightarrow}{\@rightarrow}}
\def\shortrightarrow{\@rightarrow}
\let\shortto=\shortrightarrow
\let\to=\rightarrow

\let\@Rightarrow\Rightarrow
\def\longRightarrow{\mathrel{\Relbar\joinrel\@Rightarrow}}
\def\Rightarrow{\mathchoice{\longRightarrow}{\@Rightarrow}{\@Rightarrow}{\@Rightarrow}}
\def\shortRightarrow{\@Rightarrow}
\let\shortTo=\shortRightarrow

\let\@leftarrow\leftarrow
\def\longleftarrow{\mathrel{\@leftarrow\joinrel\relbar}}
\def\leftarrow{\mathchoice{\longleftarrow}{\@leftarrow}{\@leftarrow}{\@leftarrow}}
\def\shortleftarrow{\@leftarrow}

\let\@Leftarrow\Leftarrow
\def\longLeftarrow{\mathrel{\@Leftarrow\joinrel\Relbar}}
\def\Leftarrow{\mathchoice{\longLeftarrow}{\@Leftarrow}{\@Leftarrow}{\@Leftarrow}}
\def\shortLeftarrow{\@Leftarrow}

\let\@leftrightarrow\leftrightarrow
\def\longleftrightarrow{\mathrel{\@leftarrow\joinrel\@rightarrow}}
\def\leftrightarrow{\mathchoice{\longleftrightarrow}{\@leftrightarrow}{\@leftrightarrow}{\@leftrightarrow}}
\def\shortleftrightarrow{\@leftrightarrow}

\let\@Leftrightarrow\Leftrightarrow
\def\longLeftrightarrow{\mathrel{\@Leftarrow\joinrel\@Rightarrow}}
\def\Leftrightarrow{\mathchoice{\longLeftrightarrow}{\@Leftrightarrow}{\@Leftrightarrow}{\@Leftrightarrow}}
\def\shortLeftrightarrow{\@Leftrightarrow}

%% workaround to reduce the distance between arrows and over-/underset symbols
\renewcommand{\overset}[2]{%
  \binrel@{#2}%
  \binrel@@{\mathop{\kern\z@\check@for@arrows{#2}}\limits^{#1}}%
  }
\renewcommand{\underset}[2]{%
  \binrel@{#2}%
  \binrel@@{\mathop{\kern\z@#2}\limits_{\check@for@arrows@limits{#1}{#2}}}%
  }
\def\check@for@arrows#1{%
  \def\@tempc{0}%
  \def\@tempa{#1}%
  \def\@tempb{\to}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortto}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\rightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortRightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\Rightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longRightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortleftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\leftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longleftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortLeftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\Leftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longLeftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortleftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\leftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longleftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortLeftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\Leftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longLeftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\leftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempa{0}%
  \ifx\@tempa\@tempc
    #1%
  \else
    \smash{#1}%
    \mathchoice
      {\vrule width0pt height1.2mm}%
      {\vrule width0pt height1.2mm}%
      {\vrule width0pt height0.8mm}%
      {\vrule width0pt height0.8mm}%
  \fi
  }

\def\check@for@arrows@limits#1#2{%
  \def\@tempc{0}%
  \def\@tempa{#2}%
  \def\@tempb{\to}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortto}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\rightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortRightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\Rightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longRightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortleftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\leftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longleftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortLeftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\Leftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longLeftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortleftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\leftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longleftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\shortLeftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\Leftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\longLeftrightarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempb{\leftarrow}\ifx\@tempa\@tempb\def\@tempc{1}\fi%
  \def\@tempa{0}%
  \ifx\@tempa\@tempc
    #1%
  \else
    \mathchoice
      {\setbox\@tempboxa\hbox{$\scriptstyle #1$}\@tempdima2mm\advance\@tempdima-\ht\@tempboxa\vrule width0pt height0pt depth0pt\smash{\hbox{\raise\@tempdima\hbox{$\scriptstyle #1$}}}}%
      {\setbox\@tempboxa\hbox{$\scriptstyle #1$}\@tempdima2mm\advance\@tempdima-\ht\@tempboxa\vrule width0pt height0pt depth0pt\smash{\hbox{\raise\@tempdima\hbox{$\scriptstyle #1$}}}}%
      {\setbox\@tempboxa\hbox{$\scriptstyle #1$}\@tempdima2mm\advance\@tempdima-\ht\@tempboxa\vrule width0pt height0pt depth0pt\smash{\hbox{\raise\@tempdima\hbox{$\scriptstyle #1$}}}}%
      {\setbox\@tempboxa\hbox{$\scriptscriptstyle #1$}\@tempdima1.5mm\advance\@tempdima-\ht\@tempboxa\vrule width0pt height0pt depth0pt\smash{\hbox{\raise\@tempdima\hbox{$\scriptscriptstyle #1$}}}}%
  \fi
  }

%% Automatically measure char widths for choosing accent or wideaccent
%% plus exceptions
\if@autowideaccent
    %% These are the concerned accents
    \AtBeginDocument{%
        \let\@widetilde\widetilde
        \let\@widehat\widehat
        \let\@hat\hat
        \def\hat#1{\accentchoice{#1}{\@hat}{\@widehat}}%
        \let\@tilde\tilde
        \def\tilde#1{\accentchoice{#1}{\@tilde}{\@widetilde}}%
        \let\@bar\bar
        \def\bar#1{\accentchoice{#1}{\@bar}{\@widebar}}%
        \let\@check\check
        \def\check#1{\accentchoice{#1}{\@check}{\@widecheck}}%
        \let\@breve\breve
        \def\breve#1{\accentchoice{#1}{\@breve}{\@widebreve}}%
        \let\@vec\vec
        \def\vec#1{\accentchoice{#1}{\@vec}{\@widevec}}%
        \let\widetilde\tilde
        \let\widehat\hat
        }
\fi

%% An auxillary box
\newbox\mytestbox

%% The measurement
\def\accentchoice#1#2#3{%
  \mathchoice
    {\global\setbox\mytestbox\hbox{$\displaystyle#1$}}
    {\global\setbox\mytestbox\hbox{$\textstyle#1$}}
    {\global\setbox\mytestbox\hbox{$\scriptstyle#1$}}
    {\global\setbox\mytestbox\hbox{$\scriptscriptstyle#1$}}%
  \ifdim\wd\mytestbox<0.45em%
    \let\@cc#2
  \else
    \let\@cc#3
  \fi
  \def\@tempa{#1}%
  \def\@tempb{f}\ifx\@tempa\@tempb\let\@cc#2\fi
  \def\@tempb{A}\ifx\@tempa\@tempb\let\@cc#2\fi
  \def\@tempb{I}\ifx\@tempa\@tempb\let\@cc#2\fi
  \def\@tempb{J}\ifx\@tempa\@tempb\let\@cc#2\fi
  \def\@tempb{L}\ifx\@tempa\@tempb\let\@cc#2\fi
  \def\@tempb{\gamma}\ifx\@tempa\@tempb\let\@cc#3\fi
  \def\@tempb{\kappa}\ifx\@tempa\@tempb\let\@cc#3\fi
  \def\@tempb{\chi}\ifx\@tempa\@tempb\let\@cc#3\fi
  \def\@tempb{\psi}\ifx\@tempa\@tempb\let\@cc#2\fi
  \def\@tempb{\Delta}\ifx\@tempa\@tempb\let\@cc#2\fi
  \def\@tempb{\Gamma}\ifx\@tempa\@tempb\let\@cc#3\fi
  \def\@tempb{\Lambda}\ifx\@tempa\@tempb\let\@cc#2\fi
  \def\@tempb{\Xi}\ifx\@tempa\@tempb\let\@cc#3\fi
  \def\@tempb{\mathcal{A}}\ifx\@tempa\@tempb\let\@cc#2\fi
  \def\@tempb{\mathcal{C}}\ifx\@tempa\@tempb\let\@cc#3\fi
  \def\@tempb{\mathcal{E}}\ifx\@tempa\@tempb\let\@cc#3\fi
  \def\@tempb{\mathcal{I}}\ifx\@tempa\@tempb\let\@cc#3\fi
  \def\@tempb{\mathcal{L}}\ifx\@tempa\@tempb\let\@cc#2\fi
  \@cc{#1}%
  }

%% Special ML treatment of mathbb and several characters
\let\orgmathbb\mathbb
\let\mathbb\mathbf
\let\orgBbb\Bbb
\let\Bbb\bf
\let\orgell\ell
\def\ell{l}
\let\epsilon\varepsilon
\let\kappa\varkappa
\let\emptyset\varnothing
\let\smallsetminus\setminus
\mathchardef\semicolon="303B
%% Since 15.01.2007
%% Änderung nach Email von Anders - ell und mathbb wie in orig. LaTeX
\def\newstandard{%
  \let\mathbb\orgmathbb
  \let\Bbb\orgBbb
  \let\ell\orgell
  }
\newstandard
%% Since 04.02.2008
\let\subsetneq\varsubsetneq
\let\subsetneqq\varsubsetneq
\let\supsetneq\varsupsetneq
\let\supsetneqq\varsupsetneq

\newmuskip\@tempmuskipa
\def\bBigg@#1#2{%
  \bgroup%
  \def\@next{%
    \@mathmeasure\z@{\nulldelimiterspace\z@}%
      {%
        \left#2\vcenter to#1\big@size{}%
        \ifcat\@nx\@let@token
          \sp%
          \bigmukern@{#1}{#2}%
        \else
          \ifcat\@nx\@let@token
            \sb%
            \bigmukern@{#1}{#2}%
          \fi
        \fi%
        \right.%
      }%
    \box\z@
    \egroup
    }%
  \futurelet\@let@token\@next
  }
\def\bigmukern@#1#2{%
  \ifx]#2%
    \mkern-2mu%
  \else
    \ifx\rbrack#2%
      \mkern-2mu%
    \else
      \ifx\rfloor#2%
        \mkern-2mu%
      \else
        \ifx\rceil#2%
          \mkern-2mu%
        \else
          \ifx)#2%
            \@tempmuskipa2.5mu%
            \@tempmuskipa#1\@tempmuskipa%
            \advance\@tempmuskipa0.5mu%
            \mkern -\@tempmuskipa%
          \else
            \ifx\}#2%
              \@tempmuskipa2mu%
              \@tempmuskipa#1\@tempmuskipa%
              \mkern-\@tempmuskipa%
            \else
              \ifx\rbrace#2%
                \@tempmuskipa2mu%
                \@tempmuskipa#1\@tempmuskipa%
                \mkern-\@tempmuskipa%
              \else
                \ifx\rangle#2%
                  \@tempmuskipa3mu%
                  \@tempmuskipa#1\@tempmuskipa%
                  \advance\@tempmuskipa-1mu%
                  \mkern-\@tempmuskipa%
                \fi
              \fi
            \fi
          \fi
        \fi
      \fi
    \fi
  \fi
  }

\def\@makefnmark{($\strut^{\hbox{\lower0.2\baselineskip\hbox{$\scriptstyle{\text{\arabic{footnote}}}$}}}$)}

\tagsleft@true

%% All special font sizes should be defined here
\def\normalsize{\fontsize{10pt}{4.53mm}\selectfont}
\def\large{\fontsize{12pt}{5.44mm}\selectfont}
\def\Large{\fontsize{15pt}{6.8mm}\selectfont}
\def\LARGE{\fontsize{17pt}{7.7mm}\selectfont}
\def\huge{\fontsize{22pt}{9.97mm}\selectfont}
\def\Huge{\fontsize{24pt}{10.87mm}\selectfont}
\def\running@font{\normalfont\fontsize{8pt}{9pt}\selectfont}
\def\small{\normalfont\fontsize{8pt}{9pt}\selectfont}
\def\footnotesize{\normalfont\fontsize{8pt}{9pt}\selectfont}
\let\scriptsize\footnotesize
\let\tiny\footnotesize
\def\title@font{\usefont{OT1}{ml-cmr}{m}{n}\fontsize{17.22pt}{6.6mm}\selectfont}
\def\author@font{\normalfont\normalsize}
\def\dedication@font{\normalfont\fontsize{9pt}{10dd}\selectfont}
\def\abstract@font{\normalfont\fontsize{8pt}{3.85mm}\selectfont}
\def\section@font{\normalfont\normalsize\spaceskip0.35em plus0.1em minus0.1em\bfseries\mathversion{bold}}
\def\subsection@font{\normalfont\fontsize{10pt}{12pt}\spaceskip0.35em plus0.1em minus0.1em\bfseries\mathversion{bold}\selectfont}
\def\bib@font{\normalfont\fontsize{9pt}{10.93pt}\spaceskip0.3em plus0.15em minus0.1em\selectfont}
\def\inst@font{\normalfont\fontsize{9pt}{3.85mm}\selectfont}

\RequirePackage{enumitem}
\setlist{wide=\dimexpr\parindent+\labelwidth\relax,labelsep=3pt,topsep=\z@,parsep=\z@,itemsep=\z@,partopsep=\z@,noitemsep,nosep,
  format=\normalfont}
\setlist[2]{leftmargin=\parindent,labelindent*=10pt}

%% Some math skips
\abovedisplayskip=3 mm plus6pt minus 4pt
\belowdisplayskip=3 mm plus6pt minus 4pt
\abovedisplayshortskip=0.0 mm plus6pt
\belowdisplayshortskip=2 mm plus4pt minus 4pt

\let\AfMthepage\thepage
\def\AfMHeadPageRange{Ark. Mat., \textbf{\@volume} (\@pubyear), \@firstpage--\@lastpage}

\def\OnlineFirstAfM{%
  \gdef\AfMthepage{}%
  \gdef\AfMHeadPageRange{Ark. Mat. (\@pubyear)}%
  }

\def\runningauthor@fmt#1{%
  \bgroup
    \DeclareRobustCommand\ead[2][]{{\relax}}%
    #1%
  \egroup
  }
\def\ps@headings{%
  \def\@evenhead{%
    \hbox to\textwidth{%
      \running@font
      \rlap{\hbox{\AfMthepage}}%
      \hss\frenchspacing
      \runningauthor@fmt{\leftmark}%
      \hss
      }%
    }%
  \def\@oddhead{%
    \hbox to\textwidth{%
      \running@font
      \hss\rightmark\hss
      \llap{\hbox{\AfMthepage}}%
      }%
    }%
  }
%% Running head of the starting page
\def\ps@title{%
  \if@ledraft
    \def\oddheadline{%
      \hbox to\textwidth{%
        \running@font
        \smash{%
          \rlap{\hbox{\lower3mm\hbox{DOI: \@doi}}}%
          }%
        \smash{%
          \rlap{\hbox{\lower6mm\hbox{\copyright@statement}}}%
          }%
        \AfMHeadPageRange
        \hfill
        }%
      }%
    \let\evenheadline\oddheadline
  \else
    \def\@oddhead{%
      \hbox to\textwidth{%
        \running@font
        \smash{%
          \rlap{\hbox{\lower3mm\hbox{DOI: \@doi}}}%
          }%
        \smash{%
          \rlap{\hbox{\lower6mm\hbox{\copyright@statement}}}%
          }%
        \AfMHeadPageRange
        \hfill
        }%
      }%
    \let\@evenhead\@oddhead
  \fi
  \if@online
    \gdef\AfMHeadPageRange{Ark. Mat. (\@pubyear)}%
    \def\@oddhead{%
      \hbox to\textwidth{%
        \running@font
        \smash{%
          \rlap{\hbox{\lower3mm\hbox{DOI: \@doi}}}%
          }%
        \smash{%
          \rlap{\hbox{\lower6mm\hbox{\copyright@statement}}}%
          }%
        \AfMHeadPageRange
        \hfill
        }%
      }%
    \let\@evenhead\@oddhead
  \fi
  }
\@if@vtex@in@house{}{%
  \AtBeginDocument{%
    %\preto\@begin@frontmatter@hook{\ps@title}%
    %\appto\ps@title{%
    %  \appto\@evenhead{\ps@headings}%
    %  \appto\@oddhead{\ps@headings}%
    %  \appto\evenheadline{\ps@headings}%
    %  \appto\oddheadline{\ps@headings}%
    %  }%
    \let\ps@last\ps@headings
    }%
  }

%% Special running head on last page if page number is even
\def\ps@last{%
  \if@ledraft
    \def\evenheadline{%
      \setbox0\hbox{\running@font\frenchspacing\leftmark\unskip: \rightmark}%
      \ifdim\wd0<0.75\textwidth
        \smash{%
          \hbox to\textwidth{%
            \running@font
            \rlap{\hbox{\AfMthepage}}%
            \hss\box0\hss
            }%
          }%
      \else
        \smash{%
          \hbox to\textwidth{%
            \running@font
            \rlap{\hbox{\AfMthepage}}%
            \rlap{\hbox{\lower3mm\hbox to\textwidth{\hss\rightmark\hss}}}%
            \hss\frenchspacing\leftmark\unskip:\hss
            }%
          }%
      \fi
      }%
  \else
    \def\@evenhead{%
      \setbox0\hbox{\running@font\frenchspacing\leftmark\unskip: \rightmark}%
      \ifdim\wd0<0.75\textwidth
        \smash{%
          \hbox to\textwidth{%
            \running@font
            \rlap{\hbox{\AfMthepage}}%
            \hss\box0\hss
            }%
          }%
      \else
        \smash{%
          \hbox to\textwidth{%
            \running@font
            \rlap{\hbox{\AfMthepage}}%
            \rlap{\hbox{\lower3mm\hbox to\textwidth{\hss\rightmark\hss}}}%
            \hss\frenchspacing\leftmark\unskip:\hss
            }%
          }%
      \fi
      }%
  \fi
  \if@online
    \def\@evenhead{%
      \setbox0\hbox{\running@font\frenchspacing\leftmark\unskip: \rightmark}%
      \ifdim\wd0<0.75\textwidth%
        \smash{%
          \hbox to\textwidth{%
            \running@font
            \rlap{\hbox{}}%
            \hss\box0\hss
            }%
          }%
      \else
        \smash{%
          \hbox to\textwidth{%
            \running@font
            \rlap{\hbox{}}%
            \rlap{\hbox{\lower3mm\hbox to\textwidth{\hss\rightmark\hss}}}%
            \hss\frenchspacing\leftmark\unskip:\hss
            }%
          }%
      \fi
      }%
  \fi
  }

%% Some things we want to be done at the end of an article
\AtEndDocument{%
  \print@address@block
  \print@history
  \expandafter\ifnum\the\c@page>\@firstpage\relax
    \thispagestyle{last}%
  \fi
  \write\@auxout{\string\xdef\string\@endpage\string{\thepage\string}}%
  \write\@auxout{\string\xdef\string\@authorcount\string{\the\c@auth\string}}%
  }

\AtBeginDocument{%
  \pagestyle{headings}%
  \normalfont\normalsize
  }

%\@if@vtex@in@house{%
    \renewcommand\@makefntext[1]{%
      \expandafter\ifnum\the\c@footnote=0\relax
        \noindent
        \hb@xt@\bibindent{\hss\enspace}%
      \else
        \strut\kern7.2mm($^{\arabic{footnote}}$)
      \fi
      #1%
      }%
%  }{%
%    \renewcommand\@makefntext[1]{%
%      \noindent
%      \hb@xt@\bibindent{\hss\enspace}%
%      #1%
%      }%
%  }

\def\@thanksdef#1xx{\gdef\@thanks{#1}}

%% We want indentations after headings
\def\@afterheading{%
  \@nobreaktrue
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty\@M
    \else
      \clubpenalty\@clubpenalty
      \everypar{}%
    \fi
    }%
  }

\def\hack#1{#1}
\nonfrenchspacing

%% >>> Bibliography >>>
\csuse{\fmt@name @load@bibliography@settings}
\newcount\@tempcntc
\def\@citex[#1]#2{%
  \if@filesw
    \immediate\write\@auxout{\string\citation{#2}}%
  \fi
  \@tempcnta\z@
  \@tempcntb\m@ne
  \def\@citea{}%
  \@cite{%
    \@for\@citeb:=#2\do{%
      \@ifundefined{b@\@citeb}
        {%
          \@citeo
          \@tempcntb\m@ne
          \@citea
          \def\@citea{,}%
          {\bfseries ?}%
          \@warning{Citation `\@citeb' on page \thepage \space undefined}%
        }{%
          \setbox\z@\hbox{\global\@tempcntc0\csname b@\@citeb\endcsname\relax}%
          \ifnum\@tempcntc=\z@
            \@citeo
            \@tempcntb\m@ne
            \@citea
            \def\@citea{,}%
            \hbox{\csname b@\@citeb\endcsname}%
          \else
            \advance\@tempcntb\@ne
            \ifnum\@tempcntb=\@tempcntc
            \else
              \advance\@tempcntb\m@ne
              \@citeo
              \@tempcnta\@tempcntc
              \@tempcntb\@tempcntc
            \fi
          \fi
        }%
      }%
    \@citeo
    }%
  {#1}%
  }
\def\@citeo{%
  \ifnum\@tempcnta>\@tempcntb
  \else
    \@citea
    \def\@citea{,\hskip0.1em\ignorespaces}%
    \ifnum\@tempcnta=\@tempcntb
      \the\@tempcnta
    \else
      {%
        \advance\@tempcnta\@ne
        \ifnum\@tempcnta=\@tempcntb
        \else
          \def\@citea{--}%
        \fi
        \advance\@tempcnta\m@ne
        \the\@tempcnta
        \@citea
        \the\@tempcntb
      }%
    \fi
  \fi
  }
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\newif\if@firstbib\@firstbibtrue
\newif\ifNAT@openbib

\newdimen\bibindent
\setlength\bibindent{\parindent}
\def\@biblabel#1{#1.}
\def\@lbibitem[#1]#2{%
  \item[{[#1]}\hfill]%
  \if@filesw
    {%
      \let\protect\noexpand
      \immediate\write\@auxout{\string\bibcite{#2}{#1}}%
    }
  \fi
  \ignorespaces
  }
\newdimen\biblabelwidth
\newcounter{bibcount}
\setcounter{bibcount}{0}
\@if@vtex@in@house{%
    \newenvironment{thebibliography}{}{}%
  }{%
    \setlength{\biblabelwidth}{33\p@}%
    \setlength{\labelsep}{3\p@}%
    \setlength\bibindent{30\p@}% hangindent
    \ifx\bptok\undefined
      \def\bptok#1{\ignorespaces}%
    \fi
    \def\@listctr{bibcite}%
    \newcounter{\@listctr}%
    % orig definition: \bibitem ->\@ifnextchar [\@lbibitem \@bibitem
    \def\bibitem{\refstepcounter{\@listctr }\@ifnextchar [\@lbibitem{\@lbibitem[\the\csname c@\@listctr\endcsname]}}
    % numeric citations
    \def\@lbibitem[#1]#2{%
      \item [\hfill\@biblabel{#1}\hskip \labelsep ]%
      \if@filesw
        {\let \protect \noexpand \immediate \write \@auxout {\string \bibcite {#2}{#1}}}%
      \fi
      \ignorespaces
      }%
    \def\alphanumeral{%
      % "nameyear" citations
      \def\@biblabel##1{[##1]}%
      }%
    \newenvironment{thebibliography}%
      {%
        \section*{\refname}%
        \parindent\z@
        \bibfont
        \bgroup
          \list{}{%
            \setlength{\leftmargin}{\dimexpr\biblabelwidth + \labelsep + \bibindent\relax}%
            \setlength{\itemindent}{-\bibindent}%
            \setlength\labelwidth{\dimexpr\biblabelwidth + \labelsep\relax}%
            }%
      }{%
        \egroup
        %
        \renewcommand\author[2][]{%
          \vskip\baselineskip
          ##2%
          \par
          }%
        \newcommand\ead[2][]{%
          \par
          ##2%
          }%
        \newcommand\address[2][]{%
          \vskip\baselineskip
          ##2%
          \par
          }%
        %
        \the\document@aug
      }%
    \newenvironment{barticle}{}{}%
    \newenvironment{bbook}{}{}%
    \newenvironment{botherref}{}{}%
    \let\bauthor\@firstofone
    \let\oauthor\@firstofone
    \def\bsnm#1{{\scshape #1}}%
    \def\binits#1{{\scshape #1}}%
    \let\bparticle\@firstofone
    \let\batitle\@firstofone
    \let\bbtitle\@firstofone
    \def\bjtitle#1{{\itshape #1}}%
    \def\bvolume#1{{\bfseries #1}}%
    \let\byear\@firstofone
    \let\bfpage\@firstofone
    \let\blpage\@firstofone
    \let\bpublisher\@firstofone
    \let\arxivurl\@firstofone
    \let\endbibitem\relax
    \long\def\OrigBibText#1\endOrigBibText{}%
  }
\if@loadnatbib
  \csuse{\fmt@name @load@bibliography@packages}
  \def\bibfont{%
    \normalfont
    \fontsize{9pt}{10.93pt}%
    \spaceskip0.3em plus0.15em minus0.1em
    \selectfont
    }
  \@if@vtex@in@house{%
    \setlength{\bibhang}{30\p@}%
    }{}%
  \def\NAT@bibsetnum#1{%
    \settowidth\labelwidth{\@biblabel{#1}}%
    \setlength{\labelsep}{6.5\p@}%
    \setlength{\leftmargin}{\bibhang}%
    \addtolength{\leftmargin}{\labelwidth}%
    \addtolength{\leftmargin}{\labelsep}%
    \setlength{\itemindent}{-\bibhang}%
    \setlength{\itemsep}{\bibsep}\setlength{\parsep}{\z@}%
    \ifNAT@openbib
      \addtolength{\leftmargin}{\bibindent}%
      \setlength{\itemindent}{-\bibindent}%
      \setlength{\listparindent}{\itemindent}%
      \setlength{\parsep}{0pt}%
    \fi
    }
\fi
%% <<< Bibliography <<<
\def\xbibitem#1{\bibitem}%

%% >>> Sections >>>
\@if@vtex@in@house{}{%
  \newcounter{subsection}%
  }
\providecommand\section{}
\renewcommand\section{%
  \@startsection{section}{1}{\z@}%
    {-25dd plus-4pt minus-4pt}{5.5dd plus0pt minus0pt}{\section@font\centering}%
  }%
\newcommand\subsubsection@inline{%
  \@startsection{subsubsection}{2}{\z@}%
    {-21dd plus-4pt minus-4pt}{-1.4\p@}{\subsection@font}%
  }%
\newcommand\subsection@inline{%
  \@startsection{subsection}{2}{\z@}%
    {-21dd plus-4pt minus-4pt}{-1.4\p@}{\subsection@font}%
  }%
\newcommand\subsection@i{%
  \@startsection{subsection}{2}{\z@}%
    {-21dd plus-4pt minus-4pt}{8dd plus 0pt minus0pt}{\subsection@font}%
  }%
\newcommand\subsubsection@i{%
  \@startsection{subsubsection}{2}{\z@}%
    {-21dd plus-4pt minus-4pt}{8dd plus 0pt minus0pt}{\subsection@font}%
  }%
\def\subsection{\@ifnextchar*{\subsection@i}{\subsection@ii}}
\def\subsection@ii{\@ifnextchar[{\subsection@i}{\subsection@iii}}
\def\subsection@iii#1{%
  \ifx|#1|%
    \subsection@inline{#1}%
  \else
    \subsection@i{#1}%
  \fi
  }
\def\subsubsection{\@ifnextchar*{\subsubsection@i}{\subsubsection@ii}}
\def\subsubsection@ii{\@ifnextchar[{\subsubsection@i}{\subsubsection@iii}}
\def\subsubsection@iii#1{%
  \ifx|#1|%
    \subsubsection@inline{#1}%
  \else
    \subsubsection@i{#1}%
  \fi
  }
\def\paragraph{%
  \@startsection{paragraph}{4}{\parindent}%
    {-13pt plus-4pt minus-4pt}{-5.5pt}{\normalsize\itshape}%
  }%

\def\section@numbersep{.}
\def\subsection@numbersep{.}
\def\subsubsection@numbersep{.}
\def\paragraph@numbersep{.}
\def\subparagraph@numbersep{.}
\def\@seccntformat#1{%
  \csname the#1\endcsname\sectcounterend
  \hskip\betweenumberspace
  }
%% <<< Sections <<<

%% Annotations to the author
\def\TSbib#1{\quad\\$\blacksquare$\ #1\ $\blacksquare$\ }
\def\TSannot{\@ifnextchar[{\@tsannot}{\tsannot}}
\def\tsannot#1{%
  \marginpar{{%
    \parbox[t]{0.7in}{{%
      \fontsize{7pt}{7pt}%
      \raggedright
      \selectfont
      $\blacksquare$\ #1%
      \par
      }}%
    }}%
  }
\def\@tsannot[#1]#2{%
  \marginpar{%
    \vskip#1%
    {%
      \parbox[t]{0.7in}{{%
        \fontsize{7pt}{7pt}%
        \raggedright
        \selectfont
        $\blacksquare$\ #2%
        \par
        }}%
    }}%
  }

%% Numbered and unnumbered theorems
\def\@spbegintheorem#1#2#3#4{%
  \trivlist
  \item[\hskip7.2mm{#3#1\ \upshape#2\@thmcounterend}]\ #4%
  }
\def\@spopargbegintheorem#1#2#3#4#5{%
  \trivlist
  \item[\hskip7.2mm{#4#1\ \upshape#2\@thmcounterend}]{\ (#3)}#5%
  }
\def\@Begintheorem#1#2#3{%
  #3%
  \trivlist
  \item[\hskip7.2mm{#2#1\@thmcounterend}]\
  }
\def\@Opargbegintheorem#1#2#3#4{%
  #4%
  \trivlist
  \item[\hskip7.2mm{#3#1\@thmcounterend}]{\ (#2)}%
  }
\def\theopargself{%
  \def\@spopargbegintheorem##1##2##3##4##5{%
    \trivlist
    \item[\hskip7.2mm{##4##1\ \upshape##2}]{##4##3\@thmcounterend}\ ##5%
    }%
  \def\@Opargbegintheorem##1##2##3##4{%
    ##4%
    \trivlist
    \item[\hskip7.2mm{##3##1}]{##3##2\@thmcounterend}\
    }%
  }

%% Additional theorem environments (most of them are already defined in lesvjour.cls)
\spnewtheorem*{remarknn}{Remark}{\itshape}{\rmfamily}
\spnewtheorem*{theoremnn}{Theorem}{\rm\bfseries}{\cmrxishape}

\ifdefined\cmrxishape
\else
  \let\cmrxishape\itshape
\fi

\let\proof\relax
\let\endproof\relax
\RequirePackage{amsthm}
\def\qedsymbol{\ensuremath{\square}}
\thm@notefont={\upshape}
\newtheoremstyle{plain}
  {\medskipamount}
  {\medskipamount}
  {\cmrxishape}
  {\parindent}
  {\bfseries}
  {}
  {.5em}
  {\thmname{#1}\thmnumber{ #2.}\thmnote{\ {\the\thm@notefont (#3)}}}
\newtheoremstyle{definition}
  {\medskipamount}
  {\medskipamount}
  {\normalfont}
  {\parindent}
  {\bfseries}
  {}
  {.5em}
  {}
\newtheoremstyle{remark}
  {\medskipamount}
  {\medskipamount}
  {\normalfont}
  {\parindent}
  {\itshape}
  {}
  {.5em}
  {\thmname{#1}\thmnumber{ {\normalfont #2.}}\thmnote{\ {\the\thm@notefont (#3)}}}
\renewenvironment{proof}[1][\proofname]%
  {%
    \par
    \pushQED{\qed}%
    \normalfont
    \topsep\medskipamount
    \trivlist
    \labelsep.5em%
    \item[\hskip\dimexpr\parindent+\labelsep\relax
    \itshape #1\@addpunct{.}]\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }

\def\acknowledgementname{Acknowledgement}
\def\acknowledgementsname{Acknowledgements}
\newenvironment{ack}[1][\acknowledgementname]{\def\ackname{#1.}\acknowledgement}{\endacknowledgement}
\newenvironment{acks}[1][\acknowledgementsname]{\def\ackname{#1.}\acknowledgement}{\endacknowledgement}
\newenvironment{artnote}[1][\artnotename]{\def\ackname{#1.}\acknowledgement}{\endacknowledgement}

%% Acknowledgement
\def\acknowledgement{%
  \par
  \addvspace\baselineskip
  \rmfamily
  \labelsep\z@
  \trivlist
  \if!\ackname!%
    \item[]%
  \else
    \item[\hskip7.2mm {\itshape\ackname}\enskip\enskip ]%
  \fi
  }
\def\endacknowledgement{%
  \endtrivlist
  \addvspace{6pt}%
  }

%% Some other stuff
\let\if@smartand\iffalse
\def\leftlegendglue{\hfil}%
\def\runinend{. }%
\def\floatcounterend{. }%
\def\sectcounterend{.\,}%
\def\@thmcounterend{. \kern-0.25em}%
\def\democounterend{. }
\def\figurename{Figure}
\def\qed{\ifmmode\quad\square\else\unskip\quad$\square$\fi}

\def\ldots{...}
\let\dots\ldots

\def\cdots{%
  \mathchoice%
    {{\kern0.05em\cdot\kern-0.15em\cdot\kern-0.15em\cdot\kern0.05em}}%
    {{\kern0.05em\cdot\kern-0.05em\cdot\kern-0.05em\cdot\kern0.05em}}%
    {{\kern0.03em\cdot\kern-0.05em\cdot\kern-0.05em\cdot\kern0.05em}}%
    {{\kern0.03em\cdot\kern-0.03em\cdot\kern-0.03em\cdot\kern0.03em}}%
  }
\let\cdots\ldots

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width18mm
  \kern2.6\p@
  }

%%       Routines for overline on slanted characters
%%       (and sequences of characters beginning with a slanted character)
%%       N.B. The user must realize when he needs overline and when
%%       itoverline. I recommend to use \itoverline on
%%       A B D E F H I J K L M N P R S X Z
%%       d f z \jmath s \beta \delta \varkappa \mu \rho \partial
%%       and to use \overline on all other Latin and Greek letters.
%%
%%       \itoverlineb should be used for a second overlining over one done by
%%       \itoverline.
%%       \itoverlinec should be used for a third overlining
%%       Example: \itoverlinec{\itoverlineb{\itoverline{z}+w}}
%%       \itoverlineB takes two arguments and uses the second to decided how
%%       far to move. So for the example above one can instead write
%%       \itoverlineB{\itoverlineB{\itoverline{z}+w}{z}}{z}
%%
%%       When using \itoverlineb and especially \itoverlinec TeX needs a lot
%%       of time. To avoid this the definitions
%%       \itoverlinetext, \itoverlinetextb, \itoverlinetextc
%%       have been added. They can be used when one are sure that what is
%%       being overlined is set in \textstyle.
%%       Similar commands can be made for the other styles.
%%       Instead one may use \itoverlineB. It has the additional advantage
%%       of handling situations like
%%       \itoverlineB{\itoverline{z}+A}{z}
%%
%%       1994-10-17 Anders Bj\"orn, with help from Folke Norstad
%%       1995-01-26 Changed to work properly in scriptstyle etc.
%%       1996-05-22 \mathsurround 0pt inserted and \itoverlineb added,
%%                  changes ex measures to pt measures as \overline is always
%%                  at a fixed height over the chars, not font dependent.
%%                  The earlier 10pt version should be almost identical with
%%                  the new one, other sizes have changed a little.
%%                  (After discussions with Mats Neymark.)
%%       1997-09-15 \itoverlinec added
%%       1997-09-26 \itoverlinetext, \itoverlinetextb and \itoverlinetextc added
%%       2000-11-14 \itunderline created
%%       2001-12-18 \itunderline moved to itoverline.tex and recommendations
%%                  for usage on Latin and Greek letters added.
%%       2002-01-08 \itoverlineB added

{\catcode`p =12 \catcode`t =12 \gdef\eeaa#1pt{#1}}      % Get slantfactor
\def\accentadjtext#1{%
  \setbox0\hbox{$#1$}\kern   % Convert it with height
  \expandafter\eeaa\the\fontdimen1\textfont1 \ht0
  }
\def\accentadjscript#1{%
  \setbox0\hbox{$#1$}\kern % Convert it with height
  \expandafter\eeaa\the\fontdimen1\scriptfont1 \ht0
  }
\def\accentadjscriptscript#1{%
  \setbox0\hbox{$#1$}\kern   % Convert it with height
  \expandafter\eeaa\the\fontdimen1\scriptscriptfont1 \ht0
  }
\def\accentadjtextback#1{%
  \setbox0\hbox{$#1$}\kern       % Convert it with height
  -\expandafter\eeaa\the\fontdimen1\textfont1 \ht0
  }
\def\accentadjscriptback#1{%
  \setbox0\hbox{$#1$}\kern     % Convert it with height
  -\expandafter\eeaa\the\fontdimen1\scriptfont1 \ht0
  }
\def\accentadjscriptscriptback#1{%
  \setbox0\hbox{$#1$}\kern % Convert it with height
  -\expandafter\eeaa\the\fontdimen1\scriptscriptfont1 \ht0
  }
\def\itoverline#1{{%
  \mathsurround0pt
  \mathchoice
    {\rlap{$\accentadjtext{\displaystyle #1}
            \accentadjtext{\vrule height1.593pt}
            \overline{\phantom{\displaystyle #1}
            \accentadjtextback{\displaystyle #1}}$}{#1}}
    {\rlap{$\accentadjtext{\textstyle #1}
            \accentadjtext{\vrule height1.593pt}
            \overline{\phantom{\textstyle #1}
            \accentadjtextback{\textstyle #1}}$}{#1}}
    {\rlap{$\accentadjscript{\scriptstyle #1}
            \accentadjscript{\vrule height1.593pt}
            \overline{\phantom{\scriptstyle #1}
            \accentadjscriptback{\scriptstyle #1}}$}{#1}}
    {\rlap{$\accentadjscriptscript{\scriptscriptstyle #1}
            \accentadjscriptscript{\vrule height1.593pt}
            \overline{\phantom{\scriptscriptstyle #1}
            \accentadjscriptscriptback{\scriptscriptstyle #1}}$}{#1}}%
  }}
\def\itoverlineB#1#2{{%
  \mathsurround0pt
  \mathchoice
    {\rlap{$\accentadjtext{\displaystyle #2}
            \accentadjtext{\vrule height1.593pt}
            \overline{\phantom{\displaystyle #1}
            \accentadjtextback{\displaystyle #2}}$}{#1}}
    {\rlap{$\accentadjtext{\textstyle #2}
            \accentadjtext{\vrule height1.593pt}
            \overline{\phantom{\textstyle #1}
            \accentadjtextback{\textstyle #2}}$}{#1}}
    {\rlap{$\accentadjscript{\scriptstyle #2}
            \accentadjscript{\vrule height1.593pt}
            \overline{\phantom{\scriptstyle #1}
            \accentadjscriptback{\scriptstyle #2}}$}{#1}}
    {\rlap{$\accentadjscriptscript{\scriptscriptstyle #2}
            \accentadjscriptscript{\vrule height1.593pt}
            \overline{\phantom{\scriptscriptstyle #1}
            \accentadjscriptscriptback{\scriptscriptstyle #2}}$}{#1}}%
  }}
\def\itoverlineb#1{{%
  \mathsurround0pt
  \mathchoice
    {\rlap{$\accentadjtext{\displaystyle #1}
            \accentadjtextback{\vrule height.407pt}
            \overline{\phantom{\displaystyle #1}
            \accentadjtext{\vrule height2pt}
            \accentadjtextback{\displaystyle #1}}$}{#1}}
    {\rlap{$\accentadjtext{\textstyle #1}
            \accentadjtextback{\vrule height.407pt}
            \overline{\phantom{\textstyle #1}
            \accentadjtext{\vrule height2pt}
            \accentadjtextback{\textstyle #1}}$}{#1}}
    {\rlap{$\accentadjscript{\scriptstyle #1}
            \accentadjtextback{\vrule height.407pt}
            \overline{\phantom{\scriptstyle #1}
            \accentadjtext{\vrule height2pt}
            \accentadjscriptback{\scriptstyle #1}}$}{#1}}
    {\rlap{$\accentadjscriptscript{\scriptscriptstyle #1}
            \accentadjtextback{\vrule height.407pt}
            \overline{\phantom{\scriptscriptstyle #1}
            \accentadjtext{\vrule height2pt}
            \accentadjscriptscriptback{\scriptscriptstyle #1}}$}{#1}}%
  }}
\def\itoverlinec#1{{%
  \mathsurround0pt
  \mathchoice
    {\rlap{$\accentadjtext{\displaystyle #1}
            \accentadjtextback{\vrule height2.407pt}
            \overline{\phantom{\displaystyle #1}
            \accentadjtext{\vrule height4pt}
            \accentadjtextback{\displaystyle #1}}$}{#1}}
    {\rlap{$\accentadjtext{\textstyle #1}
            \accentadjtextback{\vrule height2.407pt}
            \overline{\phantom{\textstyle #1}
            \accentadjtext{\vrule height4pt}
            \accentadjtextback{\textstyle #1}}$}{#1}}
    {\rlap{$\accentadjscript{\scriptstyle #1}
            \accentadjtextback{\vrule height2.407pt}
            \overline{\phantom{\scriptstyle #1}
            \accentadjtext{\vrule height4pt}
            \accentadjscriptback{\scriptstyle #1}}$}{#1}}
    {\rlap{$\accentadjscriptscript{\scriptscriptstyle #1}
            \accentadjtextback{\vrule height2.407pt}
            \overline{\phantom{\scriptscriptstyle #1}
            \accentadjtext{\vrule height4pt}
            \accentadjscriptscriptback{\scriptscriptstyle #1}}$}{#1}}%
  }}
\def\itoverlinetext#1{{%
  \mathsurround0pt
  \rlap{%
    $\accentadjtext{\displaystyle #1}
    \accentadjtext{\vrule height1.593pt}
    \overline{\phantom{\displaystyle #1}
    \accentadjtextback{\displaystyle #1}}$%
    }%
  {#1}%
  }}
\def\itoverlinetextb#1{{%
  \mathsurround0pt
  \rlap{%
    $\accentadjtext{\displaystyle #1}
    \accentadjtextback{\vrule height.407pt}
    \overline{\phantom{\displaystyle #1}
    \accentadjtext{\vrule height2pt}
    \accentadjtextback{\displaystyle #1}}$%
    }%
  {#1}%
  }}
\def\itoverlinetextc#1{{%
  \mathsurround0pt
  \rlap{%
    $\accentadjtext{\displaystyle #1}
    \accentadjtextback{\vrule height2.407pt}
    \overline{\phantom{\displaystyle #1}
    \accentadjtext{\vrule height4pt}
    \accentadjtextback{\displaystyle #1}}$%
    }%
  {#1}%
  }}
\def\itunderline#1{{%
  \mathsurround0pt
  \mathchoice
    {\rlap{$\underline{\phantom{\displaystyle #1}
            \accentadjtextback{\displaystyle #1}}$}{#1}}
    {\rlap{$\underline{\phantom{\textstyle #1}
            \accentadjtextback{\textstyle #1}}$}{#1}}
    {\rlap{$\underline{\phantom{\scriptstyle #1}
            \accentadjscriptback{\scriptstyle #1}}$}{#1}}
    {\rlap{$\underline{\phantom{\scriptscriptstyle #1}
            \accentadjscriptscriptback{\scriptscriptstyle #1}}$}{#1}}%
  }}
%% Has been replaced by the following new definitions from Anders by Denny 2007-May-7
%%       \limminus and \limplus to be used e.g in r --> 1-
%%
%%       I think that r --> 1- has a far to big - sign normally.
%%       This definition makes it smaller and adjust the height.
%%
%%       In \scriptscriptstyle it still has the old size.
%%
%%
%%       Last changed by Anders Bj\"orn 95 02 24

\newcommand{\limplus}{{%
  \mathchoice{\raise.17ex\hbox{$\scriptstyle +$}}
{\raise.17ex\hbox{$\scriptstyle +$}}
{\raise.1ex\hbox{$\scriptscriptstyle +$}}
{\scriptscriptstyle +}%
  }}
\newcommand{\limminus}{{%
  \mathchoice
    {\raise.17ex\hbox{$\scriptstyle -$}}
  {\raise.17ex\hbox{$\scriptstyle -$}}
    {\raise.1ex\hbox{$\scriptscriptstyle -$}}
    {\scriptscriptstyle -}%
  }}
\newcommand{\limpm}{{%
  \mathchoice{\raise.17ex\hbox{$\scriptstyle \pm$}}
  {\raise.17ex\hbox{$\scriptstyle \pm$}}
    {\raise.1ex\hbox{$\scriptscriptstyle \pm$}}
    {\scriptscriptstyle \pm}%
  }}
\newcommand{\limmp}{{%
  \mathchoice
    {\raise.17ex\hbox{$\scriptstyle \mp$}}
    {\raise.17ex\hbox{$\scriptstyle \mp$}}
    {\raise.1ex\hbox{$\scriptscriptstyle \mp$}}
    {\scriptscriptstyle \mp}%
  }}

%%       \iintlim
%%
%%       \iintlim should be used for the first integral in a double integral
%%       with limits, or for all but the last integral in a multiple integral
%%       with limits.
%%
%%       If there are no limits it produces slightly more space between the
%%       integrals than AMSTeX's \iint. The latter is recommended, but if it
%%       is not available \iintlim makes a good substitute.
%%
%%       \iintlim takes two arguments the subscript and superscript,
%%       unfortunately they cannot be written with the usual _ and ^ notation.
%%       Example of use
%%
%%       \iintlim{a}{b}\int_c^d
%%
%%       \iintlim decreases the space after the integral so that it is the
%%       same as if the longer of the sub- and superscripts where a subscript
%%       and their were no superscript. It takes special care of the case
%%       of very short scripts, i.e. scripts completely covered by the
%%       integral sign.
%%
%%       1998-05-21 First version by Anders Bj\"orn (anbjo@mai.liu.se)
\newdimen\extrawidth
\def\iintlim#1#2{%
  \setbox0\hbox{$\scriptstyle#1$}%
  \setbox1\hbox{$\scriptstyle#2$}%
  \extrawidth=\wd1 \advance\extrawidth-\wd0
  \ifdim\extrawidth<0pt
    \extrawidth=0pt
  \fi
  \int_{#1\kern\extrawidth \kern .5em}^{#2\kern -\wd1} \kern -.5em%
  }

%% \vint barred integral, needs one index (use {} if none)
%% Definition submitted by Tero Kilpel\"ainen and Pekka Koskela
%% with articles for Arkiv f\"or matematik 37:2 (1999).
%% Modified to give the same spacing to the left of the sign as the
%% usual integral by Anders Bj\"orn, 4 January 2000.
%%
%% Modified to have distance in em and ex rather than pt to scale
%% properly in 11pt and 12pt by Anders Bj\"orn, 16 February 2005
\def\vint_#1{%
  \mathchoice%
    {\mathop{\kern 0.2em\vrule width 0.6em height 0.69678ex depth -0.58065ex
            \kern -0.8em \intop}\nolimits_{\kern -0.4em#1}}%
    {\mathop{\kern 0.1em\vrule width 0.5em height 0.69678ex depth -0.60387ex
            \kern -0.6em \intop}\nolimits_{#1}}%
    {\mathop{\kern 0.1em\vrule width 0.5em height 0.69678ex depth -0.60387ex
            \kern -0.6em \intop}\nolimits_{#1}}%
    {\mathop{\kern 0.1em\vrule width 0.5em height 0.69678ex depth -0.60387ex
            \kern -0.6em \intop}\nolimits_{#1}}%
  }

%% used for the soft cyrillic character mainly in Russian names
\def\cprime{{\mathsurround0pt$'$}}

%% Inserted by Denny upon Anders' request -- 19.9.2007
\def\vdots{%
  \vbox{%
    \baselineskip2.8\p@
    \lineskiplimit\z@
    \kern6\p@\hbox{.}\hbox{.}\hbox{.}\kern3\p@
    }%
  }
\def\ddots{%
  \mathinner{%
    \mkern1mu
    \raise8.6\p@
    \vbox{\kern7\p@\hbox{.}}%
    \raise5.8\p@
    \hbox{.}\raise3\p@\hbox{.}%
    \mkern1mu
    }%
  }

%% Polish characters adapt from the babel package for amstex
%%
%% The defintions are ok in \it, but too weak in \bf
%%
%% By Anders Bj\"orn, 2004-10-07, 2007-08-30
\catcode`\@=11 % make @ a letter
\newdimen\pl@left
\newdimen\pl@down
\newdimen\pl@right
\newdimen\pl@temp
\def\sob#1#2#3#4#5{%parameters: letter and fractions hl,ho,vl,vo
  \setbox0\hbox{#1}%
  \setbox1\hbox{$_\mathchar'454$}%
  \setbox2\hbox{p}%
  \pl@right=#2\wd0 \advance\pl@right by-#3\wd1
  \pl@down=#5\ht1 \advance\pl@down by-#4\ht0
  \pl@left=\pl@right \advance\pl@left by\wd1
  \pl@temp=-\pl@down \advance\pl@temp by\dp2 \dp1=\pl@temp
  \leavevmode
  \kern\pl@right\lower\pl@down\box1\kern-\pl@left #1%
  }
\def\aob{\sob a{.66}{.20}{0}{.90}}
\def\Aob{\sob A{.80}{.50}{0}{.90}}
\def\eob{\sob e{.50}{.35}{0}{.93}}
\def\Eob{\sob E{.60}{.35}{0}{.90}}
\catcode`\@=12 % make @ a  non-letter
%% <<< from ml-afm-author.sty <<<

\endinput
%%
%% End of file `arkiv.cls'.
