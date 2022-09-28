import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import r2_score
from sklearn import metrics

sales_data = pd.read_csv(r"F:\python\Bigmart.csv")
print(sales_data.head())

sales_data.info()
print(sales_data.describe())


#Data Cleaning

#Item weight
print(sales_data['Item_Weight'].isnull().sum())

plt.figure(figsize=(8,8))
sns.boxplot('Item_Weight',
            data=sales_data)
#There is no outliers. so we can do with mean

sales_data['Item_Weight'] = sales_data['Item_Weight'].fillna(sales_data['Item_Weight'].mean())

#Outlet size

print(sales_data['Outlet_Size'].isnull().sum())
print(sales_data['Outlet_Size'].value_counts())

#since it is categorical value, we replace with mode
sales_data['Outlet_Size'] = sales_data['Outlet_Size'].fillna(sales_data['Outlet_Size'].mode()[0])


#Exploratory Data Analysis


print(sales_data.columns)
print(sales_data['Item_Fat_Content'].value_counts())

sales_data.replace({'Item_Fat_Content' : {'low fat' : 'Low Fat',
                                         'LF' : 'Low Fat',
                                         'reg' : 'Regular'}},inplace=True)

print(sales_data['Item_Fat_Content'].value_counts())


##Univariate Analysis

#fat content
plt.figure(figsize=(8,5))
sns.countplot(x='Item_Fat_Content',
              data=sales_data,
              palette='ocean')

#Item type
plt.figure(figsize=(30,5))
sns.countplot(x='Item_Type',
              data=sales_data,
              palette='spring')

# Outlet Size
plt.figure(figsize=(10,10))
sns.countplot(x='Outlet_Size',
              data=sales_data,
              palette='summer')

#Outlet Location Type
plt.figure(figsize=(8,5))
sns.countplot(x='Outlet_Location_Type',
              data=sales_data,
              palette='autumn')

#Outlet Type
plt.figure(figsize=(8,5))
sns.countplot(x='Outlet_Type',
              data=sales_data,
              palette='twilight')


#Bivariate Analysis

#Item Fat Content and sales
plt.figure(figsize=(8,5))
sns.barplot(x='Item_Fat_Content',
            y='Item_Outlet_Sales'
            ,data=sales_data
            ,palette='mako')


#Item Visibility and sales
plt.figure(figsize=(8,5))
plt.scatter(x='Item_Visibility',
            y='Item_Outlet_Sales',
            data=sales_data)
#Item visibility cannot be 0.

sales_data["Item_Visibility"] = sales_data['Item_Visibility'].replace(0,sales_data['Item_Visibility'].mean())

plt.figure(figsize=(8,5))
plt.scatter(x='Item_Visibility',
            y='Item_Outlet_Sales',
            data=sales_data)
plt.xlabel("Item visibilty")
plt.ylabel("Item outlet store")

#Item type and sales
plt.figure(figsize=(20,8))
sns.barplot(x='Item_Type',
            y='Item_Outlet_Sales',
            data=sales_data,
            palette='flag')

#MRP and sales
plt.figure(figsize=(8,5))
plt.scatter(x='Item_MRP',
            y='Item_Outlet_Sales',
            data=sales_data)
plt.xlabel('Item MRP')
plt.ylabel('Item Outlet Sales')

#Outlet size and sales
plt.figure(figsize=(8,5))
sns.barplot(x='Outlet_Size',
            y='Item_Outlet_Sales',
            data=sales_data,
            palette='winter')

#Outlet location and sales
plt.figure(figsize=(8,5))
sns.barplot(x='Outlet_Location_Type',
            y='Item_Outlet_Sales'
            ,data=sales_data,
            palette='plasma')



#Multivariate Analysis

#Item type classified by fat content to sales
plt.figure(figsize=(25,5))
sns.barplot(x='Item_Type',
            y='Item_Outlet_Sales',
            hue='Item_Fat_Content',
            data=sales_data,
            palette='mako')
plt.legend()


#Location type classified by outlet type to sales
plt.figure(figsize=(10,5))
sns.barplot(x='Outlet_Location_Type',
            y='Item_Outlet_Sales',
            hue='Outlet_Type',
            data=sales_data,
            palette='magma')
plt.legend()


#Feature Modelling
le = LabelEncoder()
var_mod = ['Item_Fat_Content','Outlet_Location_Type','Outlet_Size',
           'Outlet_Type','Item_Type']
for i in var_mod:
    sales_data[i]=le.fit_transform(sales_data[i])
print(sales_data.head())

sales_data = sales_data.drop(['Item_Identifier','Outlet_Identifier'],axis=1)

print(sales_data.columns)

X = sales_data[['Item_Weight','Item_Fat_Content','Item_Visibility',
           'Item_Type','Item_MRP','Outlet_Size','Outlet_Location_Type',
           'Outlet_Type']]
y = sales_data['Item_Outlet_Sales']

X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.2,
                                                 random_state=42)

#Linear regression
features= ['Item_Weight','Item_Fat_Content','Item_Visibility',
           'Item_Type','Item_MRP','Outlet_Size','Outlet_Location_Type',
           'Outlet_Type']
LR = LinearRegression()
LR.fit(X_train,y_train)
y_pred = LR.predict(X_test)

coef2 = pd.Series(LR.coef_,features).sort_values()
print(coef2)
print(LR.intercept_)

plt.figure(figsize=(8,8))
sns.barplot(LR.coef_,features)


# R-Squared
r2 = r2_score(y_test,y_pred)
print(r2)

#MAE and MSE
MAE= metrics.mean_absolute_error(y_test,y_pred)
MSE= metrics.mean_squared_error(y_test,y_pred)
print("mean absolute error:",MAE)
print("mean squared error:",MSE)

#Root Mean Squared Error
from math import sqrt
rmse = sqrt(MSE)
print("Root Mean Squared Error:",rmse)

#Results
#1 Item_MRP clearly maximises the Outlet sales.
#2 Item visibility has higher impact on sales followed by outlet type,location,size
#3 Outlet Type being SuperMarket or Grocery Store also depicts the Outlet Sales.


