import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt, pyplot

pd.options.mode.chained_assignment = None

df1 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_January_2019.csv")
df1["month"] = "Jan"
df2 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_February_2019.csv")
df2["month"] = "feb"
df3 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_March_2019.csv")
df3["month"] = "mar"
df4 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_April_2019.csv")
df4["month"] = "apr"
df5 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_May_2019.csv")
df5["month"] = "may"
df6 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_June_2019.csv")
df6["month"] = "june"
df7 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_July_2019.csv")
df7["month"] = "july"
df8 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_August_2019.csv")
df8["month"] = "aug"
df9 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_September_2019.csv")
df9["month"] = "sep"
df10 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_October_2019.csv")
df10["month"] = "oct"
df11 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_November_2019.csv")
df11["month"] = "nov"
df12 = pd.read_csv(r"F:\python\K-Mart-Data-Analysis-main\Sales_December_2019.csv")
df12["month"] = "dec"

sales_by_month = [df1, df2, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12]

for i in sales_by_month:
    print(i.shape)

frame = pd.concat(sales_by_month)
print(frame.columns)

print(frame.info())

print(frame.isnull().sum())

print((frame.isnull().sum().sum()) / len(frame) * 100)

frame = frame.dropna()
print(frame.isnull().sum())

print(frame[frame['Quantity Ordered'] == "Quantity Ordered"])
df_filtered = frame[frame['Quantity Ordered'] != "Quantity Ordered"]
print(df_filtered.shape)

df_filtered["Quantity Ordered"] = df_filtered["Quantity Ordered"].astype("float")
df_filtered["Price Each"] = df_filtered["Price Each"].astype("float")
df_filtered["sales"] = df_filtered["Quantity Ordered"] * df_filtered["Price Each"]
df_filtered["sales"] = df_filtered["sales"].astype("float")

print(df_filtered["sales"].sum())





# What was the best month for sales? How much was earned that month?

df_group = df_filtered.groupby(["month"])['sales'].sum().reset_index()
a4_dims = (11.7, 8.27)
fig, ax = pyplot.subplots(figsize=a4_dims)
g = sns.barplot(x="month",
                y="sales",
                data=df_group,
                order=df_group.sort_values('sales', ascending=False).month)
plt.title("Month wise sales")
plt.show()





# Which city had the highest number of sales?

dftemp = df_filtered
list_city = []
for i in dftemp["Purchase Address"]:
    list_city.append(i.split(",")[1])

dftemp["city"] = list_city

df_group = df_filtered.groupby(['city'])['sales'].sum().reset_index()
print(df_group)
a4_dims = (11.7, 8.27)
fig, ax = pyplot.subplots(figsize=a4_dims)
h = sns.barplot(x="city",
                y="sales",
                data=df_group,
                order=df_group.sort_values("sales",ascending=False).city)
plt.title("Sales by city wise")
plt.show()






#Recommend the most appropriate time to display advertising to maximize the likelihood of customers buying the product/s

list_time=[]
for i in df_filtered['Order Date']:
    list_time.append(i.split(" ")[1])
df_filtered["Time"] = list_time
df_filtered["hour"]= df_filtered['Time'].str[0:2]
print(df_filtered.head())

df_group = df_filtered.groupby(["hour"])['sales'].sum().sort_values(ascending=False)

qty_hour = df_filtered.groupby(['hour'])['Quantity Ordered'].count()
hours = [hour for hour, df in df_filtered.groupby('hour')]

plt.plot(hours, qty_hour)
plt.xlabel('hour')
plt.ylabel('Qty ordered')
plt.grid()





#What products sold the most in revenue?

print(df_filtered['Product'].unique())
print(df_filtered["Product"].nunique())

df_group1 = df_filtered.groupby(["Product"])["sales"].sum().sort_values(ascending=False).reset_index()
print(df_group1.head())

a4_dims = (11.7, 8.27)
fig, ax = pyplot.subplots(figsize=a4_dims)
sns.barplot(x = "Product",
            y = "sales",
            data = df_group1)
plt.title("City wise Sales")
plt.show()





#products in quantity sold
df_group2 = df_filtered.groupby(["Product"])["Quantity Ordered"].count().sort_values(ascending=False).reset_index()
a4_dims = (11.7, 8.27)
fig, ax = pyplot.subplots(figsize=a4_dims)
sns.barplot(x = "Product",
            y = "Quantity Ordered",
            data = df_group2)
plt.title("Products sold in quantities")
plt.show()




#Re