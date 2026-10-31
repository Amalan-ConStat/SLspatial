# Sri Lanka Country Boundary

Country boundary polygons for Sri Lanka, without internal administrative
or electoral divisions.

## Usage

``` r
data(SLBoundary)
```

## Format

An sf data frame with one feature and four columns.

- Country:

  Country name: Sri Lanka.

- ISO2:

  Two-letter country code: LK.

- ISO3:

  Three-letter country code: LKA.

- geometry:

  MULTIPOLYGON geometry in WGS84 (EPSG:4326).

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  data(SLBoundary)
  plot(sf::st_geometry(SLBoundary), main = "Sri Lanka")
}


```
