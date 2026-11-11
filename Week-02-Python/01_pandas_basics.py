
import pandas as pd
from pathlib import Path

# Locate the raw data folder
BASE_DIR = Path(__file__).resolve().parent
DATA_DIR = BASE_DIR / "data" / "raw"

# 1. Read CSV files
orders = pd.read_csv(DATA_DIR / "orders.csv")
customers = pd.read_csv(DATA_DIR / "customers.csv")

print("\n========== ORDERS DATA ==========")

# 2. Display first five rows
print("\nFirst 5 rows:")
print(orders.head())

# 3. Display last five rows
print("\nLast 5 rows:")
print(orders.tail())

# 4. Display dataset dimensions
print("\nDataset shape:")
print(orders.shape)

# 5. Display column names
print("\nColumn names:")
print(orders.columns.tolist())

# 6. Display data types and missing values
print("\nDataset information:")
orders.info()

# 7. Statistical summary
print("\nStatistical summary:")
print(orders.describe())

# 8. Check missing values
print("\nMissing values:")
print(orders.isnull().sum())

# 9. Check duplicate records
print("\nDuplicate records:")
print(orders.duplicated().sum())

# 10. Display customer information
print("\n========== CUSTOMERS DATA ==========")
print(customers.head())
print("\nCustomer dataset shape:", customers.shape)

print("\nPractical 1 completed successfully!")
