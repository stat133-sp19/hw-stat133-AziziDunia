context("Context for summary measures")

test_that("testing aux_mean function", {
  expect_equal(aux_mean(5,0.2), 1)
  expect_length(aux_mean(1,0.5), 1)
  expect_type(aux_mean(2,0.2), "double")
})

test_that("testing aux_variance function", {
  expect_equal(aux_variance(5,0.2), 0.8)
  expect_length(aux_variance(5,0.4),1)
  expect_type(aux_variance(60,0.6),"double")
})

test_that("testing aux_mode function", {
  expect_equal(aux_mode(50, 0.5), 25)
  expect_length(aux_mode(4,0.4), 2)
  expect_type(aux_mode(20,0.2), "double")
})

test_that("testing aux_skewness function", {
  expect_equal(aux_skewness(10, 0.2), (1-2*0.2)/sqrt(10*0.2*(1-0.2)))
  expect_length(aux_skewness(4,0.4), 1)
  expect_type(aux_skewness(20,0.2), "double")
})

test_that("testing aux_kurtosis function", {
  expect_equal(aux_kurtosis(10, 0.2), 0.025)
  expect_length(aux_kurtosis(4,0.4), 1)
  expect_type(aux_kurtosis(20, 0.2), "double")
})
