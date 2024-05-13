{smcl}
{* version 1.0.0 11July2013}{...}
{cmd:help xtpedroni}{right:({browse "http://www.stata-journal.com/article.html?article=st0356":SJ14-3: st0356})}
{hline}

{title:Title}

{p2colset 5 18 20 2}{...}
{p2col:{hi:xtpedroni} {hline 2}}Pedroni's panel cointegration tests and panel-dynamic ordinary least-squares estimation
{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 17 2}
{cmd:xtpedroni} {depvar} {indepvars} {ifin} 
[{cmd:,}
{opt notdum}
{opt nopdols}
{opt notest}
{opt extraobs}
{opt b(#)}
{opt mlags(#)}
{opt trend}
{opt lagselect(string)}
{opt adflags(#)}
{opt lags(#)}
{opt full}
{opt average(string)}]


{p 4 6 2}
You must {cmd:xtset} your data before using {cmd:xtpedroni}; see {helpb xtset}.{p_end}

{p 4 6 2}
For correct estimation, ensure that any missing observations are
at the start or end of the sample.{p_end}


{title:Description}

{pstd}
{cmd:xtpedroni} has two functions:{p_end}

{phang2}First, it allows Stata users to compute Pedroni's seven test
statistics under a null of no cointegration in a heterogeneous panel
(medium to large N, large T) with one or more nonstationary regressors.
These test statistics are panel v, panel rho, group rho, panel
t (nonparametric), group t (nonparametric), panel ADF (parametric
t), and group ADF (parametric t). All test statistics are
normalized to be distributed under N(0,1).  All the statistics, except
for panel v, diverge to negative infinity as the p-value converges to
0.{p_end}

{phang2}Second, it computes Pedroni's group-mean panel-dynamic ordinary
least-squares (PDOLS) estimates. Very briefly, it extends the dynamic
ordinary least-squares (DOLS) technique of estimating the cointegrating
vector in a single equation to panel time-series data (medium to large
N, large T).  DOLS involves adding lags and leads of the
regressors to eliminate feedback effects and endogeneity.  In PDOLS, a
DOLS regression is conducted for each individual, and the results are
combined for the entire panel following Pedroni's group-mean approach.
Variables must cointegrate to be used here.{p_end}

{pstd}For more information on both of these functions, see the
following:{p_end}

{phang2}Pedroni, P. 1999. Critical values for cointegration tests in
heterogeneous panels with multiple regressors. {it:Oxford Bulletin of Economics and Statistics} 61: 653-670.{p_end}

{phang2}Pedroni, P. 2001. Purchasing power parity tests in cointegrated
panels.{it: Review of Economics and Statistics} 83: 727-731.{p_end}


{title:Options}

    {title:Options that affect the cointegration test and the PDOLS estimation}

{phang}{cmd: notdum} suppresses time demeaning of the variables (that
is, the common time dummies).  Time demeaning is turned on by default.
This option may be appropriate to use when averaging over the N
dimension may destroy the cointegrating relationship or when there are
comparability concerns between panel units in the data.{p_end}

{phang}{cmd:nopdols} suppresses PDOLS estimation (that is, reports only
the cointegration test results).{p_end}

{phang}{cmd:notest} suppresses the cointegration tests (that is, reports only PDOLS estimation).{p_end}

{phang}{cmd:extraobs} includes the available observations from the missing
years in the time means used for time demeaning if there is an unbalanced panel with observations missing for some of
the variables (at the start or end of the sample) for certain
individuals.  This was the behavior of Pedroni's original PDOLS program
but not of the cointegration test program.  It is off by default.{p_end}

{phang}{cmd: b(}{it:#}{cmd:)} defines the null hypothesis beta as {it:#}.
The default is {cmd:b(0)}.{p_end}

{phang}{cmd: mlags(}{it:#}{cmd:)} specifies the number of lags to be
used in the Bartlett kernel for the Newey-West long-run variance.  If
{cmd:mlags()} is not specified, then the number of lags is determined automatically for each
individual.{p_end}


    {title:Options that affect only cointegration test}

{phang}{cmd:trend} adds a linear time trend.{p_end}

{phang}{cmd:lagselect(}{it:string}{cmd:)} specifies the criterion used
to select lag length in the ADF regressions.  {it:string} can be
{cmd:aic} (default), {cmd:bic}, or {cmd:hqic}.{p_end}

{phang}{cmd:adflags(}{it:#}{cmd:)} specifies the maximum number of lags
to be considered in the lag selection process for the ADF regressions.  If
{cmd:adflags()} is not specified, then it is determined automatically.{p_end}


    {title:Options that affect only the PDOLS estimation}

{phang}{cmd:lags(}{it:#}{cmd:)} specifies the number of lags and leads
to be included in the DOLS regression.  The default is {cmd:lags(2)}.{p_end}

{phang}{cmd: full} reports the DOLS regression for each individual in
the panel.{p_end}

{phang}{cmd: average(}{it:string}{cmd:)} determines the methodology used
to combine individual coefficient estimates into the panel estimate.
{it:string} can be {cmd:simple} (default), {cmd:sqrt}, or
{cmd:precision}.  {cmd:simple} takes a simple average and is the
behavior of the original Pedroni program.  {cmd:sqrt} weighs each
estimate according to the square root of the precision
matrix, which is the same procedure used for averaging the t statistics.
{cmd:precision} weighs each individual's coefficient estimates by its
precision.{p_end}


{title:Examples}

{phang}{cmd:. xtpedroni y x1 x2, full notest}

{phang}{cmd:. xtpedroni y x1 x2 x3 x4, nopdols trend lagselect(hqic) adflags(8)}

{phang}{cmd:. xtpedroni y x1, notdum b(1) lags(4)}


{title:Author}

{pstd}Timothy Neal{p_end}
{pstd}University of New South Wales{p_end}
{pstd}Sydney, Australia{p_end}
{pstd}timothy.neal@unsw.edu.au{p_end}


{marker also_see}{...}
{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 14, number 3: {browse "http://www.stata-journal.com/article.html?article=st0356":st0356}

{p 5 14 2}
Online:  {helpb xtdata}, {helpb xtunitroot}, {helpb xtset},
{helpb xtreg},{break}
{helpb xtpmg} (if installed){p_end}
