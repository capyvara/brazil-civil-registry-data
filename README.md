# Brazil Civil Registry Data
Scrapings of https://transparencia.registrocivil.org.br/

**NOTICE**: This repo is just a copy of the data available at the site and it's not responsible for it, please
read their documentation.

## Tables

### civid_registry_deaths.csv
Scrap of death registries at https://transparencia.registrocivil.org.br/registros

| name | type | notes |
|-----------------|---------|-----------------------------------------------------|
| date | date | yyyy-mm-dd |
| state | string | UF code |
| state_ibge_code | integer | state ibge code |
| city | string | city name, if empty then deaths_total are state-wise |
| city_ibge_code | integer | city ibge code, if empty then deaths_total are state-wise |
| deaths_total | integer | total death registries at date |

### civid_registry_covid.csv
Scrap of covid-related deaths at https://transparencia.registrocivil.org.br/registral-covid

| name | type | notes |
|-----------------|---------|-----------------------------------------------------|
| date | date | yyyy-mm-dd |
| state | string | UF code |
| state_ibge_code | integer | state ibge code |
| city | string | city name, if empty then deaths_total are state-wise |
| city_ibge_code | integer | city ibge code, if empty then deaths_total are state-wise |
| places | string | place(s) where the deaths occured, comma separated<br>(hospital, home, public, others) |
| gender | string | F, M |
| age_group | string | age group, empty mean all ages<br>(9-, 10-19, 20-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80-89, 90-99, 100+, NA) |
| deaths_sars | string | Number of SARS deaths |
| deaths_pneumonia | string | Number of pneumonia deaths |
| deaths_respiratory_failure | string | Number of respiratory failure deaths |
| deaths_septicemia | string | Number of septicemia deaths |
| deaths_indeterminate | string | Number of indeterminate deaths |
| deaths_others | string | Number of others deaths |
| deaths_covid19 | string | Number of covid-19 deaths |

## IBGE codes
https://www.ibge.gov.br/explica/codigos-dos-municipios.php

## Licensing
[Creative Commons Attribution ShareAlike](https://creativecommons.org/licenses/by-sa/4.0/)

Please mention the original source and the scrap provider.

## More information, easier data access
- Brasil.IO: https://brasil.io/dataset/covid19/


