\name{RecommenderMethods-methods}
\alias{await}
\alias{await,ClientRecommender-method}
\alias{await,ServerRecommender-method}
\alias{estimatePreference}
\alias{estimatePreference,ClientRecommender,numeric,numeric-method}
\alias{estimatePreference,ServerRecommender,numeric,numeric-method}
\alias{getAllItemIDs}
\alias{getAllItemIDs,ClientRecommender-method}
\alias{getAllItemIDs,ServerRecommender-method}
\alias{getAllUserIDs}
\alias{getAllUserIDs,ClientRecommender-method}
\alias{getAllUserIDs,ServerRecommender-method}
\alias{getMyrrixHyperParameters}
\alias{getMyrrixHyperParameters,character-method}
\alias{getMyrrixHyperParameters,missing-method}
\alias{ingest}
\alias{ingest,ClientRecommender,character-method}
\alias{ingest,ServerRecommender,character-method}
\alias{mostPopularItems}
\alias{mostPopularItems,ClientRecommender,integer-method}
\alias{mostPopularItems,ServerRecommender,integer-method}
\alias{recommend}
\alias{recommend,ClientRecommender,numeric,integer-method}
\alias{RecommenderMethods-methods}
\alias{recommend,ServerRecommender,numeric,integer-method}
\alias{setMyrrixHyperParameters}
\alias{setMyrrixHyperParameters,list-method}
\title{Methods to apply on objects of class ClientRecommender and ServerRecommender}
\arguments{
  \item{object}{An object of class \code{ClientRecommender}
  or of class \code{ServerRecommender}}

  \item{userID}{a user id for which to make the
  recommendation}

  \item{itemIDs}{a vector of item id's for which to make
  the recommendation}

  \item{params}{a list of hyperparameters to set for
  building the recommendation engine. Where the names of
  the list elements need to be part of the specified
  hyperparameters below. See the examples.}

  \item{parameters}{a character vector of names of
  hyperparameters to obtain the values. See the examples.}

  \item{howMany}{an integer indicating how many popular
  items you want in the call to \code{mostPopularItems} and
  \code{recommend}}

  \item{...}{other arguments passed on to the methods}
}
\description{
  Methods to apply on objects of class ClientRecommender
  and ServerRecommender.\cr Objects of
  \code{ClientRecommender} and \code{ServerRecommender}
  behave similarly for the user. Both are classes which
  provide the interface with the recommendation engine of
  Myrrix, which is either running locally or in a
  distributed fashion.\cr The methods which can be applied
  on this recommendation engine are \code{await},
  \code{getAllItemIDs}, \code{getAllUserIDs},
  \code{estimatePreference}, \code{mostPopularItems},
  \code{recommend}.\cr If Myrrix is running locally, you
  can set the hyperparameters of the recommendation engine
  which are set in java system variables and are used by
  Myrrix. This can be done by using the provided methods
  \code{setMyrrixHyperParameters} and
  \code{getMyrrixHyperParameters}. A full description of
  these hyperparamters which influence the model are listed
  below.
}
\section{Methods}{
  \describe{
  \item{\code{setMyrrixHyperParameters(list)}:}{Set a list
  of hyperparameters for building and tuning the
  recommendation engine}
  \item{\code{getMyrrixHyperParameters()}:}{Get a list of
  hyperparameters which is currently used for building and
  tuning the recommendation engine}
  \item{\code{getMyrrixHyperParameters(parameters)}:}{Get a
  list of hyperparameters which is currently used for
  building and tuning the recommendation engine, limited to
  the parameters specified}
  \item{\code{await(ClientRecommender/ServerRecommender)}:}{Wait
  until the model is finished}
  \item{\code{getAllItemIDs(ClientRecommender/ServerRecommender)}:}{Get
  all item id's known to the model}
  \item{\code{getAllUserIDs(ClientRecommender/ServerRecommender)}:}{Get
  all user id's known to the model}
  \item{\code{estimatePreference(ClientRecommender/ServerRecommender,
  userID, itemIDs)}:}{Score a user for different items
  alongside the recommendation engine}
  \item{\code{mostPopularItems(ClientRecommender/ServerRecommender,
  howMany)}:}{Get the most popular items}
  \item{\code{recommend(ClientRecommender/ServerRecommender,
  userID, howMany)}:}{Recommend a number of items to a
  specific user} }
}

\section{Hyperparameters}{
  \describe{ \item{\code{model.iterations.max}:}{A hard
  limit of the number of iterations that will run in one
  build. Defaults to 30.}
  \item{\code{model.features}:}{Number of features to use
  when creating the matrix factorization. Defaults to 30.}
  \item{\code{model.als.iterations.convergenceThreshold}:}{Estimated
  strength values in the original matrix change a little
  after each iteration, and less over time. If average
  absolute change in estimates is below this threshold,
  iteration will stop.  Defaults to 0.001.}
  \item{\code{model.als.lambda}:}{Controls the lambda
  overfitting parameter in the ALS algorithm. Defaults to
  0.01} \item{\code{model.als.alpha}:}{Controls the alpha
  parameter in the ALS algorithm. Defaults to 40}
  \item{\code{model.noKnownItems}:}{If true, does not store
  in memory items that each user is already associated to.
  This saves memory, but means that the recommender does
  not remember which items the user is already associated
  to.  These can't be automatically removed from
  consideration as recommendations.  This is desirable
  behavior in some contexts. To use this, the
  considerKnownItems argument to recommend must be true.
  mostPopularItems will also not work with this flag
  enabled. Not recommended in general. Defaults to false.}
  \item{\code{model.local.writesBetweenRebuild}:}{Sets the
  number of new data points written to the model that will
  trigger a model rebuild. Only applies to stand-alone
  mode. Defaults to 10000.}
  \item{\code{model.distributed.writesBetweenUpload}:}{Sets
  the number of new data points written to the model that
  will trigger an upload of local data to the distributed
  storage system. Only applies to distributed mode.
  Defaults to 50000}
  \item{\code{model.lsh.sampleRatio}:}{Enables
  locality-sensitive hashing to speed up the /recommend
  method, at the cost of accuracy. Set to a value in (0,1];
  LSH is disabled unless set to a value less than 1.
  Recommended values are less than 0.1. This feature is
  experimental. Defaults to 1.0} }
}
\examples{
##
## Set Hyperparameters to tune the Myrrix recommendation engine
##
x <- getMyrrixHyperParameters()
str(x)
setMyrrixHyperParameters(
 params=list(model.iterations.max = 10, model.features=30, model.als.lambda=0.1))
x <- getMyrrixHyperParameters(
 parameters=c("model.iterations.max","model.features","model.als.lambda"))
str(x)
##
## Build a recommendation model locally
##
\dontrun{
inputfile <- file.path(tempdir(), "audioscrobbler-data.subset.csv.gz")
download.file(
 url="http://dom2bevkhhre1.cloudfront.net/audioscrobbler-data.subset.csv.gz",
 destfile = inputfile)
## Set hyperparameters
setMyrrixHyperParameters(
 params=list(model.iterations.max = 2, model.features=10, model.als.lambda=0.1))
x <- getMyrrixHyperParameters(
 parameters=c("model.iterations.max","model.features","model.als.lambda"))
str(x)
## Build a model which will be stored in getwd() and ingest the data file into it
recommendationengine <- new("ServerRecommender", localInputDir=getwd())
ingest(recommendationengine, inputfile)
await(recommendationengine)
## Get all users/items and score
items <- getAllItemIDs(recommendationengine)
users <- getAllUserIDs(recommendationengine)
estimatePreference(recommendationengine, userID=users[5], itemIDs=items[1:20])
mostPopularItems(recommendationengine, howMany=10L)
recommend(recommendationengine, userID=users[5], howMany=10L)
}
}
\seealso{
  \code{\link{ClientRecommender-class}},
  \code{\link{ServerRecommender-class}}
}

