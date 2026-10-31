test_that("SLAdministrativeDistricts has the expected structure", {
  expect_s3_class(SLAdministrativeDistricts, "sf")
  expect_equal(nrow(SLAdministrativeDistricts), 25L)
  expect_named(
    SLAdministrativeDistricts,
    c("SourceID", "SourceName", "District", "geometry")
  )

  expect_equal(dplyr::n_distinct(SLAdministrativeDistricts$District), 25L)
  expect_false(anyNA(SLAdministrativeDistricts$District))
  expect_false(anyNA(SLAdministrativeDistricts$SourceName))
  expect_false(anyDuplicated(SLAdministrativeDistricts$District) > 0)
})

test_that("Administrative district labels follow the documented mapping", {
  labels <- sf::st_drop_geometry(SLAdministrativeDistricts)

  expected <- c(
    Ampara = "Digamadulla",
    Kandy = "Mahanuwara",
    Moneragala = "Monaragala",
    "Nuwara Eliya" = "Nuwara-Eliya"
  )

  for (source_name in names(expected)) {
    actual <- labels$District[labels$SourceName == source_name]

    expect_length(actual, 1L)
    expect_equal(actual, unname(expected[[source_name]]))
  }
})

test_that("Administrative district geometries are present", {
  expect_false(any(sf::st_is_empty(SLAdministrativeDistricts)))
  expect_false(is.na(sf::st_crs(SLAdministrativeDistricts)))
})
