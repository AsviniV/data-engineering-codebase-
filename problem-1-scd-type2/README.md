# Problem 1: Slowly Changing Dimension (SCD) Type 2

### Scenario
An employee's designation updates over time. We need to track the full career history instead of overwriting existing records by generating `start_date`, `end_date`, and an `is_active` flag.

### Input Data

| ID | Emp_id | DOB | Designation | update_at |
|---|---|---|---|---|
| 1 | AA | 10/1/1999 | Trainee | 10th July 2022 |
| 2 | AA | 10/1/1999 | Associate | 11th June 2023 |
| 3 | AA | 10/1/1999 | Sr.Associate | 11th May 2024 |

### Target Output Data

| ID | Emp_id | DOB | Designation | update_at | start_date | end_date | is_active |
|---|---|---|---|---|---|---|---|
| 1 | AA | 10/1/1999 | Trainee | 10th July 2022 | 10th July 2022 | 11th June 2023 | N |
| 2 | AA | 10/1/1999 | Associate | 11th June 2023 | 11th June 2023 | 11th May 2024 | N |
| 3 | AA | 10/1/1999 | Sr.Associate | 11th May 2024 | 11th May 2024 | null | Y |
