-- ADD YOUR SQL QUERY HERE
SELECT 
    iv.investor_id,
    s.sector_name,
    ROUND((iv.no_of_shares * 100.0 / totals.total_shares), 2) AS share_percentage
FROM investor_transactions iv
JOIN (
    SELECT investor_id, SUM(no_of_shares) AS total_shares
    FROM investor_transactions
    GROUP BY investor_id
) totals 
    ON iv.investor_id = totals.investor_id
JOIN sectors s 
    ON iv.sector_id = s.sector_id
ORDER BY 
    iv.investor_id,
    share_percentage DESC;
