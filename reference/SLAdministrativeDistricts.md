# Sri Lanka Administrative District Boundaries

Administrative district boundaries for Sri Lanka, with district labels
aligned with the naming convention used in the election datasets.

## Usage

``` r
data(SLAdministrativeDistricts)
```

## Format

An sf data frame with 25 features and four columns.

- SourceID:

  Administrative district identifier from the source boundary dataset.
  This is not an electoral district number.

- SourceName:

  Original administrative district name from the source boundary
  dataset.

- District:

  District name aligned with the election datasets. Capitalisation is
  preserved.

- geometry:

  Administrative district polygon geometry. The coordinate reference
  system is retained from the source dataset.

## Details

The layer contains 25 administrative districts. Original identifiers and
names are retained in SourceID and SourceName.

In District, Ampara is labelled Digamadulla, Kandy is labelled
Mahanuwara, Moneragala is labelled Monaragala, and Nuwara Eliya is
labelled Nuwara-Eliya. These are label changes; the administrative
geometries are unchanged.

Administrative districts differ from electoral districts. Jaffna and
Kilinochchi are separate administrative districts. Mannar, Mullaitivu,
and Vavuniya are also retained separately.

This layer represents the boundaries supplied by the source dataset. It
should not automatically be interpreted as the boundary configuration
applicable to every historical election.

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  data(SLAdministrativeDistricts)
  sf::st_drop_geometry(SLAdministrativeDistricts)
  plot(sf::st_geometry(SLAdministrativeDistricts),
       main = "Sri Lanka: Administrative Districts")
}

```
