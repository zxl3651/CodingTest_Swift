-- 코드를 입력하세요
SELECT book_id, substr(published_date, 1,10)
from book
where category = '인문' and substr(published_date, 1,4) = '2021'
order by published_date

# SELECT book_id, substr(published_date, 1, 10) from book
# where category = '인문' and substr(published_date, 1, 4) = 2021