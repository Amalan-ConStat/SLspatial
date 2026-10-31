# Sri Lanka Administrative Division Boundaries

Spatial polygon boundaries for 323 administrative divisions across the
25 administrative districts and 22 electoral districts of Sri Lanka.

## Usage

``` r
SLAdminDivisions
```

## Format

An sf object with 323 rows and 6 columns:

- DistCode:

  Administrative district code.

- District:

  Administrative district name.

- EDistrict:

  Corresponding electoral district name.

- DivCode:

  Administrative division code.

- Division:

  Administrative division name.

- geometry:

  Spatial polygon geometry.

## Source

GADM administrative boundary data. <https://gadm.org/>

## Details

Administrative district and division names are retained from the
original spatial data source. Electoral district names have been
assigned to correspond with the 22 electoral districts in the 2024 Sri
Lankan presidential election dataset.
