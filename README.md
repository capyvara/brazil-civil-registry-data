# Brazil Civil Registry Data
Raw scrapings of https://transparencia.registrocivil.org.br/

The idea is that if we minimize the number of people scraping their website, everyone will benefit, so this repo will try to keep fine coarsed data as possible. Due to the design of their website extracting detailed information may be costly.

If you feel any data you need is missing, please open a issue here.

**Notice** This repo is just a copy of the data available at the site and isn't responsible for it, please read their documentation.

## Tables

### civil_registry_deaths.csv
Scrap of death registries at https://transparencia.registrocivil.org.br/registros

Daily entries, contains all the cities and states

| name | type | notes |
|-----------------|---------|-----------------------------------------------------|
| date | date | yyyy-mm-dd |
| state | string | UF code |
| state_ibge_code | integer | state ibge code |
| city | string | city name, if empty then deaths_total are state-wise |
| city_ibge_code | integer | city ibge code, if empty then deaths_total are state-wise |
| deaths_total | integer | total death registries at date |

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
| places | string | [optional] place(s) where the deaths occured, comma separated<br>(hospital, home, public, others) |
| gender | string | [optional] F, M |
| age_group | string | [optional] age group <br>(9-, 10-19, 20-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80-89, 90-99, 100+, NA) |
| deaths_sars | string | Number of SARS deaths |
| deaths_pneumonia | string | Number of pneumonia deaths |
| deaths_respiratory_failure | string | Number of respiratory failure deaths |
| deaths_septicemia | string | Number of septicemia deaths |
| deaths_indeterminate | string | Number of indeterminate deaths |
| deaths_others | string | Number of others deaths |
| deaths_covid19 | string | Number of covid-19 deaths |

#### civil_registry_covid_states.csv
Full table for all the 27 brazilian states (each place, gender and age group)

#### civil_registry_covid_top_cities.csv
Full table for all the brazilian cities over 500,000 population, about 47 (each death place, gender and age group)

#### civil_registry_covid_cities.csv
Partial table for all the brazilian cities over 100,000 population, about 287 (each death place, no gender or age group)

## IBGE codes
https://www.ibge.gov.br/explica/codigos-dos-municipios.php

## Licensing
[Creative Commons Attribution ShareAlike](https://creativecommons.org/licenses/by-sa/4.0/)

Please mention the original source and this repo.

## More information, special thanks
- Brasil.IO: https://brasil.io/dataset/covid19/
- Portal da Transparência do Registro Civil: https://transparencia.registrocivil.org.br/


