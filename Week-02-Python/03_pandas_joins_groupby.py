
import pandas as pd
from pathlib import Path

# Locate files
BASE_DIR = Path(__file__).resolve().parent
RAW_DIR = BASE_DIR / "data" / "raw"
CLEAN_DIR = BASE_DIR / "data" / "cleaned"

# Read datasets
orders = pd.read_parquet(CLEAN_DIR / "orders_clean.parquet")
customers = pd.read_csv(RAW_DIR / "customers.csv")

print("ORDERS DATA")
print(orders.head())

print("\nCUSTOMERS DATA")
print(customers.head())


# 1. INNER JOIN
inner_result = pd.merge(
    orders,
    customers,
    on="customer_id",
    how="inner"
)

print("\nINNER JOIN")
print(inner_result.head())


# 2. LEFT JOIN
left_result = pd.merge(
    orders,
    customers,
    on="customer_id",
    how="left"
)

print("\nLEFT JOIN")
print(left_result.head())


# 3. RIGHT JOIN
right_result = pd.merge(
    orders,
    customers,
    on="customer_id",
    how="right"
)

print("\nRIGHT JOIN")
print(right_result.head())


# 4. GROUP BY CUSTOMER
customer_sales = orders.groupby("customer_id")["amount"].sum()

print("\nTOTAL SALES BY CUSTOMER")
print(customer_sales.head())


# 5. GROUP BY STATUS
status_summary = orders.groupby("status")["amount"].agg(
    ["count", "sum", "mean"]
)

print("\nORDER STATUS SUMMARY")
print(status_summary)


# 6. MULTIPLE AGGREGATIONS
sales_summary = orders.groupby("customer_id").agg(
    total_orders=("id", "count"),
    total_amount=("amount", "sum"),
    average_amount=("amount", "mean")
)

print("\nCUSTOMER SALES SUMMARY")
print(sales_summary.head())


# 7. SORT RESULTS
top_customers = sales_summary.sort_values(
    by="total_amount",
    ascending=False
)

print("\nTOP 5 CUSTOMERS")
print(top_customers.head())


# 8. GROUP BY CITY
combined = pd.merge(
    orders,
    customers,
    on="customer_id",
    how="left"
)

city_summary = combined.groupby("city")["amount"].sum()

print("\nTOTAL SALES BY CITY")
print(city_summary.head(10))


# 9. SAVE RESULT
output_path = CLEAN_DIR / "orders_with_customers.parquet"
combined.to_parquet(output_path, index=False)

print("\nJoined dataset saved successfully!")
print("Final shape:", combined.shape)
