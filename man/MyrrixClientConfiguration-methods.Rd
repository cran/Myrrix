\name{MyrrixClientConfiguration-methods}
\alias{getMyrrixOptions}
\alias{getMyrrixOptions,MyrrixClientConfiguration-method}
\alias{MyrrixClientConfiguration-methods}
\alias{setAllPartitionsSpecification}
\alias{setAllPartitionsSpecification,MyrrixClientConfiguration,character-method}
\alias{setContextPath}
\alias{setContextPath,MyrrixClientConfiguration,character-method}
\alias{setHost}
\alias{setHost,MyrrixClientConfiguration,character-method}
\alias{setKeystoreFile}
\alias{setKeystoreFile,MyrrixClientConfiguration,character-method}
\alias{setKeystorePassword}
\alias{setKeystorePassword,MyrrixClientConfiguration,character-method}
\alias{setPassword}
\alias{setPassword,MyrrixClientConfiguration,character-method}
\alias{setPort}
\alias{setPort,MyrrixClientConfiguration,integer-method}
\alias{setSecure}
\alias{setSecure,MyrrixClientConfiguration,logical-method}
\alias{setUserName}
\alias{setUserName,MyrrixClientConfiguration,character-method}
\title{Methods to apply on objects of class MyrrixClientConfiguration}
\arguments{
  \item{object}{An object of class
  MyrrixClientConfiguration}

  \item{host}{host containing the Serving Layer, if not in
  distributed mode}

  \item{port}{port on which to access the Serving Layer, if
  not in distributed mode.}

  \item{username}{user name needed to access the Serving
  Layer, if any}

  \item{password}{password needed to access the Serving
  Layer, if any}

  \item{allpartitionsspecification}{specification for all
  servers that have partitions. Only applicable in
  distributed mode and returns null otherwise. May be
  specified as "auto", in which case getHost() and
  getPort() must be valid, since this host will be queried
  for partition details. Otherwise, Serving Layers are
  specified explicitly as "host:port" pairs. Replicas are
  specified as many Serving Layers, separated by commas,
  like "rep1:port1,rep2:port2,...". Finally, partitions are
  specified as multiple replicas separated by semicolon,
  like
  "part1rep1:port11,part1rep2:port12;part2rep1:port21,part2rep2:port22;...".
  Example: "foo:80,foo2:8080;bar:8080;baz2:80,baz3:80"}

  \item{contextpath}{the context path under which the
  target Serving Layer app is deployed (e.g.
  http://example.org/contextPath/...), or null if the
  default root context should be used.}

  \item{keystorefile}{the keystore file containing the
  server's SSL keys. Only necessary when accessing a server
  with a temporary self-signed key, which is not by default
  trusted by the Java SSL implementation}

  \item{keystorepassword}{password for keystorefile}

  \item{secure}{if true, this client is accessing the
  Serving Layer over HTTPS, not HTTP}

  \item{...}{other arguments passed on the the methods}
}
\description{
  Methods to apply on objects of class
  MyrrixClientConfiguration. These allow to define which
  Myrrix service to listen to. See the methods section of
  this doc for an enumerated list of function to apply.\cr
  More information on
  http://myrrix.com/docs/client/java/javadoc/net/myrrix/client/MyrrixClientConfiguration.html
}
\section{Methods}{
  \describe{ \item{\code{show(object)}:}{Show method for a
  MyrrixClientConfiguration object: Prints configuration
  settings, indicating which server information Myrrix
  talks to} \item{\code{getMyrrixOptions(object)}:}{Returns
  a list of configuration settings, indicating which
  information Myrrix talks to} \item{\code{setHost(object,
  host)}}{Sets the host of the Myrrix Serving layer}
  \item{\code{setPort(object, port)}}{Sets the port on
  which to access the Serving Layer}
  \item{\code{setUserName(object, userName)}}{Sets the user
  name needed to access the Serving Layer}
  \item{\code{setPassword(object, password)}}{Sets the
  password needed to access the Serving Layer}
  \item{\code{setContextPath(object, contextPath)}}{Sets
  the context path under which the target Serving Layer app
  is deployed} \item{\code{setKeystoreFile(object,
  keystoreFile)}}{Sets the the keystore file containing the
  server's SSL keys.}
  \item{\code{setKeystorePassword(object,
  keystorePassword)}}{Sets the the password for
  keystorefile} \item{\code{setSecure(object, secure)}}{Set
  if this client is accessing the Serving Layer over HTTPS,
  not HTTP}
  \item{\code{setAllPartitionsSpecification(object,
  allPartitionsSpecification)}}{Sets the specification for
  all servers that have partitions} }
}
\examples{
myconfig <- new("MyrrixClientConfiguration")
getMyrrixOptions(myconfig)
setHost(myconfig, "myhostname")
setPort(myconfig, 20L)
}

