# Healthcare Dataset Cleaning (SQL + Excel)

## Dataset
- Source: "Healthcare Dataset" from Kaggle (synthetic data, 55,500 rows)
  - Available in the `healthcare_dataset_raw` file.
- Topic: Hospital patient records

## Issues Found
- 534 fully duplicate rows
- Inconsistent name formatting (prefixes, broken casing)
- 106 negative billing amounts

## What I Did
- Excel: removed prefixes, fixed casing, removed duplicates, standardized billing
  Can be seen in the healthcare_dataset_cleaned file
- SQL: created clean table, added Length of Stay (Days), dropped analytically 
  irrelevant columns, reordered columns logically
   - Available in the healthcare_cleaning file

## Decisions Made
- Dropped Hospital, Doctor columns and Room Number: Synthetically generated
with ~40,000 unique random entries which gave no analytical value
- Used ABS() on negative billing: treated as data entry errors

## Final Output
- Clean table: `healthcare_clean`
- Rows: 54,966
- Columns: 13
