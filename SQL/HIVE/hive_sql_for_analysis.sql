①標準偏差（偏差値より母数が不特定の場合、ばらつき度合いを分かる）
elect stddev_pop((unix_timestamp(concat(concat(bd, " "), bt)) - unix_timestamp(concat(concat(ed, " "), et))) / 60)  from 
(
select enter.dt as ed, enter.time as et, enter.id as ea, back.dt as bd, 
min(back.time) as bt from 
(select * from activity where activity = 3 and dt = "2012-07-17" and content[1] like "bla..") enter join  
(select * from activity where activity = 3 and dt = "2012-07-17" and content[0] <> "bla..") back on enter.id = back.id where enter.time < back.time group by enter.dt, enter.time, enter.id, back.dt) res

分析例、平均滞在時間（30分）は全体の57%になる。

②各ユーザごの滞在時間の平均値、重複合算（1ユーザのエリア内を出入り時間の合計）
select sum(unix_timestamp(concat(concat(bd, " "), bt)) - unix_timestamp(concat(concat(ed, " "), et))) / count(ea) / 60  from 
(
select enter.dt as ed, enter.time as et, enter.id as ea, back.dt as bd, 
min(back.time) as bt from 
(select * from activity where activity = 3 and dt = "2012-07-17" and content[1] like "bla..%") enter join  
(select * from activity where activity = 3 and dt = "2012-07-17" and content[0] <> "bla..") back on enter.id = back.id where enter.time < back.time group by enter.dt, enter.time, enter.id, back.dt) res


Hueで滞在時間を計算するSQL
滞在している間のMAX時間を算出できますが、
ただし、現状ブラウザを閉じるイベントを検出できないため、下記2点の誤差に留意し、参考用としてお使いください。
・エリア間の移動（入室）時間の差分であること。
・滞在時間が極端に長い場合は放置かブラウザを閉じ、再ログインした可能性がある。

例、7月17日、あるエリアの平均滞在時間（分）

select sum(big_pot.big_one) / count(big_pot.ea) / 60 from (
select max(unix_timestamp(concat(concat(bd, " "), bt)) - unix_timestamp(concat(concat(ed, " "), et))) as big_one, ea from 
(
select enter.dt as ed, enter.time as et, enter.id as ea, back.dt as bd, 
min(back.time) as bt from 
(select * from activity where activity = 3 and dt = "2012-07-17" and content[1] like "bla..") enter join  
(select * from activity where activity = 3 and dt = "2012-07-17" and content[0] <> "bla..") back on  enter.id = back.id where enter.time < back.time group by enter.dt, enter.time, enter.id, back.dt) res
group by ea) big_pot