% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rriskDistributions_functions.R
\name{get.norm.sd}
\alias{get.norm.sd}
\title{Fitting standard deviation of a normal distribution from one or more quantiles and known mean}
\usage{
get.norm.sd(p = c(0.025, 0.5, 0.975), q, show.output = TRUE, plot = TRUE,
                   fit.weights = rep(1, length(p)), scaleX = c(0.1, 0.9), ...)
}
\arguments{
\item{p}{numeric, vector of probabilities.}

\item{q}{numeric, vector of quantiles corresponding to p.}

\item{show.output}{logical, if \code{TRUE} the \code{optim} result will be printed (default vaule is \code{TRUE}).}

\item{plot}{logical, if \code{TRUE} the graphical diagnostics will be plotted (default value is \code{TRUE}).}

\item{fit.weights}{numerical vector of the same length as a probabilities vector 
\code{p} containing positive values for weighting quantiles. By default all
quantiles will be weighted by 1.}

\item{scaleX}{numerical vector of the length 2 containing values (from the open interval (0, 1))
for scaling quantile-axis (relevant only if \code{plot = TRUE}). The smaller the left value,
the further the graph is extrapolated within the lower percentile, the greater the right
value, the further it goes within the upper percentile.}

\item{...}{further arguments passed to the functions \code{plot} and \code{points} (relevant only if \code{plot = TRUE}).}
}
\value{
Returns an estimated standard deviation or missing value
}
\description{
\code{get.norm.sd} returns the standard deviation of a normal distribution
where the \code{p}th percentiles match with the quantiles \code{q}.
}
\details{
The number of probabilities and the number of quantiles must be identical and
should be at least two. \code{get.norm.sd} uses the central limit theorem and
the linear regression.
\cr \cr
If \code{show.output = TRUE} the output of the function \code{lm} will be shown.
\cr \cr
The items of the probability vector \code{p} should lie between 0 and 1.
\cr \cr
The items of the weighting vector \code{fit.weights} should be positive values.
\cr \cr
The function will be meaningful only if the quantile comes from a normal distribution.
}
\note{
It should be noted that the data must be normally distributed, or the 
central limt theorem must hold for large (enough) samples sizes.
}
\examples{
q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 0, sd = 2)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.sd(q = q)
get.norm.sd(q = q, scaleX = c(0.0001, 0.9999))
get.norm.sd(q = q, fit.weights = c(10, 1, 10))
get.norm.sd(q = q, fit.weights = c(1, 10, 1))
get.norm.sd(q = q, fit.weights = c(100, 1, 100))
get.norm.sd(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 176, sd = 15)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.sd(q = q)
get.norm.sd(q = q, fit.weights = c(10, 1, 10))
get.norm.sd(q = q, fit.weights = c(1, 10, 1))
get.norm.sd(q = q, fit.weights = c(100, 1, 100))
get.norm.sd(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

## The estimation model is not suitable for the following quantiles.
## Because the quantile is unsymmetrical, which could not be from a normally distributed data.
q <- c(-2, 30, 31)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.sd(q = q)
get.norm.sd(q = q, fit.weights = c(10, 1, 10))
get.norm.sd(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.0001, 0.9999))
get.norm.sd(q = q, fit.weights = c(100, 1, 100))
get.norm.sd(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.0001, 0.9999))
graphics::par(old.par)

## Estimating from actually exponentially distributed data
x.exp <- rexp(n = 10, rate = 5)
mean(x.exp)
stats::sd(x.exp)
q <- quantile(x.exp, c(0.025, 0.5, 0.975))
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.sd(q = q)
get.norm.sd(q = q, fit.weights = c(1, 10, 1))
get.norm.sd(q = q, fit.weights = c(10, 1, 10))
get.norm.sd(q = q, fit.weights = c(1, 100, 1))
get.norm.sd(q = q, fit.weights = c(100, 1, 100))
graphics::par(old.par)

## other examples
q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 1, sd = 1)
get.norm.sd(q = q)

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 1, sd = 0.5)
get.norm.sd(q = q)

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 0.01, sd = 0.1)
get.norm.sd(q = q)

}
\seealso{
See \code{pnorm} for distribution implementation details.
}
\author{
Matthias Greiner \email{matthias.greiner@bfr.bund.de} (BfR), \cr
Katharina Schueller \email{schueller@stat-up.de} (\acronym{STAT-UP} Statistical Consulting), \cr
Natalia Belgorodski \email{belgorodski@stat-up.de} (\acronym{STAT-UP} Statistical Consulting)
}
\keyword{fitpercentiles}
