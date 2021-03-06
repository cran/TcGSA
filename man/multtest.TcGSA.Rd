% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multtest.TcGSA.R
\name{multtest.TcGSA}
\alias{multtest.TcGSA}
\title{Computing the P-value of the Likelihood Ratios Applying a Multiple Testing
Correction}
\usage{
multtest.TcGSA(
  tcgsa,
  threshold = 0.05,
  myproc = "BY",
  exact = TRUE,
  nbsimu_pval = 1e+06
)
}
\arguments{
\item{tcgsa}{a TcGSA object.}

\item{threshold}{the threshold at which the FDR or the FWER should be
controlled.}

\item{myproc}{a vector of character strings containing the names of the
multiple testing procedures for which adjusted p-values are to be computed.
This vector should include any of the following: "\code{Bonferroni}",
"\code{Holm}", "\code{Hochberg}", "\code{SidakSS}", "\code{SidakSD}",
"\code{BH}", "\code{BY}", "\code{ABH}", "\code{TSBH}" or "\code{none}".  
"\code{none}" indicates no adjustment for multiple testing.  See
\code{\link[multtest:mt.rawp2adjp]{mt.rawp2adjp}} for details.  Default is
"\code{BY}", the Benjamini & Yekutieli (2001) step-up FDR-controlling
procedure (general dependency structures).  In order to control the FWER (in
case of an analysis that is more a hypothesis confirmation than an
exploration of the expression data), we recommend to use "\code{Holm}", the
Holm (1979) step-down adjusted p-values for strong control of the FWER.}

\item{exact}{logical flag indicating whether the raw p-values should be computed from the 
exact asymptotic mixture of chi-square, or simulated (longer and not better).
Default is \code{TRUE} and should be preferred.}

\item{nbsimu_pval}{the number of observations under the null distribution to
be generated in order to compute the p-values. Default is \code{1e+06}.}
}
\value{
\code{multtest.TcGSA} returns an dataframe with 5 variables.  The
rows correspond to the gene sets under scrutiny.  The 1st column is the
likelihood ratios \code{LR}, the 2nd column is the convergence status of the
model under the null hypothesis \code{CVG_H0}, the 3rd column is the
convergence status of the model under the alternative hypothesis
\code{CVG_H1}, the 4th column is the raw p-value of the mixed likelihood
ratio test \code{raw_pval}, the 5th column is the adjusted p-value of the
mixed likelihood ratio test \code{adj_pval}.
}
\description{
This function computes the p-value of the likelihood ratios and apply a
multiple testing correction.
}
\examples{

if(interactive()){
data(data_simu_TcGSA)

tcgsa_sim_1grp <- TcGSA.LR(expr=expr_1grp, gmt=gmt_sim, design=design, 
                          subject_name="Patient_ID", time_name="TimePoint",
                          time_func="linear", crossedRandom=FALSE)
                          
mtt <- multtest.TcGSA(tcgsa_sim_1grp, threshold = 0.05, 
                     myproc = "BY", nbsimu_pval = 1000)
mtt
}

}
\seealso{
\code{\link{TcGSA.LR}}, 
\code{\link[multtest:mt.rawp2adjp]{mt.rawp2adjp}},
\code{\link{signifLRT.TcGSA}}
}
\author{
Boris P. Hejblum
}
