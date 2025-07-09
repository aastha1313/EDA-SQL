-- --------------------------EXPLORATORY DATA ANALYSIS------

select *
from layoffs_staging2 ; 

select max(total_laid_off) , max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2 
where percentage_laid_off = 1
order by funds_raised_millions desc; 

SELECT company, total_laid_off
FROM world_layoffs.layoffs_staging
ORDER BY 2 DESC
LIMIT 5;
-- now that's just on a single day


-- Companies with the most Total Layoffs
SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- checking time range of the dataset 
select min(`date`) , max(`date`)
from layoffs_staging2;

-- what industry had most layoffs 
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry;

-- indivisually by year layoffs
SELECT year(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY year(`date`)
ORDER BY 1 DESC;

-- finfing which stages have most layoffs
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
order by 2 desc ; 

SELECT company, avg(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
order by 2 desc ; 


-- ---- rolling total by cte

select substr(`date` , 1 , 7) as `month` , sum(total_laid_off)
from layoffs_staging2
where  substr(`date` , 1 , 7) is not null 
group by `month`
order by 1 asc ; 

select *
from layoffs_staging2 ; 

with Rolling_total as 
(
select substr(`date` , 1 , 7) as `month` , sum(total_laid_off) as total_off
from layoffs_staging2
where  substr(`date` , 1 , 7) is not null 
group by `month`
order by 1 asc 
)
select `month` , total_off ,
 sum(total_off) over(order by `month`) as rolling_total 
from Rolling_total ; 


-- by company 

SELECT company, year(`date`) , sum(total_laid_off)
FROM layoffs_staging2
GROUP BY company ,year(`date`)
order by 3 desc; 

with Company_Year (company , years , total_laid_off) as 
(
SELECT company, year(`date`) , sum(total_laid_off)
FROM layoffs_staging2
GROUP BY company ,year(`date`)

), company_year_rank as 
(
select  * , dense_rank() over(partition by years order by total_laid_off  desc ) as ranking 
from Company_Year
where years is not null 
)
select *
from company_year_rank
where ranking <= 5 ; 


