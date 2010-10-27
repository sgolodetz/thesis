\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{smgthesis}

% Forward all options to the book class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Required Packages %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{afterpage}
\RequirePackage{alltt}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{bold-extra}									% not installed by default -- MUST be provided with smgthesis.cls
\RequirePackage{color}
\RequirePackage{enumitem}
\RequirePackage{epigraph}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage{graphicx}
%\RequirePackage[pdftex, pdfborder=0]{hyperref}

% Both underscore and hyphenat define a BreakableUnderscore command -- this restores the one from underscore to prevent problems.
\RequirePackage{savesym}
\RequirePackage{underscore}
\savesymbol{BreakableUnderscore}
\RequirePackage{hyphenat}
\restoresymbol{hyp}{BreakableUnderscore}

\RequirePackage{latexsym}										% include extra symbols like \Box and \sqsubset
\RequirePackage{listings}
\RequirePackage{lscape}
\RequirePackage{makeidx} \makeindex
\RequirePackage{multirow}
\RequirePackage{setspace}
\RequirePackage{subfigure}
%\RequirePackage{times}
\RequirePackage[notlof,nottoc]{tocbibind}		% include the bibliography in the table of contents
\RequirePackage{url}
\RequirePackage{varwidth}
\RequirePackage{vmargin}

% This must be loaded after the other packages
\RequirePackage{microtype}

%%%%%%%%%%%%%%%
%%% Colours %%%
%%%%%%%%%%%%%%%

\definecolor{cyan}{rgb}{0, 0.75, 0.75}
\definecolor{darkgreen}{rgb}{0, 0.6, 0}
\definecolor{gold}{rgb}{0.75, 0.75, 0}
\definecolor{purple}{rgb}{0.75, 0, 0.75}

%%%%%%%%%%%%%%%%
%%% Commands %%%
%%%%%%%%%%%%%%%%

