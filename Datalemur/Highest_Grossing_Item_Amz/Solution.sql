WITH tab_prod_ranked AS
(SELECT category,
        product,
        SUM(spend) total_spend,
        RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) rk_categrory
        FROM product_spend
        WHERE EXTRACT(YEAR FROM transaction_date) = 2022
        GROUP BY category,product
  )
Select category,
        product,
        total_spend
        from tab_prod_ranked
        where rk_categrory <= 2
        ORDER BY category,rk_categrory
