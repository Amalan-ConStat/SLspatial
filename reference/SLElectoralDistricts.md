# Sri Lanka Electoral District Boundaries

Electoral district boundaries derived from administrative district
polygons, with names aligned with the election datasets.

## Usage

``` r
data(SLElectoralDistricts)
```

## Format

An sf data frame with 22 features and two columns.

- District:

  Electoral district name matching the naming convention used in the
  election datasets. Capitalisation is preserved.

- geometry:

  Electoral district polygon geometry derived by merging administrative
  district polygons. The coordinate reference system is retained from
  the source dataset.

## Source

Derived from the administrative boundary dataset used for
SLAdministrativeDistricts.

## Details

The layer is derived from SLAdministrativeDistricts. Jaffna and
Kilinochchi are merged to form the Jaffna electoral district. Mannar,
Mullaitivu, and Vavuniya are merged to form the Vanni electoral
district. The remaining districts retain their administrative
boundaries.

Internal boundaries between merged administrative districts are removed.
The resulting features are ordered to match the electoral district order
used during data preparation.

This is a derived spatial layer, rather than an independently supplied
official electoral-boundary dataset. Its historical applicability
depends on the version of the underlying administrative boundaries.

District can be used to join district-level election results. Select one
reporting level before joining to avoid repeating geometries across
polling-division, postal-vote, and district-total records.

## See also

[`SLAdministrativeDistricts`](https://amalan-constat.github.io/SLspatial/reference/SLAdministrativeDistricts.md),
[`SLBoundary`](https://amalan-constat.github.io/SLspatial/reference/SLBoundary.md)

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  data(SLElectoralDistricts)
  sf::st_drop_geometry(SLElectoralDistricts)
  plot(sf::st_geometry(SLElectoralDistricts),
       main = "Sri Lanka: Electoral Districts")
}

```
