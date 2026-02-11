CREATE DATABASE NumericFunctionsDB;
USE NumericFunctionsDB;

CREATE TABLE numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_value DECIMAL(10,5)
);

INSERT INTO numbers (num_value) VALUES
(25.6789),
(-17.5432),
(100.999),
(-0.4567),
(9.5),
(1234.56789),
(0);

SELECT * FROM numbers;

id | num_value
1  | 25.67890
2  | -17.54320
3  | 100.99900
4  | -0.45670
5  | 9.50000
6  | 1234.56789
7  | 0.00000

SELECT num_value, ABS(num_value) AS absolute_value FROM numbers;

num_value   | absolute_value
25.67890    | 25.67890
-17.54320   | 17.54320
100.99900   | 100.99900
-0.45670    | 0.45670
9.50000     | 9.50000
1234.56789  | 1234.56789
0.00000     | 0.00000


SELECT num_value,
       CEIL(num_value) AS rounded_up,
       FLOOR(num_value) AS rounded_down
FROM numbers;


num_value   | rounded_up | rounded_down
25.67890    | 26         | 25
-17.54320   | -17        | -18
100.99900   | 101        | 100
-0.45670    | 0          | -1
9.50000     | 10         | 9
1234.56789  | 1235       | 1234
0.00000     | 0          | 0


SELECT num_value, ROUND(num_value, 2) AS rounded_2_decimals FROM numbers;

num_value   | rounded_2_decimals
25.67890    | 25.68
-17.54320   | -17.54
100.99900   | 101.00
-0.45670    | -0.46
9.50000     | 9.50
1234.56789  | 1234.57
0.00000     | 0.00

SELECT num_value, TRUNCATE(num_value, 2) AS truncated_2_decimals FROM numbers;
num_value   | truncated_2_decimals
25.67890    | 25.67
-17.54320   | -17.54
100.99900   | 100.99
-0.45670    | -0.45
9.50000     | 9.50
1234.56789  | 1234.56
0.00000     | 0.00

SELECT num_value, POWER(num_value,2) AS squared FROM numbers;
num_value   | squared
25.67890    | 659.4059
-17.54320   | 307.7649
100.99900   | 10200.7980
-0.45670    | 0.2086
9.50000     | 90.25
1234.56789  | 1524157.8750
0.00000     | 0

SELECT num_value, MOD(num_value,3) AS remainder FROM numbers;
num_value   | remainder
25.67890    | 1.67890
-17.54320   | -2.54320
100.99900   | 1.99900
-0.45670    | -0.45670
9.50000     | 0.50000
1234.56789  | 1.56789
0.00000     | 0.00000

SELECT num_value, SQRT(ABS(num_value)) AS sqrt_value FROM numbers;
num_value   | sqrt_value
25.67890    | 5.067
-17.54320   | 4.189
100.99900   | 10.049
-0.45670    | 0.676
9.50000     | 3.082
1234.56789  | 35.128
0.00000     | 0


SELECT num_value,
       CASE
           WHEN num_value > 709 THEN 'Value too large for EXP()'
           ELSE EXP(num_value)
       END AS exp_value
FROM numbers;

25.67890   | 1.6E11 (approx)
-17.54320  | small decimal
100.99900  | very large number
-0.45670   | 0.633
9.50000    | 13359
1234.56789 | Value too large for EXP()
0.00000    | 1

SELECT PI() AS pi_value;
pi_value
3.141592653589793

//e
