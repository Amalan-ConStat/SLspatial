test_that("SLAdminDivisions has the expected structure", {
  expect_s3_class(SLAdminDivisions, "sf")
  expect_equal(nrow(SLAdminDivisions), 323L)
  expect_named(
    SLAdminDivisions,
    c("DistCode", "District", "EDistrict",
      "DivCode", "Division", "geometry")
  )
})

test_that("Administrative division identifiers are complete", {
  expect_false(anyNA(SLAdminDivisions$DistCode))
  expect_false(anyNA(SLAdminDivisions$District))
  expect_false(anyNA(SLAdminDivisions$EDistrict))
  expect_false(anyNA(SLAdminDivisions$DivCode))
  expect_false(anyNA(SLAdminDivisions$Division))

  expect_equal(dplyr::n_distinct(SLAdminDivisions$DivCode), 323L)
  expect_equal(dplyr::n_distinct(SLAdminDivisions$District), 25L)
  expect_equal(dplyr::n_distinct(SLAdminDivisions$EDistrict), 22L)
})

test_that("Administrative and electoral district names are consistent", {
  expect_setequal(
    unique(SLAdminDivisions$EDistrict),
    SLElectoralDistricts$District
  )

  expect_setequal(
    unique(SLAdminDivisions$District),
    SLAdministrativeDistricts$SourceName
  )
})

test_that("Administrative divisions have valid district relationships", {
  mapping <- sf::st_drop_geometry(SLAdminDivisions) |>
    dplyr::distinct(District, EDistrict)

  expect_equal(nrow(mapping), 25L)

  expect_true(all(
    dplyr::count(mapping, District)$n == 1L
  ))
})

test_that("Administrative division geometries are present", {
  expect_false(any(sf::st_is_empty(SLAdminDivisions)))
  expect_false(is.na(sf::st_crs(SLAdminDivisions)))
})
