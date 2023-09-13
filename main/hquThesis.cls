
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hquThesis}[2023/08/02 Huaqiao University Thesis document class]


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\newif\ifisengineer\isengineerfalse
\newif\ifcovertitleEn\covertitleEnfalse

\DeclareOption{doctor}{
    \def\degree{博士}
    \def\coverfig{covers/doctor.png}
}
\DeclareOption{master}{
    \def\degree{硕士}
    \def\coverfig{covers/master.png}
    \covertitleEntrue
}
\DeclareOption{engineeringmaster}{
    \def\degree{硕士}
    \def\coverfig{covers/engineering_master.png}
    \covertitleEntrue
    \isengineertrue
}

\ProcessOptions\relax
\LoadClass[twoside, openright, UTF8, scheme=plain]{book}

\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{xeCJK}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocloft}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{tabularx}




\geometry{a4paper,top=3.8cm,bottom=3.8cm,left=3.2cm,right=3.2cm,bindingoffset=0cm,voffset=0.3cm,footskip=1cm,headheight=14pt}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setCJKmainfont{simsun.ttc}[AutoFakeSlant, AutoFakeBold={2}]
\setCJKsansfont{simhei.ttf}[AutoFakeSlant, AutoFakeBold={2}]
\setCJKmonofont{Kaiti_GB2312.ttf}[AutoFakeSlant, AutoFakeBold={2}]
\newCJKfontfamily\declarationfont{simfang.ttf}[AutoFakeSlant, AutoFakeBold={2}]
\fontsize{12pt}{20pt}\selectfont
\setlength{\parindent}{24pt}

