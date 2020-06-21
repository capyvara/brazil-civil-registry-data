# Brazil Civil Registry Data
Raw scrapings of https://transparencia.registrocivil.org.br/

The idea is that if we minimize the number of people scraping their website, everyone will benefit, so this repo will try to keep fine grained data as possible. Due to the design of their website extracting detailed information may be costly.

If you feel any data you need is missing, please open an issue here.

**Notice:** 
This repo is just a copy of the data available at the site and isn't responsible for it, please read their documentation.

Also, the site scrapping is a continuous, incremental and lengthy process, and may introduce additional errors in the data, beware of that when analyzing it.

## Tables

### civil_registry_deaths.csv
Scrap of death registries at https://transparencia.registrocivil.org.br/registros

Monthly entries, contains all the cities and states, from 2015 to 2020

| name | type | notes |
|-----------------|---------|-----------------------------------------------------|
| start_date | date | yyyy-mm-dd |
| end_date | date | yyyy-mm-dd |
| state | string | UF code |
| state_ibge_code | integer | state ibge code |
| city | string | city name, if empty then deaths_total are state-wise |
| city_ibge_code | integer | city ibge code, if empty then deaths_total are state-wise |
| deaths_total | integer | total death registries at date |
| created_at | datetime | yyyy-mm-dd hh:mm<br>approximated time the request to the server was made |

### civil_registry_covid_xxxxx.csv
Scrap of covid-related deaths at https://transparencia.registrocivil.org.br/registral-covid

Daily entries, there are multiple sub-types, see below.

| name | type | notes |
|-----------------|---------|-----------------------------------------------------|
| date | date | yyyy-mm-dd |
| state | string | UF code |
| state_ibge_code | integer | state ibge code |
| city | string | [optional] city name |
| city_ibge_code | integer | [optional] city ibge code |
| places | string | [optional] place(s) where the deaths occurred, comma separated<br>(hospital, home, public, others) |
| gender | string | [optional] F, M |
| age_group | string | [optional] age group <br>(9-, 10-19, 20-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80-89, 90-99, 100+, NA) |
| deaths_sars | string | Number of SARS deaths |
| deaths_pneumonia | string | Number of pneumonia deaths |
| deaths_respiratory_failure | string | Number of respiratory failure deaths |
| deaths_septicemia | string | Number of septicemia deaths |
| deaths_indeterminate | string | Number of indeterminate deaths |
| deaths_others | string | Number of others deaths |
| deaths_covid19 | string | Number of covid-19 deaths |
| created_at | datetime | yyyy-mm-dd hh:mm<br>approximated time the data was produced according to the server |

#### civil_registry_covid_states.csv
Partial table for all the 27 brazilian states (no gender or age group), from 2018 to 2020

#### civil_registry_covid_cities.csv
Partial table for all the brazilian cities over 100,000 population (2019), about 287 (no gender or age group), from 2018 to 2020

#### civil_registry_covid_states_detailed.csv
Full table for all the 27 brazilian states, 2019 and 2020

#### civil_registry_covid_cities_detailed.csv
Full table for all the brazilian cities over 500,000 population (2019), about 47, 2019 and 2020

## Changelog
### 2020-06-21
Fixes [#4](https://github.com/capyvara/brazil-civil-registry-data/issues/4) by adding capital cities to detailed, as commited at [fbef16](https://github.com/capyvara/brazil-civil-registry-data/commit/fbef16088e8ca5116ed60b61cf5f498e8e7e0803)

### 2020-06-13
In order to fix [#3](https://github.com/capyvara/brazil-civil-registry-data/issues/3), the city of "Brasilia" (ibge_code=5300108) now contains the data for the whole state "DF" (ibge_code =53), as committed at [a043e3d3](https://github.com/capyvara/brazil-civil-registry-data/commit/a043e3d32b3f3111a72712cf0243fcc9786d858d) 

## IBGE codes
https://www.ibge.gov.br/explica/codigos-dos-municipios.php

## Licensing
[Creative Commons Attribution ShareAlike](https://creativecommons.org/licenses/by-sa/4.0/)

Please mention the original source and this repo.

## More information, special thanks
- [Brasil.IO](https://brasil.io): 
    - https://brasil.io/dataset/covid19/obito_cartorio/
    - There you can find the equivalent of the civil_registry_covid_states.csv (except no death places) in a easier to digest format
    - Here you can contribute to it: https://github.com/turicas/covid19-br
    - There are plans to bring all the data on this repo to it in a near future

- Portal da Transparência do Registro Civil: https://transparencia.registrocivil.org.br/

- Scrapping code is currently kept on a private repo to prevent abuse, but if you are a researcher and want access or more information, contact me at https://twitter.com/capyvara


