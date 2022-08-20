				--== Lung Cancer Causes Observation ==--

-- Open Table --

Select *
From LungCancer

-- Get Rid Of Spaces Between Columns --

sp_rename 'LungCancer.ALCOHOL CONSUMING', 'ALCOHOL_CONSUMING'
sp_rename 'LungCancer.CHRONIC DISEASE', 'CHRONIC_DISEASE'
sp_rename 'LungCancer.SHORTNESS OF BREATH', 'SHORTNESS_OF_BREATH'
sp_rename 'LungCancer.SWALLOWING DIFFICULTY', 'SWALLOWING_DIFFICULTY'
sp_rename 'LungCancer.CHEST PAIN', 'CHEST_PAIN'

-- How Many People Have Lung Cancer? --

Select lung_cancer, count(lung_cancer) as Total 
From LungCancer
Group By lung_cancer

-- How Many People Have Lung Cancer Per Gender? --

Select gender, lung_cancer, count(lung_cancer) as Total
From LungCancer
Where lung_cancer = 'Yes'
Group By gender, lung_cancer

-- Lung Cancer By Age Range? --

Select sum(case when age < 18 then 1 else 0 end) as [Under 18], 
	   sum(case when age between 18 and 24 then 1 else 0 end) as [18-24],
	   sum(case when age between 25 and 34 then 1 else 0 end) as [25-34],
	   sum(case when age between 35 and 44 then 1 else 0 end) as [35-44],
	   sum(case when age between 45 and 54 then 1 else 0 end) as [45-54],
	   sum(case when age between 55 and 64 then 1 else 0 end) as [55-64],
	   sum(case when age > 65 then 1 else 0 end) as [Above 65],
       count(*) as Total,
	   lung_cancer
FROM LungCancer
Group By lung_cancer


--== Lung Cancer Reasons ==--				

	-- How Many People That Have Lung Cancer Smoke? --

	Select gender, lung_cancer, count(smoking) as Total_Smoke
	From LungCancer
	Where lung_cancer = 'Yes' and Smoking = '2'
	Group By gender, lung_cancer

	-- How Many People That Have Lung Cancer Consume Alcohol? --

	Select gender, count(alcohol_consuming) as Total_Alcohol_Consuming
	From LungCancer
	Where alcohol_consuming = '2' and lung_cancer = 'yes'
	Group By Gender, alcohol_consuming


 --== Lung Cancer Symptoms ==--

	-- Yellow Fingers --

	Select gender, count(Yellow_Fingers) as Total_Yellow_Fingers
	From LungCancer
	Where yellow_fingers = '2' and lung_cancer = 'yes'
	Group By Gender, lung_cancer

	-- Anxiety --

	Select gender, count(Anxiety) as Total_Anxiety
	From LungCancer
	Where Anxiety = '2' and lung_cancer = 'yes'
	Group By Gender, lung_cancer

	-- Shortness of Breath --

	Select gender, count(shortness_of_breath) as Total_Shortness_Of_Breath
	From LungCancer
	Where shortness_of_breath = '2' and lung_cancer = 'yes'
	Group By Gender, lung_cancer

	-- Chest Pain

	Select gender, count(chest_pain) as Total_Chest_Pain
	From LungCancer
	Where Chest_Pain = '2' and lung_cancer = 'Yes'
	Group By Gender, lung_cancer

