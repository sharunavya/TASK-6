 1. Scalar Subquery
sql
Copy
Edit
SELECT Name, CustomerID 
FROM Customer 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Loan 
    WHERE Amount = (SELECT MAX(Amount) FROM Loan)
);
Purpose:
Returns the name and ID of customers who took a loan with the maximum loan amount.

Key Concept:
A scalar subquery is used to get a single value (MAX(Amount)) for comparison.

 2. Correlated Subquery

SELECT e.Name, e.Role 
FROM Employee e
WHERE EXISTS (
    SELECT 1 
    FROM Loan l 
    WHERE l.EmployeeID = e.EmployeeID 
    AND l.Amount > 1000000
);
Purpose:
Fetches employees who have processed at least one loan of more than ₹10,00,000.

Key Concept:
The subquery refers to the outer query (e.EmployeeID), so it’s correlated and runs per employee row.

3. Subquery with IN

SELECT Name 
FROM Customer 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Loan
);
Purpose:
Retrieves names of customers who have taken at least one loan.

Key Concept:
The outer query filters rows where the CustomerID exists in the result set returned by the subquery.

4. Subquery with EXISTS

SELECT LoanCategory 
FROM LoanType lt
WHERE EXISTS (
    SELECT 1 
    FROM Loan l 
    WHERE l.LoanTypeID = lt.LoanTypeID
);
Purpose:
Lists loan categories that are actually used in at least one loan.

Key Concept:
EXISTS checks for the existence of a matching record in the Loan table.

 5. Subquery with = (Scalar)

SELECT InterestRate 
FROM LoanType 
WHERE LoanTypeID = (
    SELECT LoanTypeID 
    FROM Loan 
    ORDER BY Amount DESC 
    LIMIT 1
);
Purpose:
Finds the interest rate of the loan type associated with the highest loan amount.

Key Concept:
The subquery returns a single LoanTypeID, and is used as a filter with = in the outer query.
