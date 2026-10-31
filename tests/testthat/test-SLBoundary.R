test_that("SLBoundary has the expected structure", {
  expect_s3_class(SLBoundary, "sf")
  expect_equal(nrow(SLBoundary), 1L)
  expect_named(
    SLBoundary,
    c("Country", "ISO2", "ISO3", "geometry")
  )

  expect_equal(SLBoundary$Country, "Sri Lanka")
  expect_equal(SLBoundary$ISO2, "LK")
  expect_equal(SLBoundary$ISO3, "LKA")
})

test_that("SLBoundary has valid spatial geometry", {
  expect_equal(sf::st_crs(SLBoundary)$epsg, 4326)
  expect_true(all(sf::st_is_valid(SLBoundary)))
  expect_false(any(sf::st_is_empty(SLBoundary)))
  expect_true(all(as.character(sf::st_geometry_type(SLBoundary)) ==
                    "MULTIPOLYGON"))
})
