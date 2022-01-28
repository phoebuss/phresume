\NeedsTeXFormat {LaTeX2e}
\ProvidesClass {mytex}
\LoadClass [12pt] {article}

\RequirePackage [letterpaper, margin=0.5in] {geometry}
\RequirePackage {fontspec}
\RequirePackage [bookmarks=false] {hyperref}
\RequirePackage {pgffor}
\RequirePackage {etoolbox}

\setromanfont {Times New Roman}
\setsansfont {Arial}
\setmonofont {Courier New}

\pagestyle {empty}
\hypersetup {
    pdfborderstyle={/S/U/W 1}
}

\newcommand {\setprop} [2] {
    \expandafter\def\csname #1\endcsname {#2}
}

\newenvironment {env_contact} {
    \raggedright \normalsize
    \setlength {\leftskip} {1em}
    \setlength {\rightskip} {1em}
} {
    Email: \href {mailto:\email} {\email}
    \hfill
    Phone: \phone \\
    \vspace {1em}
}

\newenvironment {env_name} {
    \centering \huge
    \name \\
    \vspace {0.5em}
} {}

\newenvironment {env_section_title} {
    \raggedright \large
} {}

\newcommand {\desc} [1] {
    \listadd\buffer {\textbullet \ \ \ #1\\}
}

\newcommand {\timeline} [3] {
    \listadd\buffer {#1 \hfill #2 - #3\\}
}

\newcommand {\text} [1] {
    \listadd\buffer {#1\\}
}

\newcommand {\sep} {\listadd\buffer {\vspace {1em}}}

\newcommand {\popbuf} {
    \renewcommand {\do} [1] {##1}
    \dolistloop{\buffer}
}

\renewenvironment {section} [1] {
    \raggedright \normalsize
    \setlength {\leftskip} {2em}
    \setlength {\rightskip} {1em}

    \setprop {title} {#1}
    \setprop {buffer} {}
} {
    \begin {env_section_title}
    \MakeUppercase \title \\
    \rule [1em] {\textwidth} {0.5pt} \\
    \vspace {-1em}
    \end {env_section_title}
    \popbuf
    \vspace {0.5em}
}

\AtBeginDocument {
    \begin {env_name}
    \end {env_name}

    \begin {env_contact}
    \end {env_contact}
}

