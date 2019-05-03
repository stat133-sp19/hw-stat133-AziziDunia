#it is a private auxiliary function that test if an input prob is a valid provality value between 0 and 1.
check_trials <- function(trials){
  if (trials >= 0){
    return(TRUE)
  }
  else{
    stop("invalid trials value")
  }
}

#it is private auxiliary function that tests if an input trials is avalid value for number of non-negative integer.
check_prob <- function(prob){
  if (prob >= 0 & prob <= 1){
    return(TRUE)
  }
  else{
    stop("p has to be a number between 0 and 1")
  }
}

#it is a private auxiliary function that tests if an input success is a valid value for number of successes between 0 and number of trials
check_success <- function(success, trials){
   if(sum(success < 0)){
    stop('invalid success value')
     }

   if(sum(success > trials)){
    stop("if success > trials then 'success' cannot be greater than trials")
    }
  return(TRUE)
}
#It is a private function that takes two arguments trials and prob and returns the mean in the binomial distribution.
aux_mean <- function(trials, prob){
  mean <- trials * prob
  return(mean)
}

#It is a private function that takes two arguments trials and prob and returns the variance in the binomial distribution.
aux_variance <- function(trials, prob){
  variance <- (trials * prob) * (1 - prob)
  return(variance)
}

#It is a private function that takes two arguments trials and prob and returns the mode in the binomial distribution.
aux_mode <- function(trials, prob){

  m <- trials * prob + prob
  if (floor(m) == m){
    return(c(m, m-1))
  }
  else{
    return(floor(m))
  }
}

#It is a private function that takes two arguments trials and prob and returns the skewness in the binomial distribution.
aux_skewness <- function(trials,prob){
  skewness <- ((1 - 2*prob)/ sqrt((trials * prob) * (1 - prob)))
  return(skewness)
}

#It is a private function that takes two arguments trials and prob and returns the kurtosis in the binomial distribution.
aux_kurtosis <- function(trials,prob){
  kurtosis <- (1-6*prob*(1-prob))/((trials * prob) * (1 - prob))
  return(kurtosis)
}

#' @title Function bin_choose()
#' @description using factorial to caculate the number combinations in which successes an occur in trials
#' @param n is the number of (fixed) trials
#' @param k is a variable that represents the number of success out of n trials
#' @return the number of combinatons in which successes(k) and trials(n) can occur
#' @export
#' @examples
#' bin_choose (n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)

bin_choose <- function(n,k){

  result <- sapply(n, factorial)/((sapply(k, factorial))* sapply((n-k), factorial))
  if(sum(k - n) > 0){
    stop("k cannot be greater than n")
  }
  return(result)
}

#' @title Function bin_probability()
#' @description it takes three arguemnts sucess, trials, and prob to calculate bionomial probability
#' @param  success is a non-negative interger less than of equal to trials and check_sucess function is used to check if success is valid
#' @param trials is a non-negative integer and check_trial function is used to check if triasl is valid
#' @param prob is the probaility of success on each trial and check_prof is used to check if pro is valid
#' @return binomial probability of successes in trials given by probability
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability <- function(success, trials, prob){

  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  result <- bin_choose(trials, success) * prob^success * (1-prob)^(trials-success)
  return(result)
}

#' @title Function bin_distribution()
#' @description it takes two aruments trials & prob to calculate the probability distribution of success in a given trial and given probability.
#' @param trials is a non-negative integer; numeric vector
#' @param prob is the probaility of success on each trial;numeric vector
#' @return a data frame with probability distribution
#' @export
#' @examples
#' bin_dis <- bin_distribution(trials = 5, prob = 0.5)
#' plot(bin_dis)

bin_distribution <- function(trials, prob){

  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  returned_output <- data.frame('success' = success, 'probability' = probability)
  class(returned_output) <- c('bindis', 'data.frame')
  return(returned_output)
}

#Function plot.bindis()
#' @export
plot.bindis <- function(x){
  barplot(x$probability,
          ylab = 'probability',
          xlab = 'successes',
          names.arg= x$success)
}

#' @title Function bin_cumulative()
#' @description it takes two aruments trials & prob and calculates the cumulated probability of each trial
#' @param trials is a non-negative integer; numeric vector
#' @param prob is the probaility of success on each trial; numeric vector
#' @return a data frame with probability distributin and cumulative probability
#' @export
#' @examples
#' bin_cum <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(bin_cum)
bin_cumulative <- function(trials, prob){

  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  cumulative <- cumsum(probability)
  returned_output <- data.frame('success' = success, 'probability' = probability,'cumulative' = cumulative )
  class(returned_output) <- c('bincum', 'data.frame')
  return(returned_output)
}

#Function plot.bincum()
#' @export
plot.bincum <- function(x){
  plot(x$cumulative,
       ylab = 'probability',
       xlab = 'successes',
       type = "o",
       xaxt = "n")
  axis(1,at = 1:length(x$success), labels = x$success)
}

#' @title Function bin_variable()
#' @description it takes two aruments trials & prob and calculates an object of class caled "binvar" which is a binomial random variable object
#' @param trials is a non-negative integer; numeric vector
#' @param prob is the probaility of success on each trial; numeric vector
#' @return a data frame with a list of trials and probablity
#' @export
#' @examples
#' bin_var <- bin_variable(trials = 5, prob = 0.5)
#' bin_var
#'
#' summary(bin_var)
bin_variable <- function(trials, prob){

  check_trials(trials)
  check_prob(prob)
  returned_object <- list('trial' = trials, 'prob' = prob)
  class(returned_object) <- c('binvar')
  return(returned_object)
}

#' @export
print.binvar <- function(x){
  cat('"Binomial variable"')
  cat('\n')
  cat('\n')
  cat("Paramaters")
  cat("\n","- number of trials: ", x[['trial']])
  cat("\n","- prob of success : ", x[['prob']])
  invisible(x)
}

#' @export
summary.binvar <- function(x){

  check_trials(x$trial)
  check_prob(x$prob)
  trials <- x$trial
  prob <- x$prob
  mean <- aux_mean(x$trial, x$prob)
  variance <- aux_variance(x$trial, x$prob)
  mode <- aux_mode(x$trial, x$prob)
  skewness <- aux_skewness(x$trial, x$prob)
  kurtosis <- aux_kurtosis(x$trial, x$prob)
  returned_object <- list('number of trials' = trials,
                          'probability of success' = prob,
                          'mean or expected value' = mean,
                          'variance' = variance,
                          'mode' = mode,
                          'skewness' = skewness,
                          'kurtosis' = kurtosis)
  class(returned_object) <- c('summary.binvar')
  return(returned_object)
}

#' @export
print.summary.binvar <- function(x){
  cat('"Summary Binomial"')
  cat('\n\n')
  cat("Paramaters")
  cat("\n","- number of trials: ", x[['number of trials']])
  cat("\n","- prob of success : ", x[['probability of success']])
  cat('\n\n')
  cat("Measures")
  cat("\n","- mean:      ", x[[ 'mean or expected value']])
  cat("\n","- variance : ", x[['variance']])
  cat("\n","- mode:      ", x[['mode']])
  cat("\n","- skewness : ", x[['skewness']])
  cat("\n","- kurtosis : ", x[['kurtosis']])
  invisible(x)
}

#' @export
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @export
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @export
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @export
bin_skewnees <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @export
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}

