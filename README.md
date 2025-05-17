# Data Analyst SQL Assessment

This repository contains my solutions to the SQL proficiency assessment for the Data Analyst position.

## Repository Structure

- `Assessment_Q1.sql`: Solution for High-Value Customers with Multiple Products
- `Assessment_Q2.sql`: Solution for Transaction Frequency Analysis  
- `Assessment_Q3.sql`: Solution for Account Inactivity Alert
- `Assessment_Q4.sql`: Solution for Customer Lifetime Value Estimation

## Per-Question Explanations

### Question 1: High-Value Customers
**Approach**: 
- Joined users with both savings accounts and investment plans
- Used conditional aggregation to count different product types separately
- Converted amounts from kobo to Naira (divided by 100)
- Filtered for customers with both product types
- Ordered by total deposits descending

**Key Techniques**: 
- Multiple LEFT JOINs
- CASE statements in aggregation
- HAVING clause for filtering groups

### Question 2: Transaction Frequency
**Approach**:
- Created CTE to calculate transactions per customer per month
- Used DATE_FORMAT to standardize dates to month-start
- Categorized customers based on average monthly transactions
- Calculated aggregate statistics per frequency category

### Question 3: Account Inactivity
**Approach**:
- Identified last transaction date for each account
- Calculated days of inactivity using DATEDIFF
- Filtered for accounts with >365 days inactivity
- Included only active savings/investment accounts

**Key Insight**: 
- Used DATE() function to extract just the date portion from datetime values
- Ensured accurate day count calculations

### Question 4: Customer Lifetime Value
**Approach**:
- Calculated customer tenure in months
- Aggregated transaction counts and values
- Applied the CLV formula with proper kobo conversion
- Handled edge cases (division by zero) with NULLIF

**Formula Implementation**:
CLV = (total_transactions / tenure_months) * 12 * (0.1% of avg_transaction_value)


## Technical Considerations

1. **MySQL Compatibility**: All solutions are specifically written for MySQL
2. **Kobo Conversion**: All amount fields are properly converted from kobo to Naira (divided by 100)
3. **Performance**: Queries optimized with appropriate JOINs and indexing considerations
4. **Edge Cases**: Handled potential division by zero and NULL values

## How to Verify

Each SQL file can be run independently against the provided database schema. Expected outputs match the formats specified in the assessment document.
