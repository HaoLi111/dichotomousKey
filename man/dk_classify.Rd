\name{dk_classify}
\alias{dk_classify}
\title{
Classify a specie by phenotypical characteristics in a CLI in the terminal (interactive)
}
\description{
As title.
With a dichotomous key table, the function gives you choices of the features of the speciment (and maybe in the form of multimedias if enabled) and classify the specie for you.
}
\usage{
dk_classify(x = dk_eg,asp = 3,show_img = F,show_link = F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Table input, if not specified then the example table, dk_eg will be used
}
\item{show_img}{
Being developed, extension of output media
}
\item{show_link}{
Being developed, extension of output media
}
}
\details{
Searching across tables is still under construction.

You can import your own table from books or websites using the form shown in dk_eg.Make sure when you import,
specify stringsAsFactors = FALSE.
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
}
\examples{
## This will open the CLI
## dk_classify()
}
\keyword{ ~classify }
\keyword{ ~dichotomous }