% Define a way to specify a single, bulleted item without having to manually create an itemize environment
\newcommand{\singleitem}[2]
{
\vspace{-1mm}
\begin{itemize}[leftmargin=*, nolistsep]
\setlength{\parskip}{0pt}
\item[#1] \nohyphens{#2}
\end{itemize}
\vspace{-5mm}
}

% Define shorter ways to include individual images
\newcommand{\stufig}[4]						% images with default placement
{
	\begin{figure}
	\begin{center}
		\includegraphics[#1]{#2}
		\caption{#3}
		\label{#4}
	\end{center}
	\end{figure}
}

\newcommand{\stufigex}[5]					% images with specified placement
{
	\begin{figure}[#5]
	\begin{center}
		\includegraphics[#1]{#2}
		\caption{#3}
		\label{#4}
	\end{center}
	\end{figure}
}

\newcommand{\stufignc}[2]					% images without captions
{
	\begin{figure}[H]
	\begin{center}
		\includegraphics[#1]{#2}
	\end{center}
	\label{fig:#2}
	\end{figure}
}

% Define a shorter way to add index entries
\newcommand{\stuidx}[2][\DefaultOpt]{\def\DefaultOpt{#2} \index{#1} \emph{#2}}

%%%%%%%%%%%%%%%%%%%%
%%% Environments %%%
%%%%%%%%%%%%%%%%%%%%

% Define the abstract environment (it's not included in the book class)
\newenvironment{abstract}
{
	\cleardoublepage\null\vfill\begin{center}\bfseries\abstractname\end{center}
}
{
	\vfill\null
}

\newcommand\abstractname{Abstract}

% Define the acknowledgements environment
\newenvironment{acknowledgements}
{
	\cleardoublepage\null\vfill\begin{center}\bfseries\acknowledgementsname\end{center}
}
{
	\vfill\null
}

\newcommand\acknowledgementsname{Acknowledgements}

% Define the centreditemize environment
\newenvironment{centreditemize}
{
\begin{center}
\begin{varwidth}{\linewidth}
\begin{itemize}
}
{
\end{itemize}
\end{varwidth}
\end{center}
}

% Define the definition environment
\newtheorem{definition}{Definition}[chapter]

% Define the stusubfig environment
\newenvironment{stusubfig}[1]
{
	\begin{figure}[#1]
	\begin{center}
}
{
	\end{center}
	\end{figure}
}

% Define theorem-related environments, etc. (see http://www.maths.tcd.ie/~dwilkins/LaTeXPrimer/Theorems.html)
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}

\renewenvironment{proof}[1][Proof]{\begin{trivlist}
\item[\hskip \labelsep {\bfseries #1}]}{\end{trivlist}}

\renewcommand{\qed}{\nobreak \ifvmode \relax \else
      \ifdim\lastskip<1.5em \hskip-\lastskip
      \hskip1.5em plus0em minus0.5em \fi \nobreak
      \vrule height0.75em width0.5em depth0.25em\fi}

% Define the thesis environment
\newtheorem*{thesis}{Thesis}

%%%%%%%%%%%%%%
%%% Floats %%%
%%%%%%%%%%%%%%

% Create a new type of float (called a stulisting) for listings
\floatstyle{ruled}
\newfloat{stulisting}{thp}{lop}[chapter]
\floatname{stulisting}{Listing}

%%%%%%%%%%%%%%%%%%
%%% Formatting %%%
%%%%%%%%%%%%%%%%%%

% Set the paper size and margins
\setpapersize{A4}
\setmargrb{2cm}{2cm}{2cm}{2cm}

% Change the ways headings are formatted (based on the definitions in report.cls)
\renewcommand\section{\@startsection{section}{1}
	{\z@}
	{-3.5ex \@plus -1ex \@minus -.2ex}
	{2.3ex \@plus.2ex}
	{\normalfont\LARGE\scshape\center}
}

\renewcommand\subsection{\@startsection{subsection}{2}
	{\z@}
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\Large\scshape\center}
}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}
	{\z@}
	{-3.25ex\@plus -1ex \@minus -.2ex}
	{1.5ex \@plus .2ex}
	{\normalfont\large\scshape\center}
}

\renewcommand\paragraph{\@startsection{paragraph}{4}
	{\z@}
	{-3.25ex\@plus -1ex \@minus -.2ex}
	{1.5ex \@plus .2ex}
	{\normalfont\normalsize\bfseries\center}
}

\renewcommand\subparagraph{\@startsection{subparagraph}{5}
	{\z@}
	{-3.25ex\@plus -1ex \@minus -.2ex}
	{1.5ex \@plus .2ex}
	{\normalfont\normalsize\itshape\center}
}

% Change the way figure captions are formatted
\usepackage[labelfont=bf,textfont=it]{caption}

% Prevent footnotes being split across multiple pages
\interfootnotelinepenalty=10000

% Set the table of contents depth
\setcounter{tocdepth}{2}

%%%%%%%%%%%%%%%%%%%
%%% Mathematics %%%
%%%%%%%%%%%%%%%%%%%

% Macros
\def\dx{\Delta x}
\def\dy{\Delta y}
\def\dz{\Delta z}
\def\dt{\Delta t}

\def\pd#1#2{\frac{\partial #1}{\partial #2}}						% partial derivative
\def\pdd#1#2{\frac{\partial^2 #1}{\partial #2^2}}				% partial second derivative
\def\pdk#1#2#3{\frac{\partial^#3 #1}{\partial #2^#3}}		% partial k'th derivative

\def\pdnf#1#2{\partial #1/\partial #2}									% partial derivative (no frac)
\def\pddnf#1#2{\partial^2 #1/\partial #2^2}							% partial second derivative (no frac)
\def\pdknf#1#2#3{\partial^#3 #1/\partial #2^#3}					% partial k'th derivative (no frac)

% Operators
\newcommand{\argmax}{\mathop{\rm argmax}}
\newcommand{\argmin}{\mathop{\rm argmin}}
\newcommand{\diag}{\mathop{\rm diag}}

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Start of Document %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument
{

% Setup before using the listings package
\renewcommand{\lstlistingname}{\textbf{Listing}}
\renewcommand{\thelstlisting}{\textbf{\arabic{lstlisting}}}

\lstdefinelanguage{Pseudocode}{
morekeywords={and,assert,break,case,continue,default,down,each,else,for,function,if,not,null,or,rangeswitch,ref,return,switch,then,throw,to,up,var,while},
sensitive=true,
morecomment=[l]{//},
morecomment=[s]{/*}{*/}
}

\lstdefinestyle{Default}{
abovecaptionskip=0.5cm,
basicstyle=\scriptsize\ttfamily,
belowcaptionskip=0.5cm,
belowskip=0.5cm,
columns=fixed,
commentstyle=\color{darkgreen},
language=Pseudocode,
numbers=left,
numbersep=5pt,
numberstyle=\tiny,
mathescape=true,
showstringspaces=false,
stepnumber=1,
tabsize=4
}

\lstdefinestyle{Snippet}{
abovecaptionskip=0.5cm,
aboveskip=0.5cm,
basicstyle=\small\ttfamily,
belowcaptionskip=0.5cm,
belowskip=0.5cm,
columns=fixed,
commentstyle=\color{darkgreen},
frame=lines,
keywordstyle=\small\bfseries,
language=Pseudocode,
numbers=none,
mathescape=true,
showstringspaces=false,
stepnumber=1,
tabsize=4
}

% For C++ function prototypes (e.g. in the partition forests chapter)
\lstdefinestyle{Prototype}{
abovecaptionskip=0.5cm,
basicstyle=\small\ttfamily,
belowcaptionskip=0.5cm,
belowskip=0.5cm,
columns=fixed,
commentstyle=\color{darkgreen},
language=C++,
numbers=none,
mathescape=true,
showstringspaces=false,
stepnumber=1,
tabsize=4
}

}
