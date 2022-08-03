-- --------------------------------------------------------------
# Dataset Used: wine.csv
-- --------------------------------------------------------------

SELECT * FROM wine;
--Apply windows analytical functions

#Q1. Rank the winery according to the wine's quality (points).-- Should use dense rank
#Q2. Apply a dense rank to the various wine varities on the column price.
#Q3.Classify the wine data into 4 buckets based on points
#Q4.Display country,next offset country in terms of price,winery .Use lead()
#Q5.Display country,winery ,cumulative distribution of price of wine on whole dataset.
#Q6.Display country,winery ,rank the winery according to points .Apply rank() 
#Q7.Display country,winery ,rank the winery according to price province wise.Apply rank()

