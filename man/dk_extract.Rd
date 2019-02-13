\name{dk_extract}
\alias{dk_extract}
\title{
Extract characteristics of certain species in the dk sheet
}
\description{
Input a species, get its type and phenotypical characteristics as phenotypes
}
\usage{
dk_extract(x = dk_eg, Gtarget = 'bird')
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
\item{Gtarget}{
Target specie to search(must be precise)
}
}
\details{
functions to search for non-precise char is to be developed(maybe with stringr in the future)
}
\value{
}
\references{
}
\author{
Hao Li
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{dk_eg}}
\code{\link{dk_classify}}
}
\examples{
dk_extract(x = dk_eg, Gtarget = 'bird')
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~extract }
\keyword{ ~phenotype }
\keyword{ ~classification }
