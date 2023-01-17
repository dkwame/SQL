--- Excluding the F-Units (Model F7B/F9A) what is the oldest locomotive ->
--- (based on Build Date) Norfolk Southern owns?
select Model, "Built Date"
from ExcelExercise ee
where ee.Model not in ("F7B", "F9A")
order by "Built Date" asc;



--- How many locomotives are assigned to PD Chamblee GA (CG)?
select "Train Service Code", count(id)
from ExcelExercise ee
where ee."Train Service Code" like "PD Chamble%"
order by count(id) desc
limit 1;



--- How many unique Train Service Codes does the Illinois (IL) division have ->
--- assigned?
select "Cur Division", count(distinct("Train Service Code"))
from ExcelExercise ee
where "Cur Division" like "Illinoi%"
and ee."Train Service Code" != ""
limit 1;



--- What model of locomotive does Norfolk Southern own the most of and how many ->
--- do we own?
select Model, count(id)
from ExcelExercise ee
group by ee."Model"
order by count(id) desc;



--- How many locomotives are currently on the Pocahontas division?
select "Cur Division", count(id)
from ExcelExercise ee
where ee."Cur Division" like "Pocahon%";



---What percentage of Active locomotives are used in YL service?
select count(id)
from ExcelExercise ee
where ee."Status" like "A%";
--find number of possible active units
--3,330 possible active units
select "Power Usage", count(id)
from ExcelExercise ee
where ee."Status" like "A%"
group by "Power Usage"
order by count(id) desc;
-- find how they are split
select "Power Usage", (cast(count(id) as a float)/3330)*100 as percent
from ExcelExercise ee
where ee."Status" like "A%"
group by "Power Usage"
order by percent desc;




--- What is the average age of the following locomotive models (based on Build Date):
-- SD40-2?
-- MP15E?
-- SD70ACE?
-- SW1001?
-- AC44C6M?
-- ES44DC?
select "Model", AVG(date()-"Built Date")
from ExcelExercise ee
where ee."Model" in ("SD40-2","MP15E","SD70ACE","SW1001","AC44C6M","ES44DC")
group by ee."Model"
order by Avg(date()-"Built Date") desc;



---How many units have an assigned home shop as Inman Yard?
select distinct("Home Shop")
from ExcelExercise ee
where ee."Home Shop" != ""
group by "Home Shop"
order by "Home Shop" asc;
--then count INM observations
select "Home Shop", count(id)
from ExcelExercise ee
where ee."Home Shop" = "INM"
limit 1;



---How many units are equipped with remote control? 252 units
-- What is the most popular Remote Control type and what percentage of the ->
--remote control fleet is equipped with that type?
select "Remote Control", count(id)
from ExcelExercise ee
group by "Remote Control"
order by count(id) desc;



--- How many locomotives require no fuel?
select "Fuel Cap", count(id)
from ExcelExercise ee
group by "Fuel Cap"
order by "Fuel Cap" asc;



---How many Road units does Norfolk Southern own that are capable of operating ->
--- in Cab Signal (CS) territory?
--What percentage of the road fleet does that number represent?
select "CS", count(id)
from ExcelExercise ee
where ee."Category" like "RD%"
group by ee."CS";

select "CS", (cast(count(id) as float)/(select count(id) from ExcelExercise ee2 where ee2."Category" like "RD%"))*100 as percent
from ExcelExercise ee
where ee."Category" like "RD%"
group by ee."CS"
order by count(id) asc;



--- How many units are currently leased in?
select "Status", count(id)
from ExcelExercise ee
group by ee."Status"
order by count(ID);



--- How many units were rebuilt in each year since 2000?
select "Rebuilt Date", id, Model
from ExcelExercise ee
where "Rebuilt Date" > 2000-01-01;

select count(id)
from ExcelExercise ee
where "Rebuilt Date" > 2000-01-01;
