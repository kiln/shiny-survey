generateData = function() {
  set.seed(1234)
  n = 5000
  data = c(rbinom(n, 32, 0.58), rpois(n, 37)) + rnorm(2*n)
  return(data)
}