with recursive
    test_data_provider (p, n) as
    (
        select 2, 27  union all
        select 5, 100 union all
        select 2, 128 union all
        select 3, 50
    ),

    iterator (test_p, test_n, next) as
    (
        select p, n, 1
        from test_data_provider

        union all

        select test_p, test_n, next + 1
        from iterator 
        where power(test_p, next + 1) <= test_n
    )
select
    test_p as P,
    test_n as N,
    sum(floor(test_n / power(test_p, next))) as Legendre
from iterator
group by test_p, test_n;
