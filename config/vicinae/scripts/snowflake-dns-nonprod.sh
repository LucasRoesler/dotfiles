#!/bin/bash
# @vicinae.schemaVersion 1
# @vicinae.title Snowflake DNS: Non-Prod
# @vicinae.mode fullOutput
# @vicinae.description Route privatelink.snowflakecomputing.com lookups via Data_Platform_N
# @vicinae.icon ❄️
# @vicinae.keywords ["snowflake", "dns", "vpn", "resolvectl"]

exec "$HOME/.local/bin/snowflake-dns-nonprod"
