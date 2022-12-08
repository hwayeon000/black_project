SELECT prog_name from t_programs;

select search_word, count(search_word)
from t_searchs
group by search_word
order by count(search_word)