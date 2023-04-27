datadir="/var/lib/proxysql"

admin_variables=
{
    admin_credentials="${ADMIN_CREDENTIALS}"
    mysql_ifaces="${MYSQL_IFACES}"
}

mysql_variables=
{
    threads=${MYSQL_THREADS}
    max_connections=${MYSQL_MAX_CONNECTIONS}
    default_query_delay=${MYSQL_DEFAULT_QUERY_DELAY}
    default_query_timeout=${MYSQL_DEFAULT_QUERY_TIMEOUT}
    have_ssl=${MYSQL_HAVE_SSL}
    ssl_p2s_ca="${SSL_P2S_CA}"
    ssl_p2s_cert="${SSL_P2S_CERT}"
    ssl_p2s_key="${SSL_P2S_KEY}"
}

proxysql_variables=
{
    threads=${PROXYSQL_THREADS}
    interfaces="${PROXYSQL_INTERFACES}"
    default_query_delay=${PROXYSQL_DEFAULT_QUERY_DELAY}
    default_query_timeout=${PROXYSQL_DEFAULT_QUERY_TIMEOUT}
    have_ssl=${PROXYSQL_HAVE_SSL}
    ssl_cert="${SSL_CERT}"
    ssl_key="${SSL_KEY}"
    ssl_ca="${SSL_CA}"
}

mysql_servers =
{
    {
        address="${MYSQL_SERVER_ADDRESS}"
        port=${MYSQL_SERVER_PORT}
        hostgroup=${MYSQL_SERVER_HOSTGROUP}
        max_connections=${MYSQL_SERVER_MAX_CONNECTIONS}
    },
}

mysql_users =
{
    {
        username="${MYSQL_USER_USERNAME}"
        password="${MYSQL_USER_PASSWORD}"
        default_hostgroup=${MYSQL_USER_DEFAULT_HOSTGROUP}
    },
}

mysql_query_rules_table = mysql_query_rules
mysql_query_rules =
{
    {
        rule_id=${QUERY_RULE1_ID}
        active=${QUERY_RULE1_ACTIVE}
        match_pattern="${QUERY_RULE1_MATCH_PATTERN}"
        destination_hostgroup=${QUERY_RULE1_DESTINATION_HOSTGROUP}
        apply=${QUERY_RULE1_APPLY}
    },
    {
        rule_id=${QUERY_RULE2_ID}
        active=${QUERY_RULE2_ACTIVE}
        match_pattern="${QUERY_RULE2_MATCH_PATTERN}"
        destination_hostgroup=${QUERY_RULE2_DESTINATION_HOSTGROUP}
        apply=${QUERY_RULE2_APPLY}
    },
}

scheduler =
{
    threads = ${SCHEDULER_THREADS}
    scheduler =
    (
        {
            id = ${SCHEDULER_ID}
            filename = "${SCHEDULER_FILENAME}"
            arg1 = "${SCHEDULER_ARG1}"
            arg2 = "${SCHEDULER_ARG2}"
            arg3 = "${SCHEDULER_ARG3}"
            arg4 = "${SCHEDULER_ARG4}"
            arg5 = "${SCHEDULER_ARG5}"
            arg6 = "${SCHEDULER_ARG6}"
            arg7 = "${SCHEDULER_ARG7}"
            arg8 = "${SCHEDULER_ARG8}"
            arg9 = "${SCHEDULER_ARG9}"
        }
    )
}
