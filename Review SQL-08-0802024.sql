-- Table creation for 'Product'
create table Product (
    ProductID int PRIMARY KEY,
    ProductName varchar(255) NOT NULL
);

select * from Product

-- Table creation for 'Feedback'
create table Feedback (
    FeedbackID int PRIMARY KEY,
    ProductID int,
    Rating int CHECK(Rating >= 1 AND Rating <= 5),
    FeedbackDate date,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

select * from Feedback


--insertion of values--for table product
insert into Product(ProductID,ProductName)values(1,'Oreo');
insert into Product(ProductID,ProductName)values(2,'Bourbon');
insert into Product(ProductID,ProductName)values(3,'Nutri choice');
insert into Product(ProductID,ProductName)values(4,'Nutri Digest');
insert into Product(ProductID,ProductName)values(5,'Unibique');

--insertion of values--for table feedback
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(101,1,3,'2024-08-01');
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(102,2,2,'2024-08-02');
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(103,3,4,'2024-08-01');
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(104,4,5,'2024-08-08');
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(105,5,3,'2024-08-02');
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(106,1,4,'2024-08-02');
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(107,1,3,'2024-08-08');
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(108,2,4,'2024-08-01');
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(109,3,3,'2024-08-08');
insert into Feedback(FeedbackID,ProductID,Rating,FeedbackDate)values(110,3,4,'2024-08-01');



--query 1--
	SELECT AVG(Rating) AS OverallAverageRating FROM Feedback;

--query 2--
SELECT AVG(Rating) AS ParticularDateAverageRating
FROM Feedback
WHERE FeedbackDate = '2024-08-01'; -- Replace YYYY-MM-DD with the specific date/DD-MM-YYYY


--query 3
SELECT COUNT(*) AS ParticularDateRatingCount
FROM Feedback
WHERE FeedbackDate = '2024-08-02'; 


--query 4
SELECT MAX(Rating) AS ParticularDateHighestRating
FROM Feedback
WHERE FeedbackDate = '2024-08-08'; 

--query 5
SELECT MIN(Rating) AS ParticularDateLowestRating
FROM Feedback
WHERE FeedbackDate = '2024-08-08'; 


--query 6
SELECT MAX(Rating) AS OverallHighestRating FROM Feedback;

--query 7
SELECT MIN(Rating) AS OverallLowestRating FROM Feedback;


--query 8--range of rating
SELECT *
FROM Feedback
WHERE rating BETWEEN 2 AND 5;



--query 9--creating a function for query solving
CREATE or REPLACE FUNCTION GetLowestRating()
RETURNS int AS $$
DECLARE LowestRating int;
BEGIN 
  SELECT MIN(Rating) into LowestRating
	  FROM Feedback ;
  RETURN LowestRating;
END;$$ language plpgsql;

SELECT GetLowestRating() AS LowestRating;








