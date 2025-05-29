#!/bin/bash
# run_dbt.sh
export $(cat .env | xargs)
dbt run
