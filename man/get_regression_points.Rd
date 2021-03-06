% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regression_functions.R
\name{get_regression_points}
\alias{get_regression_points}
\title{Get regression points}
\usage{
get_regression_points(model, digits = 3, print = FALSE, newdata = NULL)
}
\arguments{
\item{model}{an \code{lm()} model object}

\item{digits}{number of digits precision in output table}

\item{print}{If TRUE, return in print format suitable for R Markdown}

\item{newdata}{A new data frame of points/observations to apply \code{model} to 
obtain new fitted values and/or predicted values y-hat. Note the format of 
\code{newdata} must match the format of the original \code{data} used to fit
\code{model}.}
}
\value{
A tibble-formatted regression table of outcome/response variable, 
all explanatory/predictor variables, the fitted/predicted value, and residual.
}
\description{
Output information on each point/observation used in an \code{lm()} regression in 
"tidy" format. This function is a wrapper function for \code{broom::augment()} 
and renames the variables to have more intuitive names.
}
\examples{
library(moderndive)
library(dplyr)
library(tibble)

# Fit lm() regression:
mpg_model <- lm(mpg ~ cyl, data = mtcars)

# Get information on all points in regression:
get_regression_points(mpg_model)

# Create training and test set based on mtcars: 
mtcars <- mtcars \%>\% 
  rownames_to_column(var = "model")
training_set <- mtcars \%>\% 
  sample_frac(0.5)
test_set <- mtcars \%>\% 
  anti_join(training_set, by = "model")

# Fit model to training set:
mpg_model_train <- lm(mpg ~ cyl, data = training_set)

# Make predictions on test set:
get_regression_points(mpg_model_train, newdata = test_set)
}
\seealso{
\code{\link[broom]{augment}}, \code{\link{get_regression_table}}, \code{\link{get_regression_summaries}}
}
