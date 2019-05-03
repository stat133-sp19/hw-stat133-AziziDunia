context("Context for private checker funtions")

test_that("testing check_prob function", {
  expect_length(check_prob(0.5), 1)
  expect_true(check_prob(0), TRUE)
  expect_true(check_prob(0.5), TRUE)
  expect_error(check_prob(-0.5),'p has to be a number between 0 and 1')
  expect_type(check_prob(0.1), 'logical')
})

test_that("testing check_trials function", {
  expect_true(check_trials(1), TRUE)
  expect_true(check_trials(100), TRUE)
  expect_type(check_trials(1), 'logical')
  expect_error(check_trials(-1))
})

test_that("testing check_success function", {
  expect_length(check_success(2,5),1)
  expect_true(check_success(2,4), TRUE)
  expect_error(check_success(2, 1))
})
