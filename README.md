# Delivery Forecast

This project aims to develop and implement a model to predict the time in days until the delivery of a given product.

<div align="center">
    <img alt="churn" src="reports/figures/terra-empresas-entrega-delivery-interno.jpg" width="100%" height="300">
</div>

## 1.0 Business Problem

This dataset was generously provided by Olist, the largest department store in Brazilian marketplaces. Olist connects small businesses from all over Brazil to channels without hassle and with a single contract. Those merchants are able to sell their products through the Olist Store and ship them directly to the customers using Olist logistics partners.

**Everything bellow is for study propurses**

MegaMarket, a large national marketplace, connects thousands of third-party sellers to customers across the country. After years of operation, the company discovered that approximately 25% of all orders are delivered later than the estimated date. This delay leads to an increase in customer service complaints, higher cancellation rates, additional reshipping costs, and a loss of brand reputation. Currently, delivery estimates are generated using a simple business rule based on distance, shipping type, and the seller’s historical performance, but this approach fails to reflect the real variability of the logistics process. As a result, the company’s leadership has decided to develop a machine learning model capable of predicting the actual expected delivery date with greater accuracy. This would allow the platform to provide customers with more reliable delivery estimates, improve and reorganize logistics operations, recommend more efficient carriers, and identify orders at risk of delay.

## 2.0 Business Assumptions

The business assumption behind the delivery-date prediction initiative is that delays in the logistics chain are not random but follow identifiable patterns that can be learned from historical data. Factors such as the seller’s handling performance, product characteristics, carrier efficiency, geographic distance, seasonality, and operational bottlenecks influence the actual delivery time more strongly than the static rules currently used by the company. By leveraging these patterns, a machine learning model should be able to estimate the expected delivery date more accurately than traditional business logic, which relies largely on distance and shipping type.

It is assumed that the available data contains enough variability and historical depth to capture the main drivers of delay, allowing the model to generalize to new orders. It is also assumed that improving delivery-date accuracy generates measurable business impact: better customer communication, fewer last-mile surprises, reduced complaint rates, and greater trust in the platform. Additionally, more precise predictions can support operational decisions, such as identifying high-risk orders, optimizing carrier selection, and improving seller performance monitoring. Under this assumption, a data-driven approach is expected to outperform rule-based estimation and provide competitive value for the marketplace’s logistics ecosystem.

## 3.0 Solution Strategy

My solution to solve this problem will be the development of a data science project. This project will have a machine learning model capable of more accurately predicting the delivery date.

> A database was created using Docker. This database was populated with data to be accessed using the SQL language, in order to simulate accessing data from a real database. Below I will describe about all process to develop the machine learning model.

**Step 01. Variable Book's creation** 

This process 




