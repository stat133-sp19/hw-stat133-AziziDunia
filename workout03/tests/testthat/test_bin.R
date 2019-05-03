# check 15.3
context("Context for binomial functions")

test_that("testing bin_choose function", {
  expect_equal(bin_choose(n = 7, k = 2), 21)
  expect_length(bin_choose(n = 6, k = 3), 1)
  expect_type(bin_choose(n = 5, k = 1), "double")
})

test_that("testing bin_probability function", {
  expect_equal(bin_probability(success = 2, trials = 3, prob = 0.4), 0.288)
  expect_length(bin_probability(success = 5, trials = 8, prob = 0.6), 1)
  expect_type(bin_probability(success = 2, trials = 4, prob = 0.8), "double")
})

test_that("testing bin_distribution function", {
  expect_length(bin_distribution(trials = 4, prob = 0.4), 2)
  expect_type(bin_distribution(trials = 3, prob = 0.3), 'list')
  expect_is(bin_distribution(trials = 2, prob = 0.2), c('bindis', 'data.frame'))
})

test_that("testing bin_cumulative function", {
  expect_length(bin_cumulative(trials = 4, prob = 0.4), 3)
  expect_type(bin_distribution(trials = 3, prob = 0.3), 'list')
  expect_is(bin_distribution(trials = 10, prob = 0.5), c('bincum', 'data.frame'))
})
