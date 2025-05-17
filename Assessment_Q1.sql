-- Assessment_Q1.sql
-- Find customers with at least one funded savings plan AND one funded investment plan
SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    COUNT(DISTINCT CASE WHEN s.id IS NOT NULL THEN s.id END) AS savings_count,
    COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 THEN p.id END) AS investment_count,
    SUM(s.confirmed_amount / 100.0) AS total_deposits  -- Convert from kobo to Naira
FROM 
    users_customuser u
LEFT JOIN 
    savings_savingsaccount s ON u.id = s.owner_id AND s.confirmed_amount > 0
LEFT JOIN 
    plans_plan p ON u.id = p.owner_id AND p.is_a_fund = 1
GROUP BY 
    u.id, u.first_name, u.last_name
HAVING 
    COUNT(DISTINCT CASE WHEN s.id IS NOT NULL THEN s.id END) > 0
    AND COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 THEN p.id END) > 0
ORDER BY 
    total_deposits DESC;