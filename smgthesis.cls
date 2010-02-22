\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{smgthesis}

% Forward all options to the report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{report}

% Change the ways headings are formatted (based on the definitions in report.cls)
\renewcommand\section{\@startsection{section}{1}
	{\z@}
	{-3.5ex \@plus -1ex \@minus -.2ex}
	{2.3ex \@plus.2ex}
	{\normalfont\LARGE\bfseries\scshape\center}
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

% Change the formatting of figure captions
\usepackage[labelfont=bf,textfont=it]{caption}

% Define a centred itemize environment
\usepackage{varwidth}

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
