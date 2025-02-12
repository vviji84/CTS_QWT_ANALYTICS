{% macro get_linenos() %}
 
{% set lineno_query %}
select distinct
lineno
from {{ ref('fct_orders') }}
order by 1
{% endset %}
 
{% set results = run_query(lineno_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}

{% endmacro %}


{% macro get_max_date() %}
{% set lineno_query %}
 
select max(orderdate)
from {{ ref('fct_orders') }}
 
{% endset %}
 
{% set results = run_query(lineno_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}


{% macro get_min_date() %}
{% set lineno_query %}
 
select min(orderdate)
from {{ ref('fct_orders') }}
 
{% endset %}
 
{% set results = run_query(lineno_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}