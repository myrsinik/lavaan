\name{estfun}
\alias{estfun.lavaan}
\alias{lavScores}
\title{Extract Empirical Estimating Functions}
\description{
A function for extracting the empirical estimating functions of a fitted 
lavaan model. This is the derivative of the objective function 
with respect to the parameter vector, evaluated at the observed (case-wise)
data. In other words, this function returns the case-wise scores, evaluated
at the fitted model parameters.
}
\usage{
estfun.lavaan(object, scaling = FALSE, ignore.constraints = FALSE,
              remove.duplicated = TRUE)
lavScores(object, scaling = FALSE, ignore.constraints = FALSE,
          remove.duplicated = TRUE)
}
\arguments{
\item{object}{An object of class \code{\linkS4class{lavaan}}.}
\item{scaling}{If \code{TRUE}, the scores are scaled to reflect the specific
objective function used by lavaan. If \code{FALSE} (the default), the 
objective function is the loglikelihood function assuming multivariate 
normality.}
\item{ignore.constraints}{Logical. If \code{TRUE}, the scores do not reflect
the (equality or inequality) constraints. If \code{FALSE}, the scores are
computed by taking the unconstrained scores, and adding the term 
\code{t(R) lambda}, where \code{lambda} are the (case-wise) Lagrange 
Multipliers, and \code{R} is
the Jacobian of the constraint function. Only in the latter case will 
the sum of the columns be (almost) equal to zero.}
\item{remove.duplicated}{If \code{TRUE}, and all the equality constraints have
a simple form (eg. a == b), the unconstrained scores are post-multiplied with a
transformation matrix in order to remove the duplicated parameters.}
}
\value{A n x k matrix corresponding to n observations and k parameters.}
\author{Ed Merkle; the \code{remove.duplicated} and \code{ignore.constraints}
options were added by Yves Rosseel}
