test_that("SLElectorate has the expected structure", {
  expect_s3_class(SLElectorate, "sf")
  expect_equal(nrow(SLElectorate), 160L)
  expect_named(
    SLElectorate,
    c("ElecCode", "District", "Electorate", "OrigName", "geometry")
  )
})

test_that("Electorate identifiers are complete and unique", {
  expect_false(anyNA(SLElectorate$ElecCode))
  expect_false(anyNA(SLElectorate$District))
  expect_false(anyNA(SLElectorate$Electorate))
  expect_false(anyNA(SLElectorate$OrigName))

  expect_equal(dplyr::n_distinct(SLElectorate$ElecCode), 160L)
  expect_true(all(grepl("^EC-[0-9]{2}[A-Z]+$", SLElectorate$ElecCode)))

  expect_equal(
    nrow(dplyr::distinct(
      sf::st_drop_geometry(SLElectorate),
      District, Electorate
    )),
    160L
  )
})

test_that("Electorates correspond to 22 electoral districts", {
  expect_equal(dplyr::n_distinct(SLElectorate$District), 22L)

  expect_setequal(
    unique(SLElectorate$District),
    SLElectoralDistricts$District
  )
})

test_that("Electorate geometries are present", {
  expect_false(any(sf::st_is_empty(SLElectorate)))
  expect_false(is.na(sf::st_crs(SLElectorate)))
})
