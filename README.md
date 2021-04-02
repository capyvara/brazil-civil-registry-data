# Brazil Civil Registry Data
Raw scrapings of https://transparencia.registrocivil.org.br/

The idea is that if we minimize the number of people scraping their website, everyone will benefit, so this repo will try to keep fine grained data as possible. Due to the design of their website extracting detailed information may be costly.

If you feel any data you need is missing, please open an issue here.

**Notice:** 
This repo is just a copy of the data available at the site and isn't responsible for it, please read their documentation.

Also, the site scrapping is a continuous, incremental and lengthy process, and may introduce additional errors in the data, beware of that when analyzing it.

## Tables

### civil_registry_deaths.csv
Scrap of all-cause death registries at https://transparencia.registrocivil.org.br/registros

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
Scrap of natural-cause deaths at https://transparencia.registrocivil.org.br/especial-covid (from Causas Cardiacas)

**Notice** : The name covid comes from their panel, actually the table contains many natural causes, not only covid deaths.

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
| deaths_sars | integer | Number of SARS deaths (SRAG) |
| deaths_pneumonia | integer | Number of pneumonia deaths (PNEUMONIA) |
| deaths_respiratory_failure | integer | Number of respiratory failure deaths (INSUFICIENCIA_RESPIRATORIA) |
| deaths_septicemia | integer | Number of septicemia deaths (SEPTICEMIA) |
| deaths_indeterminate | integer | Number of indeterminate deaths (INDETERMINADA) |
| deaths_others | integer | Number of others deaths (OUTRAS) |
| deaths_covid19 | integer | Number of COVID-19 only deaths (COVID) |
| deaths_stroke | integer | Number of stroke deaths (AVC) |
| deaths_stroke_covid19 | integer | Number of stroke deaths with COVID-19 (COVID_AVC) |
| deaths_cardiopathy | integer | Number of cardiopathy deaths (CARDIOPATIA) |
| deaths_cardiogenic_shock | integer | Number of cardiogenic shock deaths (CHOQUE_CARD) |
| deaths_heart_attack | integer | Number of heart attack deaths (INFARTO) |
| deaths_heart_attack_covid19 | integer | Number of heart attack deaths with COVID-19 (COVID_INFARTO) |
| deaths_sudden_cardiac | integer | Number of sudden cardiac arrest deaths (SUBITA) |
| created_at | datetime | yyyy-mm-dd hh:mm<br>approximated time the data was produced according to the server |

**Notice:** 
On the site, there are some displayed aggregations:

| Name | Aggregation |
| --- | --- |
| COVID-19 | deaths_covid19 + deaths_stroke_covid19 + deaths_heart_attack_covid19 |
| Demais óbitos cardiovasculares | deaths_cardiopathy + deaths_cardiogenic_shock + deaths_sudden_cardiac |

#### civil_registry_covid_states.csv
Table (no gender nor age group) for all the 27 brazilian states, since 2018

#### civil_registry_covid_cities.csv
Table (no gender nor age group) for brazilian cities over 100,000 population and capitals (about 317), since 2018

#### civil_registry_covid_states_detailed.csv
Table (with gender and age group) for all the 27 brazilian states, since 2019

#### civil_registry_covid_cities_detailed.csv
Table (with gender and age group) for brazilian cities over 500,000 population and capitals (about 56), since 2019

## Changelog
### 2021-01-16
Now includes year 2021, note that due to 2020 being a leap year, on years 2019 and 2021 detailed scraps of 29-Feb actually uses the data from 28-Feb.

### 2020-06-26
Added cardiac causes, 7 more columns, from deaths_stroke to deaths_sudden_cardiac, as committed at [cd7a6b3](https://github.com/capyvara/brazil-civil-registry-data/commit/cd7a6b335398ea6b3ebf6beb45249fd1ee179b5d)

**Notice**: COVID-19 deaths are now split in three columns (deaths_covid19, deaths_stroke_covid19, deaths_heart_attack_covid19), see table above.

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


