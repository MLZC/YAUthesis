% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{YAUthesis}[2019/05/14 v1.1 Yanan University Thesis Template for Bachelor Degree]
\LoadClass[zihao=-4,a4paper,oneside]{ctexbook}
\setmainfont{Times New Roman}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions



%------------------------ Page layout ---------------------------------
\RequirePackage{fancyhdr,hyperref}

\hypersetup{pdfencoding=auto}  %%% 邓东升修改
\ifprint
\hypersetup{hidelinks}
\else
\hypersetup{citecolor=magenta,linkcolor=blue}
\fi
\RequirePackage[top=2.5truecm,bottom=2.5truecm,left=2.75truecm,right=2.5truecm,includefoot,xetex]{geometry}    % 页面设置%


\newtoks\StudentNumber   %学号
\newtoks\miji            %密级
\newtoks\DepartNumber    %单位代码
\newtoks\ClassNumber     %分类号
\newtoks\Titleo          %真正的标题1
\newtoks\Titlet          %真正的标题2
\newtoks\Cmajor          %学科专业中文名
\newtoks\Cschoolname      %学院中文名
\newtoks\Csupervisor     %指导教师中文名
\newtoks\PRAT            %指导教师职称(professional ranks and titles)
\newtoks\abstractCn		%中文摘要名称
\newtoks\abstractEn 	%英文摘要名称


\pagestyle{fancyplain}
\fancyhf{}  %清除以前对页眉页脚的设置
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{-\,\thepage\,-}


\fancypagestyle{plain}
{
	\fancyhead{}                                    % clear all header fields
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot{}                                    % clear all footer fields
	\fancyfoot[C]{-\,\thepage\,-}
}

%%=====封面===================== 
\def\maketitle{%
	\null
	\thispagestyle{empty}%
	%\vspace*{-2cm}
		
	\begin{center}\leavevmode
		{\bfseries \zihao{-4}%
			
			\begin{flushleft}
				\makebox[18mm][s]{分类号:}\underline{\makebox[35mm][c]{\the\ClassNumber}}\hfill\makebox[18mm][s]{单位代码:}\underline{\makebox[35mm][c]{\the\DepartNumber}}\\
				\vskip0.2cm
				\makebox[18mm][s]{密级:}\underline{\makebox[35mm][c]{\the\miji}}\hfill\makebox[18mm][s]{学号:}\underline{\makebox[35mm][c]{\the\StudentNumber}}
			\end{flushleft}
		}
		\par
		\vspace*{3.1cm} %插入空白
		\begin{center}
			\includegraphics[height=2cm]{yadx.eps}   
		\end{center}
		%\vspace{2.6cm}
		{\heiti \zihao{-0} \@title \\}%
		\vspace{2.6cm}

		%    \vspace{4cm}
		\vfill\vfill\vfill
		{\bfseries\zihao{-2}
			\begin{center}
				\makebox[30mm][s]{\bfseries 题目:} \underline{\makebox[87mm][c]{\bfseries \the\Titleo}}\\
				\vskip0.7cm
				\makebox[30mm][s]{\bfseries } \underline{\makebox[87mm][c]{\bfseries \the\Titlet}}\\  %如果一行题目够用,释掉该行和下一行即可.
				\vskip0.7cm
				\makebox[30mm][s]{\bfseries 专业:} \underline{\makebox[87mm][c]{\bfseries \the\Cmajor}}\\
				\vskip0.7cm
				\makebox[30mm][s]{\bfseries 姓名:} \underline{\makebox[87mm][c]{\bfseries \@author}}\\
				\vskip0.7cm
				\makebox[30mm][s]{\bfseries 指导教师:} \underline{\makebox[87mm][c]{\bfseries \the\Csupervisor}}\\
				\vskip0.7cm
				\makebox[30mm][s]{\bfseries 职称:} \underline{\makebox[87mm][c]{\bfseries \the\PRAT}} \\
				\vskip0.7cm
				\makebox[30mm][s]{\bfseries 答辩日期:} \underline{\makebox[87mm][c]{\bfseries \@date}}
			\end{center}
		}
		
		\par
		
		%\vspace*{-0.7cm}
	\end{center}%
	%  \null
	%   \cleardoublepage
}

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{\the\abstractCn} 
\newcommand\enabstractname{\the\abstractEn}
\newcommand\cnkeywords[1]{ {\heiti\zihao{-4}\cnkeywordsname: }#1} %%%赵驰2019/05/16 如果学校要求关键字不缩进， 在\heiti前面添加\noindent
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\bfseries\zihao{-4}\enkeywordsname: }#1}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{
	\newpage
	\chapter[\cnabstractname]{{\cnabstractname}}   %%%终于解决了书签乱码的问题 2005-04-12.huangzh
	\songti\zihao{-4}
	\@afterheading}
{\par}

\newenvironment{enabstract}{
	\newpage
	\chapter[\enabstractname]{\enabstractname}
	\songti\zihao{-4}
	\@afterheading}
{\par}

