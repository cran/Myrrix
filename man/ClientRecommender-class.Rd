\name{ClientRecommender-class}
\alias{ClientRecommender-class}
\title{Object of class ClientRecommender}
\arguments{
  \item{config}{An object of class
  MyrrixClientConfiguration}
}
\description{
  An implementation of MyrrixRecommender which accesses a
  remote Serving Layer instance over HTTP or HTTPS. This is
  like a local "handle" on the remote recommender.
}
\section{Slots}{
  \describe{ \item{\code{recommender}:}{A java object of
  class net.myrrix.client.ClientRecommender}
  \item{\code{clientConfiguration}:}{An object of class
  MyrrixClientConfiguration, which holds the java object
  with the connection settings to Myrrix} }
}
\examples{
myconfig <- new("MyrrixClientConfiguration")
myconfig
recommendationengine <- new("ClientRecommender", config=myconfig)
recommendationengine
}

