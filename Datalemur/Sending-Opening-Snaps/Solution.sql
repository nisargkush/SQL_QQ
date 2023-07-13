SELECT age_bucket,
ROUND(SUM(CASE WHEN activity_type='send' THEN time_spent ELSE 0 END)/SUM(time_spent)*100.0,2) as send_perc,
ROUND(SUM(CASE WHEN activity_type='open' THEN time_spent ELSE 0 END)/SUM(time_spent)*100.0,2) as open_perc
FROM activities JOIN age_breakdown 
ON activities.user_id = age_breakdown.user_id
where activity_type IN ('open','send')
group by age_bucket
