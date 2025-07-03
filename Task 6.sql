-- scalar subquery
SELECT Name, CustomerID 
FROM Customer 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Loan 
    WHERE Amount = (SELECT MAX(Amount) FROM Loan));
    
    -- correlated subquery
    SELECT e.Name, e.Role 
FROM Employee e
WHERE EXISTS (
    SELECT 1 
    FROM Loan l 
    WHERE l.EmployeeID = e.EmployeeID 
    AND l.Amount > 1000000);
    
    -- subquery with IN
    SELECT Name 
FROM Customer 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Loan);

-- subquery with EXISTS
SELECT LoanCategory 
FROM LoanType lt
WHERE EXISTS (
    SELECT 1 
    FROM Loan l 
    WHERE l.LoanTypeID = lt.LoanTypeID
);

-- subquery with =
SELECT InterestRate 
FROM LoanType 
WHERE LoanTypeID = (
    SELECT LoanTypeID 
    FROM Loan 
    ORDER BY Amount DESC 
    LIMIT 1
);





