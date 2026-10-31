#' Sri Lanka Country Boundary
#'
#' Country boundary polygons for Sri Lanka, without internal
#' administrative or electoral divisions.
#'
#' @docType data
#' @name SLBoundary
#' @usage data(SLBoundary)
#'
#' @format An sf data frame with one feature and four columns.
#' \describe{
#' \item{Country}{Country name: Sri Lanka.}
#' \item{ISO2}{Two-letter country code: LK.}
#' \item{ISO3}{Three-letter country code: LKA.}
#' \item{geometry}{MULTIPOLYGON geometry in WGS84 (EPSG:4326).}
#' }
#'
#' @examples
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   data(SLBoundary)
#'   plot(sf::st_geometry(SLBoundary), main = "Sri Lanka")
#' }
#'
#'
"SLBoundary"

#' Sri Lanka Administrative District Boundaries
#'
#' Administrative district boundaries for Sri Lanka, with district
#' labels aligned with the naming convention used in the election datasets.
#'
#' @docType data
#' @name SLAdministrativeDistricts
#' @usage data(SLAdministrativeDistricts)
#'
#' @format An sf data frame with 25 features and four columns.
#' \describe{
#' \item{SourceID}{Administrative district identifier from the source
#' boundary dataset. This is not an electoral district number.}
#' \item{SourceName}{Original administrative district name from the
#' source boundary dataset.}
#' \item{District}{District name aligned with the election datasets.
#' Capitalisation is preserved.}
#' \item{geometry}{Administrative district polygon geometry.
#' The coordinate reference system is retained from the source dataset.}
#' }
#'
#' @details
#' The layer contains 25 administrative districts.
#' Original identifiers and names are retained in SourceID and SourceName.
#'
#' In District, Ampara is labelled Digamadulla, Kandy is labelled
#' Mahanuwara, Moneragala is labelled Monaragala, and Nuwara Eliya
#' is labelled Nuwara-Eliya.
#' These are label changes; the administrative geometries are unchanged.
#'
#' Administrative districts differ from electoral districts.
#' Jaffna and Kilinochchi are separate administrative districts.
#' Mannar, Mullaitivu, and Vavuniya are also retained separately.
#'
#' This layer represents the boundaries supplied by the source dataset.
#' It should not automatically be interpreted as the boundary configuration
#' applicable to every historical election.
#'
#' @examples
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   data(SLAdministrativeDistricts)
#'   sf::st_drop_geometry(SLAdministrativeDistricts)
#'   plot(sf::st_geometry(SLAdministrativeDistricts),
#'        main = "Sri Lanka: Administrative Districts")
#' }
#'
"SLAdministrativeDistricts"


#' Sri Lanka Electoral District Boundaries
#'
#' Electoral district boundaries derived from administrative district
#' polygons, with names aligned with the election datasets.
#'
#' @docType data
#' @name SLElectoralDistricts
#' @usage data(SLElectoralDistricts)
#'
#' @format An sf data frame with 22 features and two columns.
#' \describe{
#' \item{District}{Electoral district name matching the naming convention
#' used in the election datasets. Capitalisation is preserved.}
#' \item{geometry}{Electoral district polygon geometry derived by
#' merging administrative district polygons. The coordinate reference
#' system is retained from the source dataset.}
#' }
#'
#' @details
#' The layer is derived from SLAdministrativeDistricts.
#' Jaffna and Kilinochchi are merged to form the Jaffna electoral district.
#' Mannar, Mullaitivu, and Vavuniya are merged to form the Vanni
#' electoral district. The remaining districts retain their administrative
#' boundaries.
#'
#' Internal boundaries between merged administrative districts are removed.
#' The resulting features are ordered to match the electoral district
#' order used during data preparation.
#'
#' This is a derived spatial layer, rather than an independently supplied
#' official electoral-boundary dataset. Its historical applicability
#' depends on the version of the underlying administrative boundaries.
#'
#' District can be used to join district-level election results.
#' Select one reporting level before joining to avoid repeating geometries
#' across polling-division, postal-vote, and district-total records.
#'
#' @source
#' Derived from the administrative boundary dataset used for
#' SLAdministrativeDistricts.
#'
#' @seealso \code{\link{SLAdministrativeDistricts}},
#'   \code{\link{SLBoundary}}
#'
#' @examples
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   data(SLElectoralDistricts)
#'   sf::st_drop_geometry(SLElectoralDistricts)
#'   plot(sf::st_geometry(SLElectoralDistricts),
#'        main = "Sri Lanka: Electoral Districts")
#' }
#'
"SLElectoralDistricts"


#' Sri Lanka Electorate Boundaries
#'
#' Spatial polygon boundaries for the 160 electorates (polling divisions)
#' across the 22 electoral districts of Sri Lanka.
#'
#' Electorates names have been standardised using
#' the 2024 Sri Lankan presidential election dataset.
#' The original names from the spatial source are retained.
#'
#' @format An sf object with 160 rows and 5 columns:
#' \describe{
#'   \item{ElecCode}{Electoral electorate code.}
#'   \item{District}{Electoral district name.}
#'   \item{Electorate}{Standardised electorate (polling division) name.}
#'   \item{OrigName}{Original name in the spatial dataset.}
#'   \item{geometry}{Spatial polygon geometry.}
#' }
#'
#' @source
#' \url{https://github.com/nuuuwan/sl-topojson}
#'
#'
"SLElectorate"


#' Sri Lanka Administrative Division Boundaries
#'
#' Spatial polygon boundaries for 323 administrative divisions
#' across the 25 administrative districts and 22 electoral districts of Sri Lanka.
#'
#' Administrative district and division names are retained from
#' the original spatial data source. Electoral district names
#' have been assigned to correspond with the 22 electoral
#' districts in the 2024 Sri Lankan presidential election dataset.
#'
#' @format An sf object with 323 rows and 6 columns:
#' \describe{
#'   \item{DistCode}{Administrative district code.}
#'   \item{District}{Administrative district name.}
#'   \item{EDistrict}{Corresponding electoral district name.}
#'   \item{DivCode}{Administrative division code.}
#'   \item{Division}{Administrative division name.}
#'   \item{geometry}{Spatial polygon geometry.}
#' }
#'
#' @source
#' GADM administrative boundary data.
#' \url{https://gadm.org/}
#'
#'
"SLAdminDivisions"

