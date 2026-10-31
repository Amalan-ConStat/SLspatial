test_that("SLElectoralDistricts has the expected structure", {
  expect_s3_class(SLElectoralDistricts, "sf")
  expect_equal(nrow(SLElectoralDistricts), 22L)
  expect_named(SLElectoralDistricts, c("District", "geometry"))

  expect_equal(dplyr::n_distinct(SLElectoralDistricts$District), 22L)
  expect_false(anyNA(SLElectoralDistricts$District))
  expect_false(anyDuplicated(SLElectoralDistricts$District) > 0)
})

test_that("Electoral districts contain the expected merged districts", {
  expect_true("Jaffna" %in% SLElectoralDistricts$District)
  expect_true("Vanni" %in% SLElectoralDistricts$District)

  expect_false(any(c("Kilinochchi", "Mannar", "Mullaitivu",
                     "Vavuniya") %in% SLElectoralDistricts$District))
})

test_that("Electoral districts are consistent with administrative districts", {
  expect_equal(
    sf::st_crs(SLElectoralDistricts),
    sf::st_crs(SLAdministrativeDistricts)
  )

  expect_setequal(
    SLElectoralDistricts$District,
    c(
      setdiff(
        SLAdministrativeDistricts$District,
        c("Kilinochchi", "Mannar", "Mullaitivu", "Vavuniya")
      ),
      "Vanni"
    )
  )
})

test_that("Electoral district geometries are present", {
  expect_false(any(sf::st_is_empty(SLElectoralDistricts)))
  expect_false(is.na(sf::st_crs(SLElectoralDistricts)))
})
