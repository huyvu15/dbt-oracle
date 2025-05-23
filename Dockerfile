FROM fivetran/dbt:1.7.4

# Install các adapter bổ sung
RUN pip install --no-cache-dir \
    dbt-athena-community==1.7.4 \
    dbt-oracle==1.7.4 \
    dbt-postgres==1.7.4