\newcommand\titleZh[1]{\def\@titleZh{#1}}
\newcommand\titleEn[1]{\def\@titleEn{#1}}
\newcommand\authorZh[1]{\def\@authorZh{#1}}
\newcommand\authorEn[1]{\def\@authorEn{#1}}
\newcommand\id[1]{\def\@id{#1}}
\newcommand\schoolZh[1]{\def\@schoolZh{#1}}
\newcommand\schoolEn[1]{\def\@schoolEn{#1}}
\newcommand\supervisorZh[1]{\def\@supervisorZh{#1}}
\newcommand\supervisorEn[1]{\def\@supervisorEn{#1}}
\newcommand\cosupervisorZh[1]{\def\@cosupervisorZh{#1}}
\newcommand\fieldZh[1]{\def\@fieldZh{#1}}
\newcommand\fieldEn[1]{\def\@fieldEn{#1}}
\newcommand\major[1]{\def\@major{#1}}
\newcommand\coverdate[1]{\def\@coverdate{#1}}

\newcommand{\makecover}{
    \pagestyle{empty}
    \newgeometry{top=3.2cm,bottom=2.6cm,left=2.4cm,right=2.2cm,bindingoffset=0cm}
    {
        \ttfamily\setstretch{1.5}\fontsize{10.5pt}{\baselineskip}\selectfont
        \noindent 学校代码：\hspace{6pt}\underline{\textrm{10385}}\hfill 分类号：\underline{\hspace{72pt}}\par
        \noindent 研究生学号：\underline{\makebox[72pt]{\textrm{\@id}}}\hfill 密\hspace{10.5pt}集：\underline{\hspace{72pt}}\par
    }

    \begin{figure}[H]
        \makebox[\textwidth]{\includegraphics[width=\paperwidth]{\coverfig}}
    \end{figure}

    \begin{center}
        {
            \rmfamily\bfseries\setstretch{1.5}\fontsize{16pt}{\baselineskip}\selectfont
            \@titleZh \par
            \ifcovertitleEn
                \@titleEn\par\vspace{56pt}
            \else
                \vspace{70pt}
            \fi
        }
        {
            \setstretch{1.5}\fontsize{14pt}{\baselineskip}\selectfont
            \textsf{作者姓名：} \underline{\makebox[182pt]{\textrm{\textbf{\@authorZh}}}}\par
            \textsf{指导教师：} \underline{\makebox[182pt]{\textrm{\textbf{\@supervisorZh}}}}\par
            \textsf{合作教师：} \underline{\makebox[182pt]{\textrm{\textbf{\@cosupervisorZh}}}}\par
            \ifisengineer
                \textsf{专业学位类别：} \underline{\makebox[154pt]{\textrm{\textbf{\@major}}}}\par
                \textsf{专业学位领域：} \underline{\makebox[154pt]{\textrm{\textbf{\@major}}}}\par
            \else
                \textsf{学\hspace{28pt}科：} \underline{\makebox[182pt]{\textrm{\textbf{\@major}}}}\par
            \fi
            \textsf{研究方向：} \underline{\makebox[182pt]{\textrm{\textbf{\@fieldZh}}}}\par
            \textsf{所在学院：} \underline{\makebox[182pt]{\textrm{\textbf{\@schoolZh}}}}\par
            \vspace{56pt}
            \textsf{论文提交日期：} \textrm{\textbf{\@coverdate}}
        }
    \end{center}
    \cleardoublepage
    {
        \begin{center}
        \sffamily\fontsize{16pt}{25pt}\selectfont 学\hspace{8pt}位\hspace{8pt}论\hspace{8pt}文\hspace{8pt}答\hspace{8pt}辩\hspace{8pt}委\hspace{8pt}员\hspace{8pt}会\hspace{8pt}决\hspace{8pt}议
        \end{center}
    } \vspace{32pt}
    {
        \fontsize{14pt}{26pt}\selectfont
        \noindent\hspace{28pt}\rmfamily 根据《中华人民共和国学位条例》、《中华人民共和国学位条例暂行实 施办法》、《华侨大学学位授予工作细则》及《华侨大学研究生学位论文质 量监控与评阅答辩的管理规定》的规定，学位论文答辩委员会经充分交换意 见，对论文做出评价，并以无记名投票方式进行表决，同意该同学通过\degree 学位论文答辩，同意授予\degree 学位。\par
        \vspace{192pt}
        \noindent\flushright 答辩委员会(主席签字)：\underline{\hspace{156pt}}\vspace{14pt} \par
        \noindent\flushright 答辩时间：\underline{\hspace{60pt}}年\underline{\hspace{25pt}}月\underline{\hspace{25pt}}日 \par
    }
    \restoregeometry
    \cleardoublepage
    % \noindent\framebox[\linewidth]{%
    \noindent\fbox{%
        \parbox{14.3cm}{
            \vspace{24pt}\begin{center}\sffamily\fontsize{16pt}{\baselineskip}\selectfont 学位论文独创性声明\end{center}\vspace{18pt}
            \hspace{28pt}\declarationfont\fontsize{14pt}{28pt}\selectfont
            本人声明兹呈交的学位论文是本人在导师指导下完成的研究成果。论文写作中不包含其他人已经发表或撰写过的研究内容，如参考他人或集体的科研成果，均在论文中以明确的方式说明。本人依法享有和承担由此论文所产生的权利和责任。\par
            \vspace{28pt}\hspace{28pt} 论文作者签名：\underline{\hspace{112pt}}\hspace{7pt}签名日期：\underline{\hspace{77pt}}\par\vspace{7pt}
        }%
    }
    \par
    \vspace{44pt}
    \noindent\framebox[\linewidth]{
        \parbox{14.3cm}{
            \vspace{24pt}\begin{center}\sffamily\fontsize{16pt}{\baselineskip}\selectfont 学位论文版权使用授权声明\par\end{center}\vspace{18pt}
            \hspace{28pt}\declarationfont\fontsize{14pt}{28pt}\selectfont 
            本人同意授权华侨大学有权保留并向国家机关或机构送交学位论文的复印件和电子版，允许学位论文被查阅和借阅。本人授权华侨大学可以将本学位论文的全部内容或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。\par\vspace{28pt}
            \hspace{28pt}论文作者签名：\underline{\hspace{84pt}}\hspace{7pt}指导老师签名：\underline{\hspace{84pt}}\par
            \hspace{28pt}签\hspace{7pt}名\hspace{7pt}日\hspace{7pt}期：\underline{\hspace{91pt}}\hspace{7pt}签\hspace{7pt}名\hspace{7pt}日\hspace{7pt}期：\underline{\hspace{91pt}}\par\vspace{7pt}
        }
    }
    \cleardoublepage
}

\renewcommand{\chaptermark}[1]{
    \markboth{第\ \thechapter\ 章\ #1}{}
}
\renewcommand{\frontmatter}{
    \setcounter{page}{1}
    \pagestyle{fancy}
    \fancyhf{}
    \fancyfoot[C]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \@Roman\thepage}
    \fancyhead[CO]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \leftmark}
    \fancyhead[CE]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont 华侨大学\degree 学位论文}
}
\renewcommand{\mainmatter}{
    \setcounter{page}{1}
    \pagestyle{fancy}
    \fancyhf{}
    \fancyfoot[C]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \@arabic\thepage}
    \fancyhead[CO]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \leftmark}
    \fancyhead[CE]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont 华侨大学\degree 学位论文}
}
\renewcommand{\backmatter}{
    \setcounter{page}{1}
    \pagestyle{fancy}
    \fancyhf{}
    \fancyfoot[C]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \@Roman\thepage}
    \fancyhead[CO]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \leftmark}
    \fancyhead[CE]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont 华侨大学\degree 学位论文}
}

\newenvironment{abstract}{
    \markboth{摘\hspace{10.5pt}要}{}
    \setlength{\parindent}{24pt}
    \vspace*{24pt}\begin{center}\noindent\sffamily\fontsize{16pt}{\baselineskip}\selectfont 摘\hspace{16pt}要\end{center}\par\vspace{18pt}
    \indent\rmfamily\fontsize{12pt}{20pt}\selectfont
}{\vspace{20pt}}

\newenvironment{abstractEn}{
    \markboth{Abstract}{}
    \setlength{\parindent}{24pt}
    \vspace*{24pt}\begin{center}\noindent\sffamily\bfseries\fontsize{16pt}{\baselineskip}\selectfont Abstract\end{center}\par\vspace{18pt}
    \indent\rmfamily\fontsize{12pt}{20pt}\selectfont
}{\vspace{20pt}}

\newcommand\keywords[1]{
    \hangafter 1
    \hangindent 48pt
    \noindent\rmfamily\fontsize{12pt}{20pt}\selectfont \textbf{关键词：} #1
    \cleardoublepage
}

\newcommand\keywordsEn[1]{
    \hangafter 1
    \hangindent 60pt
    \noindent\rmfamily\fontsize{12pt}{20pt}\selectfont \textbf{Keywords:} #1
    \cleardoublepage
}
\tocloftpagestyle{fancy}
\renewcommand{\contentsname}{\centerline{目\hspace{16pt}录}}
\renewcommand{\cfttoctitlefont}{\sffamily\bfseries\fontsize{16pt}{\baselineskip}\selectfont}
\renewcommand{\cftbeforetoctitleskip}{24pt}
\renewcommand{\cftaftertoctitleskip}{18pt}
\renewcommand{\cftchapdotsep}{4.5}
\setlength{\cftparskip}{0pt}
\setlength{\cftchapindent}{0pt}
\setlength{\cftsecindent}{12pt}
\setlength{\cftsubsecindent}{24pt}
\setlength{\cftchapnumwidth}{48pt}
\renewcommand{\cftchappresnum}{第}
\renewcommand{\cftchapaftersnum}{章}
\renewcommand{\cftchapfont}{\sffamily\fontsize{12pt}{20pt}\selectfont}
\renewcommand{\cftsecfont}{\rmfamily\fontsize{12pt}{20pt}\selectfont}
\renewcommand{\cftsubsecfont}{\rmfamily\fontsize{12pt}{20pt}\selectfont}
\setlength{\cftbeforechapskip}{6pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setcounter{tocdepth}{2}

\setcounter{secnumdepth}{3}
\setlength{\parskip}{0pt}
\titleformat{\chapter}[block]{\centering\sffamily\bfseries\fontsize{16pt}{\baselineskip}\selectfont}{第\ \arabic{chapter}\ 章}{16pt}{}
\titlespacing{\chapter}{0pt}{24pt}{18pt}
\assignpagestyle{\chapter}{fancy}
\titleformat{\section}[hang]{\sffamily\bfseries\fontsize{14pt}{20pt}\selectfont}{\arabic{chapter}.\arabic{section}}{14pt}{}
\titlespacing{\section}{0pt}{24pt}{6pt}
\titleformat{\subsection}[hang]{\sffamily\bfseries\fontsize{12pt}{20pt}\selectfont}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}{12pt}{}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titleformat{\subsubsection}[hang]{\sffamily\fontsize{12pt}{20pt}\selectfont}{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{12pt}{}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}
\titleformat{\paragraph}[runin]{\rmfamily\fontsize{12pt}{20pt}\selectfont}{}{}{}
\titlespacing{\paragraph}{0pt}{0pt}{0pt}
