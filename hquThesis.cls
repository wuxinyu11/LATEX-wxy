
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hquThesis}[2023/05/26 Huaqiao University Thesis document class]

\LoadClass{report}

\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{xeCJK}
\RequirePackage{indentfirst}

\DeclareOption{doctor}{
    \def\degree{博士}
    \def\coverfig{covers/doctor.png}
    \def\covertitleen{\vspace{70pt}}
}
\DeclareOption{master}{
    \def\degree{硕士}
    \def\coverfig{covers/master.png}
    \def\covertitleen{\textbf{\@titleen}\vspace{56pt}}
}
\DeclareOption{engineeringmaster}{
    \def\degree{硕士}
    \def\coverfig{covers/engineering_master.png}
    \def\covertitleen{\textbf{\@titleen}\vspace{56pt}}
}
\DeclareOption{win}{
    \def\songti{SimSun}
    \def\heiti{SimHei}
    \def\kaiti{KaiTi}
}
\DeclareOption{mac}{
    \def\songti{Songti SC}
    \def\heiti{Heiti SC}
    \def\kaiti{Kaiti SC}
    \def\fangsong{STFangsong}
}
\ProcessOptions\relax

\geometry{a4paper,top=3.8cm,bottom=3.8cm,left=3.2cm,right=3.2cm,bindingoffset=0cm,footskip=1cm,twoside}
\setlength{\parindent}{28pt}
\setmainfont{Times New Roman}
\setCJKmainfont{\songti}
\setCJKsansfont{\heiti}
\setCJKmonofont{\kaiti}
% \newCJKfontfamily\declarationfont{\fangsong}

\newcommand\titlezh[1]{\def\@titlezh{#1}}
\newcommand\titleen[1]{\def\@titleen{#1}}
\newcommand\authorzh[1]{\def\@authorzh{#1}}
\newcommand\authoren[1]{\def\@authoren{#1}}
\newcommand\id[1]{\def\@id{#1}}
\newcommand\schoolzh[1]{\def\@schoolzh{#1}}
\newcommand\schoolen[1]{\def\@schoolen{#1}}
\newcommand\supervisorzh[1]{\def\@supervisorzh{#1}}
\newcommand\supervisoren[1]{\def\@supervisoren{#1}}
\newcommand\cosupervisorzh[1]{\def\@cosupervisorzh{#1}}
\newcommand\fieldzh[1]{\def\@fieldzh{#1}}
\newcommand\fielden[1]{\def\@fielden{#1}}
\newcommand\major[1]{\def\@major{#1}}
\newcommand\coverdate[3]{\def\@coverdate{\makebox[42pt]{#1}年\makebox[21pt]{#2}月\makebox[21pt]{#3}日}}

\renewcommand{\maketitle}{
    \newgeometry{top=3.2cm,bottom=2.6cm,left=2.4cm,right=2.2cm,bindingoffset=0cm}
    \ttfamily\fontsize{10.5pt}{21pt}\selectfont
    \noindent 学校代码：\hspace{6pt}\underline{\textrm{10385}}\hfill 分类号：\underline{\hspace{72pt}}
    
    \noindent 研究生学号：\underline{\makebox[72pt]{\textrm{\@id}}}\hfill 密\hspace{10.5pt}集：\underline{\hspace{72pt}}
    
    \begin{figure}[H]
        \makebox[\textwidth]{\includegraphics[width=\paperwidth]{\coverfig}}
    \end{figure}

    \begin{center}
        \rmfamily\fontsize{16pt}{32pt}\selectfont
        \textbf{\@titlezh}

        \covertitleen
        
        \fontsize{14pt}{30pt}\selectfont
        \textsf{作者姓名：} \underline{\makebox[182pt]{\textrm{\textbf{\@authorzh}}}}

        \textsf{指导教师：} \underline{\makebox[182pt]{\textrm{\textbf{\@supervisorzh}}}}

        \textsf{合作教师：} \underline{\makebox[182pt]{\textrm{\textbf{\@cosupervisorzh}}}}

        \textsf{学\hspace{28pt}科：} \underline{\makebox[182pt]{\textrm{\textbf{\@major}}}}

        \textsf{研究方向：} \underline{\makebox[182pt]{\textrm{\textbf{\@fieldzh}}}}

        \textsf{所在学院：} \underline{\makebox[182pt]{\textrm{\textbf{\@schoolzh}}}}
        \vspace{56pt}
        
        \textsf{论文提交日期：} \textrm{\textbf{\@coverdate}}
    \end{center}
    \thispagestyle{empty}
    \newpage
    \begin{center}
        \sffamily\fontsize{16pt}{25pt}\selectfont 学\hspace{8pt}位\hspace{8pt}论\hspace{8pt}文\hspace{8pt}答\hspace{8pt}辩\hspace{8pt}委\hspace{8pt}员\hspace{8pt}会\hspace{8pt}决\hspace{8pt}议
    \end{center} \vspace{51pt}
    \fontsize{14pt}{26pt}\selectfont
    \noindent\hspace{28pt}\rmfamily 根据《中华人民共和国学位条例》、《中华人民共和国学位条例暂行实 施办法》、《华侨大学学位授予工作细则》及《华侨大学研究生学位论文质 量监控与评阅答辩的管理规定》的规定，学位论文答辩委员会经充分交换意 见，对论文做出评价，并以无记名投票方式进行表决，同意该同学通过\degree 学位论文答辩，同意授予\degree 学位。\vspace{192pt}
    
    \noindent\flushright 答辩委员会(主席签字)：\underline{\hspace{156pt}}\vspace{14pt}
    
    \noindent\flushright 答辩时间：\underline{\hspace{60pt}}年\underline{\hspace{25pt}}月\underline{\hspace{25pt}}日
    \thispagestyle{empty}
    \restoregeometry
    \newpage
    \fbox{
        \parbox{\textwidth}{
            \vspace{24pt}\begin{center}\sffamily\fontsize{16pt}{16pt}\selectfont 学位论文独创性声明\end{center}\vspace{18pt}
    
            \hspace{28pt}\declarationfont\fontsize{14pt}{28pt}\selectfont 本人声明兹呈交的学位论文是本人在导师指导下完成的研究成果。论文写作中不包含其他人已经发表或撰写过的研究内容，如参考他人或集体的科研成果，均在论文中以明确的方式说明。本人依法享有和承担由此论文所产生的权利和责任。
        }
    }
}