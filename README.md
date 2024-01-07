# Portal Forecast Website

[![App build](https://github.com/weecology/portal-forecast-web/actions/workflows/app_build.yaml/badge.svg)](https://github.com/weecology/portal-forecast-web/actions/workflows/app_build.yaml)
[![Lifecycle:maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![License](http://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/weecology/portalPredictions/master/LICENSE)
[![NSF-1929730](https://img.shields.io/badge/NSF-1929730-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1929730)

This source code builds the [website](https://portal.naturecast.org/) for the [automated forecasting](https://github.com/weecology/portalPredictions) of [desert rodent populations](https://portal.weecology.org/).

## Setup and Developer Notes

### Depends on:

R, portalr, portaldata, portalcasting, and shiny.

Portalcasting is primarily reliant on `portalr` and `portaldata`. It generates additional files for the website by utilizing the `update_production` function to configure the necessary data and files. Check the [full_build_script.R](https://github.com/weecology/portal-forecast-web/blob/main/full_build_script.R) for sample commands.

### Server Notes

- The website is running on the serenity server.
- Shiny server configurations are in `/etc/shiny-server/shiny-server.conf`.
- Shiny server logs: `/var/log/shiny-server`.
- Nginx config file: `/etc/nginx/conf.d/application.conf`.

Refer to [issue #7](https://github.com/weecology/portal-forecast-web/issues/7) for ongoing notes on server setup.

## Acknowledgements

This project is developed in active collaboration with [DAPPER Stats](https://www.dapperstats.com/).

The motivating study—the Portal Project—has been funded nearly continuously since 1977 by the [National Science Foundation](http://nsf.gov/), most recently by [DEB-1622425](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1622425) to S. K. M. Ernest. Much of the computational work was supported by the [Gordon and Betty Moore Foundation’s Data-Driven Discovery Initiative](http://www.moore.org/programs/science/data-driven-discovery) through [Grant GBMF4563](http://www.moore.org/grants/list/GBMF4563) to E. P. White.

We thank James Brown for establishing the Portal Project and all the researchers who have collaborated on over 40 years of science.