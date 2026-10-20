#!/bin/bash
# @vicinae.schemaVersion 1
# @vicinae.title Snowflake DNS: Prod
# @vicinae.mode fullOutput
# @vicinae.description Route privatelink.snowflakecomputing.com lookups via Data_Platform_P
# @vicinae.icon ❄️
# @vicinae.keywords ["snowflake", "dns", "vpn", "resolvectl"]

exec "$HOME/.local/bin/snowflake-dns-prod"
