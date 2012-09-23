\ProvidesClass{BusinessCardRS}[2012/08/15 v0.2 business card class by Robin Schneider]

\LoadClass{scrartcl}
\RequirePackage{
	babel,
	graphicx,
	xcolor,
	telprint
}
\RequirePackage[utf8]{inputenc}	%% Schriftkodierung
\RequirePackage[T1]{fontenc}
\definecolor{uni}{gray}{.4}
\RequirePackage[zw32010,crossmark]{ticket}
\input{/home/rsadmin/Dokumente/LaTeX/input-document/eigene-angaben}

\renewcommand{\ticketdefault}{%
	%\put( 45, 5){\includegraphics[width=38mm,origin=bl]{tux-logo}}
	\put( 5, 15){\color{uni}\line(1,0){36}}
	\put( 7, 11){\small \AuFirma}
	\put( 7, 7){\small \AuStrasse}
	\put( 7, 3){\small \AuPLZ ~\AuOrt}
	\put( 7, 24){\small Tel:}
%	\put( 7, 20){\small Fax:}
}

\newcommand{\@name}{\AuName}
\newcommand{\@jobtitle}{\AuArbeit}
\newcommand{\@phone}{\AuPhone}
%\newcommand{\@fax}{Ihre Faxnummer}
\newcommand{\@email}{\AuMail}
\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\jobtitle}[1]{\renewcommand{\@jobtitle}{#1}}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
%\newcommand{\fax}[1]{\renewcommand{\@fax}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}

\newcounter{numcards}
\newcommand{\printcards}[1][10]{%
		\setcounter{numcards}{0}
		\whiledo{\value{numcards}<#1}{%
				\ticket{\put(6,40){\bfseries\LARGE\@name}
						\put(7,34){\@jobtitle}
						\put(14,24){\small\@phone}
%						\put(14,20){\small\@fax}
						\put( 7,20){\small\@email}}
				\stepcounter{numcards}}}
\renewcommand{\familydefault}{\sfdefault}
\endinput