%%------------------------常用宏包-----------------------------------
\RequirePackage{amsmath,amssymb}
\RequirePackage[amsmath,thmmarks]{ntheorem}% AMSLaTeX宏包.
\RequirePackage{bm}		%加入bm宏包，加入数学粗体
\RequirePackage{graphicx}                 % 图形
\RequirePackage{color,xcolor}             %支持彩色
%\RequirePackage{mathrsfs}   % 不同于\mathcal or \mathfrak 之类的英文花体字体
\RequirePackage{url}
\RequirePackage{enumerate}
\RequirePackage{booktabs} %控制表线 赵驰修改 2019.02
%%-----------------------化学-----------赵驰修改 2019.02--------------- 
\RequirePackage[version=4]{mhchem} %化学方程式 
\RequirePackage{chemfig} %有机化学方程式 
%%-----------------------代码块---------赵驰修改 2019.02---------------
\RequirePackage{listings} % 代码块
\usepackage[linesnumbered,ruled,vlined]{algorithm2e} % 伪代码排版
\lstset{framexleftmargin=5mm, numbers=left, frameshape={RYRYNYYYY}{yny}{yny}{RYRYNYYYY}} % 代码块风格
%%--------------------------------------赵驰修改 2019.05-----------
\RequirePackage{float} %用于固定图片
%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
\theorempreskip{0pt}
\theorempostskip{0pt}
\theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}[section]
\newtheorem{remark}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}


\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}  %自定义新命令\upcite, 使参考文献引用以上标出现

%%%%%%%-------------------------------------------------
%%%===  suppress extra inter-line spacing in \list environments
\makeatletter \setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini
	\parsep 0pt
	\topsep \parsep
	\itemsep \parsep}
\@listI
\def\@listii {\leftmargin\leftmarginii
	\labelwidth\leftmarginii
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
	\labelwidth\leftmarginiii
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
\def\@listiv{\leftmargin\leftmarginiv
	\labelwidth\leftmarginiv
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
\def\@listv{\leftmargin\leftmarginv
	\labelwidth\leftmarginv
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
\def\@listvi{\leftmargin\leftmarginvi
	\labelwidth\leftmarginvi
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
%
% Change default margins for \list environments
\setlength\leftmargini   {2\ccwd} \setlength\leftmarginii
{\leftmargini} \setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini} \setlength\leftmarginv
{\ccwd} \setlength\leftmarginvi  {\ccwd} \setlength\leftmargin
{\leftmargini} \setlength\labelsep      {.5\ccwd}
\setlength\labelwidth    {\leftmargini}
%
\setlength\listparindent{2\ccwd}
% Change \listparindent to 2\ccwd in \list
\def\list#1#2{\ifnum \@listdepth >5\relax \@toodeep
	\else \global\advance\@listdepth\@ne \fi
	\rightmargin \z@ \listparindent2\ccwd \itemindent \z@
	\csname @list\romannumeral\the\@listdepth\endcsname
	\def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
	\@trivlist
	\parskip\parsep \parindent\listparindent
	\advance\linewidth -\rightmargin \advance\linewidth -\leftmargin
	\advance\@totalleftmargin \leftmargin
	\parshape \@ne \@totalleftmargin \linewidth
	\ignorespaces}

\makeatother
%---------------------------------------------------
\newcommand\acknowledgement{\chapter*{\ziju{2}致谢}}

%%% ---- 章节标题设置 ----- %%%%

\CTEXsetup[format={\centering\sffamily}]{chapter}
\CTEXsetup[nameformat={\bfseries\sffamily\zihao{3}}]{chapter}
\CTEXsetup[titleformat={\bfseries\sffamily\zihao{3}}]{chapter}
\CTEXsetup[numberformat={\bfseries\sffamily\zihao{3}}]{chapter}
\CTEXsetup[beforeskip={0pt},afterskip={30pt}]{chapter}
\CTEXsetup[name={第, 章},number={\arabic{chapter}}]{chapter}

\CTEXsetup[format={\flushleft\bfseries\sffamily\zihao{4}}]{section}
\CTEXsetup[beforeskip={24pt},afterskip={6pt}]{section}

\CTEXsetup[format={\flushleft\bfseries\sffamily\zihao{-4}}]{subsection}
\CTEXsetup[beforeskip={12pt},afterskip={6pt}]{subsection}

\CTEXsetup[format={\flushleft\bfseries\sffamily\zihao{-4}}]{subsubsection}
\CTEXsetup[beforeskip={12pt},afterskip={6pt}]{subsubsection}

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}

%%% ---- 图表标题设置 ----- %%%%
\RequirePackage[labelsep=quad]{caption} %% 序号之后空一格写标题
\captionsetup[table]{textfont=bf,font=small}  %%设置表格标题字体为黑体字号为小五  。2019.05.25
\captionsetup[figure]{textfont=bf,font=small}
\renewcommand\figurename{\bf\zihao{5} 图}
\renewcommand\tablename{\bf\zihao{5} 表} 

%%% ------ 目录设置 ------- %%%%
\ctexset{contentsname={目\qquad 录}}

\RequirePackage[titles]{tocloft}
\renewcommand{\cftdot}{…}          % 引导点，用中文的省略号
\renewcommand{\cftdotsep}{0}        % 引导点的距离
\renewcommand\cftchapfont{\zihao{5}\bf}
\renewcommand\cfttoctitlefont{\hfill\zihao{-2}}
\renewcommand\cftaftertoctitle{\hfill}
\setlength{\cftbeforechapskip}{0pt}

\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\makeatletter
\renewcommand{\numberline}[1]{%
\settowidth\@tempdimb{#1\hspace{0.5em}}%
\ifdim\@tempdima<\@tempdimb%
  \@tempdima=\@tempdimb%
\fi%
\hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}
\makeatother

%%===参考文献===%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\bibliographystyle{abbrv}        % 参考文献样式,  plain,unsrt,alpha,abbrv,chinesebst 等等
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{{figures/}}        % 图片文件路径
%%%%%%%%%%%%%%%%%%%%%%%---优化图片排版---%%%%%%%%%%%%%%%%%%%%% 赵驰修改 2019.02
\newlength\imagewidth
\setlength\imagewidth{0.45\columnwidth}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\allowdisplaybreaks

\endlinechar `\^^M
\endinput