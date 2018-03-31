select t1.question_id as survey_log from
(select question_id from survey_log where answer_id IS NOT NULL) as t1
GROUP BY t1.question_id
ORDER BY count(t1.question_id) DESC
LIMIT 1;