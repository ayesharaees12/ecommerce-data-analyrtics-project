# 🛒 E-Commerce Data Analytics Project
### DecodeLabs Industrial Training | Batch 2026

A full end-to-end data analytics project on a real-world e-commerce orders dataset (1,200 rows). The project is divided into four milestones — Data Cleaning, Exploratory Data Analysis, SQL Analysis, and Advanced Insights — each building on the previous one.

---

## 📁 Repository Structure

```
ecommerce-data-analytics/
│
├── week1_project.ipynb          # Project 1 – Data Cleaning
├── week2_EDA.ipynb              # Project 2 – EDA & Visualizations
├── Project_2_sql_analysis.sql   # Project 3 – SQL Data Analysis
├── week4_insight.ipynb          # Project 4 – Advanced Insights
└── README.md
```

---

## 📊 Dataset Overview

| Field | Details |
|---|---|
| **File** | `Dataset for Data Analytics.xlsx` |
| **Rows** | 1,200 orders |
| **Columns** | 14 |
| **Date Range** | January 2023 – June 2025 |

**Columns:** `OrderID`, `Date`, `CustomerID`, `Product`, `Quantity`, `UnitPrice`, `ShippingAddress`, `PaymentMethod`, `OrderStatus`, `TrackingNumber`, `ItemsInCart`, `CouponCode`, `ReferralSource`, `TotalPrice`

---

## 🗂️ Project Breakdown

---

### ✅ Project 1 — Data Cleaning
**File:** `week1_project.ipynb`

The raw dataset was inspected and cleaned before any analysis.

**Steps performed:**
- Loaded dataset using `pandas`
- Checked shape, data types, and first 5 rows
- Identified and counted null values — `CouponCode` had missing entries
- Filled null `CouponCode` values with `"No Coupon"`
- Checked for and confirmed zero duplicate rows
- Verified unique values across all categorical columns (`Product`, `PaymentMethod`, `OrderStatus`, `ReferralSource`)
- Checked for extra whitespace in the `Product` column using `.str.strip()`
- Exported the cleaned dataset as `cleaned_data.xlsx`

**Libraries:** `pandas`

---

### 📈 Project 2 — Exploratory Data Analysis (EDA)
**File:** `week2_EDA.ipynb`

Visual exploration of the cleaned dataset to understand distributions, relationships, and trends.

**Analysis performed:**

| Type | What Was Analysed |
|---|---|
| **Univariate** | Product distribution, Payment method pie chart, Order status donut chart |
| **Numerical** | Quantity & TotalPrice statistics using `.describe()` |
| **Bivariate** | Cart size vs order value (scatter), Orders & revenue by referral source (bar) |
| **Multivariate** | Payment method × Order status (stacked bar), Revenue heatmap (ReferralSource × Product) |
| **Trend** | Monthly revenue line chart, Outlier detection (box plot) |

**Key Findings:**
- Chair generated the highest total revenue; Phone the lowest
- Online is the most preferred payment method
- Only ~19% of orders are successfully Delivered; Cancelled + Returned = 41.4%
- No strong correlation between cart size and order value
- Instagram leads all referral sources in both orders and revenue

**Libraries:** `pandas`, `numpy`, `matplotlib`, `seaborn`

---

### 🛢️ Project 3 — SQL Data Analysis
**File:** `Project_2_sql_analysis.sql`

SQL queries written in MySQL to extract business insights directly from the orders table.

**Concepts covered:**

| Concept | Queries Written |
|---|---|
| `SELECT` | View all orders, filter specific columns |
| `WHERE` | Delivered orders, coupon orders above $2,000, cancelled count |
| `ORDER BY` | Sort by revenue descending |
| `GROUP BY` | Orders by status, revenue by product, orders by payment method |
| `COUNT / SUM / AVG` | Aggregations across product, referral source, payment method |
| `HAVING` | Products with revenue > $10,000, coupon codes used > 10 times |
| Date functions | Monthly revenue using `MONTH(DATE)` |

**Sample Query:**
```sql
-- Revenue, order count, and avg value by Product
SELECT Product,
       COUNT(*)                    AS total_orders,
       SUM(TotalPrice)             AS total_revenue,
       ROUND(AVG(TotalPrice), 2)   AS avg_order_value
FROM orders
GROUP BY Product
ORDER BY total_revenue DESC;
```

**Tool:** MySQL Workbench 8.0

---

### 💡 Project 4 — Advanced Insights
**File:** `week4_insight.ipynb`

A polished, styled version of the EDA with deeper observations and business-level explanations for each chart.

**Charts produced with full written insights:**
- **Revenue by Product** — horizontal bar chart with custom colour palette
- **Order Status Donut Chart** — proportion of each status with % labels
- **Monthly Revenue Trend** — line chart with fill, Jan 2023–Jun 2025
- **Cart Size vs Order Value** — scatter plot coloured by product
- **Payment Method × Order Status** — 100% stacked bar chart
- **Referral Source Performance** — dual-axis bar (orders + revenue)

**Key Observations:**
- Revenue is highly volatile month-to-month with notable peaks in mid-2023 and mid-2024
- Cart size (1–10 items) does not predict total order value — unit price is the real driver
- All payment methods show a similar distribution of order statuses — no single method leads to better delivery rates
- Email and Instagram are the strongest acquisition channels overall
- The Referral channel has the weakest performance across both volume and revenue

**Libraries:** `pandas`, `numpy`, `matplotlib`, `seaborn`

---

## 🔑 Key Business Insights (Across All Projects)

| Insight | Finding |
|---|---|
| 💰 Top revenue product | Chair (~$195,600) |
| 📉 Lowest revenue product | Phone (~$151,700) |
| ⚠️ Problem rate | 41.4% of orders are Cancelled or Returned |
| 📸 Best acquisition channel | Instagram (259 orders, highest revenue) |
| 🗓️ Revenue peaks | May–June consistently across years |
| 🎫 Best coupon | FREESHIP drives the highest avg order value |
| 💳 Most used payment method | Online |

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python 3 | Data cleaning, EDA, visualizations |
| pandas | Data manipulation |
| matplotlib & seaborn | Charts and plots |
| MySQL Workbench 8.0 | SQL queries and analysis |
| Jupyter Notebook / Google Colab | Development environment |
| GitHub | Version control and portfolio |

---

## 🚀 How to Run

**Python notebooks:**
1. Open in Google Colab or Jupyter Notebook
2. Upload `cleaned_data.xlsx` when prompted
3. Run all cells in order

**SQL file:**
1. Open MySQL Workbench and connect to your local server
2. Run `import_orders.sql` first to create and populate the table
3. Then open and run `Project_2_sql_analysis.sql`

---
