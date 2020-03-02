
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/catchpole.svg?branch=master)](https://travis-ci.org/hrbrmstr/catchpole)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.4.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# catchpole

2020 Democrat POTUS Delegate Map Tracker

## Description

Tools to build a 2020 (D) delegate cartogram

## CREDIT

The hard work was done by WSJ’s Brian McGill
(\[@brian\_mcgill\](<https://twitter.com/brian_mcgill/>)) who **manually
crafted** the base cartogram over **days** then translated that into the
beautiful and illuminating creation that is the WSJ online delegate
tracker:
<https://www.wsj.com/graphics/elections/2020/track-the-delegate-count/>.

Brians’s tweetnouncement:
<https://twitter.com/brian_mcgill/status/1222556373864648704?ref_src=twsrc%5Etfw>

## What’s Inside The Tin

The following functions are implemented:

  - `delegates_map`: Retrieves the delegates basemap
  - `delegates_pal`: WSJ palette for the candidates likely getting
    delegates
  - `expand_candidates`: Expand the state totals per delegate into an
    indexed data frame
  - `gg_catchpole`: Plot a U.S. Democratic Delegates Cartogram (2020)
  - `read_delegates`: Retrieves current U.S. State delegate assignments
    for 2020 from the WSJ

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/catchpole.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/catchpole")
# or
remotes::install_gitlab("hrbrmstr/catchpole")
# or
remotes::install_bitbucket("hrbrmstr/catchpole")
# or
remotes::install_github("hrbrmstr/catchpole")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(catchpole)

# current version
packageVersion("catchpole")
## [1] '0.1.1'
```

``` r
library(sf)
library(catchpole) # hrbrmstr/catchpole
library(hrbrthemes)
library(tidyverse)

gg_catchpole() +
  theme_ft_rc(grid="") +
  theme(legend.position = "bottom")
```

<img src="man/figures/README-u-1-1.png" width="1300" />

## catchpole Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        8 | 0.89 |  78 | 0.84 |          28 | 0.58 |       44 | 0.57 |
| Rmd  |        1 | 0.11 |  15 | 0.16 |          20 | 0.42 |       33 | 0.43 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
