# Delivery Forecast

A data science project to predict the time in days until the delivery of a given product.

<div align="center">
    <img alt="delivery" src="reports/figures/terra-empresas-entrega-delivery-interno.jpg" width="100%" height="300">
</div>

<br>

## 1.0 Business Problem

This dataset was generously provided by Olist, the largest department store in Brazilian marketplaces. Olist connects small businesses from all over Brazil to channels without hassle and with a single contract. Those merchants are able to sell their products through the Olist Store and ship them directly to the customers using Olist logistics partners.

**Everything bellow is for study purposes**

MegaMarket, a large national marketplace, connects thousands of third-party sellers to customers across the country. After years of operation, the company discovered that approximately 25% of all orders are delivered later than the estimated date. This delay leads to an increase in customer service complaints, higher cancellation rates, additional reshipping costs, and a loss of brand reputation. Currently, delivery estimates are generated using a simple business rule based on distance, shipping type, and the seller's historical performance, but this approach fails to reflect the real variability of the logistics process. As a result, the company's leadership has decided to develop a machine learning model capable of predicting the actual expected delivery date with greater accuracy. This would allow the platform to provide customers with more reliable delivery estimates, improve and reorganize logistics operations, recommend more efficient carriers, and identify orders at risk of delay.

## 2.0 Business Assumptions

The business assumption behind the delivery-date prediction initiative is that delays in the logistics chain are not random but follow identifiable patterns that can be learned from historical data. Factors such as the seller's handling performance, product characteristics, carrier efficiency, geographic distance, seasonality, and operational bottlenecks influence the actual delivery time more strongly than the static rules currently used by the company. By leveraging these patterns, a machine learning model should be able to estimate the expected delivery date more accurately than traditional business logic, which relies largely on distance and shipping type.

It is assumed that the available data contains enough variability and historical depth to capture the main drivers of delay, allowing the model to generalize to new orders. It is also assumed that improving delivery-date accuracy generates measurable business impact: better customer communication, fewer last-mile surprises, reduced complaint rates, and greater trust in the platform. Additionally, more precise predictions can support operational decisions, such as identifying high-risk orders, optimizing carrier selection, and improving seller performance monitoring. Under this assumption, a data-driven approach is expected to outperform rule-based estimation and provide competitive value for the marketplace's logistics ecosystem.

## 3.0 Solution Strategy

My solution to solve this problem will be the development of a data science project. This project will have a machine learning model capable of more accurately predicting the delivery date.

> A database was created using Docker. This database was populated with data to be accessed using the SQL language, in order to simulate accessing data from a real database. Below I will describe about all process to develop the machine learning model.

**Step 01. Data Description:** The data will be collected and studied. The missing values will be threated or removed. Finally, a initial data description will carried out to know the data. Therefore some calculations of descriptive statistics will be made, such as kurtosis, skewness, media, fashion, median and standard deviation.

**Step 02. Feature Engineering:** A mind map will be created to assist the creation of the hypothesis and the creation of new features. Features like distance between seller and customer using geodesic coordinates are derived. These assumptions will help in exploratory data analysis and may improve the model scores.

**Step 03. Data Filtering:** Data filtering is used to remove columns or rows that are not part of the business. For example, columns with customer ID, hash code or rows with age that does not consist of human age.

**Step 04. Exploratory Data Analysis:** The exploratory data analysis section consists of univariate analysis, bivariate analysis and multivariate analysis to assist in understanding of the database. The relationship between delivery time, distance, freight value, geolocation, and product characteristics are analyzed.

**Step 05. Data Preparation:** In this fifth section, the data will be prepared for machine learning modeling. Therefore, they will be transformed to improve the learning of the machine learning model, thus they can be encoded, oversampled, subsampled or rescaled.

**Step 06. Feature Selection:** After the data preparation in this section algorithms, like mRMR (Minimum Redundancy Maximum Relevance) and SelectFromModel, will select the best columns to be used for the training of the machine learning model. This reduces the dimensionality of the database and decreases the chances of overfitting.

**Step 07. Machine Learning Modeling:** Step 07 aims to train the machine learning algorithms and how they can predict the data. For validation the model is trained, validated and applied to cross validation to know the learning capacity of the model. Algorithms tested: LightGBM, XGBoost, and CatBoost.

**Step 08. Hyperparameter Fine Tuning:** Firstly selected the best model to be applied in the project, it's important to make a fine tuning of the parameters to improve its scores. Optuna is used for automated hyperparameter optimization with 3-fold cross-validation.

**Step 09. Conclusions:** This is a conclusion stage which the generation capacity model is tested using unseen data. In addition, some business questions are answered to show the applicability of the model in the business context.

**Step 10. Model Deploy:** This is the final step of the data science project. So, in this step the Flask API is created and the model and the functions are saved to be implemented in the API.

## 4.0 Top 3 Data Insights

* #### The distance between seller and customer is the most important factor for delivery time.

    **TRUE:** The SHAP analysis shows that `distance_customer_seller_min` is the most important feature, with a mean SHAP value of 1.39. The greater the distance, the longer the delivery time.

* #### The current rule-based method for estimating delivery dates performs worse than simply predicting the average.

    **TRUE:** The baseline method (`estimated_delivery_in_days`) achieved a negative R² of -6.1 on the OOT dataset. This means the rule-based approach is less accurate than using the mean delivery time for all orders.

* #### Higher freight values are associated with longer delivery times.

    **TRUE:** The feature `freight_value_min` is the second most important feature in the model (SHAP = 0.99). Higher freight values correlate with greater distances and longer delivery times.

![dataset_schema](reports/figures/dataset_schema.png)

## 5.0 Machine Learning Applied

Here's all cross validation results of the machine learning models with their default parameters. The cross validation method is important to show the capacity of the model to learn.

#### Baseline (Rule-Based Method)

|         Set         |   R²   |   RMSE   |   MAE   |
|:-------------------:|:------:|:--------:|:-------:|
|        Train        | -1.281 | 15.081   | 12.762  |
| OOT (Unseen Data)   | -6.097 | 15.469   | 12.756  |

#### LightGBM (Default Parameters)

|         Set         |   R²   |   RMSE   |   MAE   |
|:-------------------:|:------:|:--------:|:-------:|
|   CV (3-fold)       | 0.301 ± 0.005 | 8.348 ± 0.194 | 5.124 ± 0.031 |
|   OOT (Unseen Data) | 0.010  | 5.777    | 4.356   |

#### XGBoost (Default Parameters)

|         Set         |   R²   |   RMSE   |   MAE   |
|:-------------------:|:------:|:--------:|:-------:|
|   CV (3-fold)       | 0.247  | 8.590    | 5.269   |
|   OOT (Unseen Data) | 0.042  | 5.684    | 4.305   |

#### CatBoost (Default Parameters)

|         Set         |   R²   |   RMSE   |   MAE   |
|:-------------------:|:------:|:--------:|:-------:|
|   CV (3-fold)       | 0.254  | 8.405    | 5.195   |
|   OOT (Unseen Data) | 0.065  | 5.615    | 4.181   |

## 6.0 Machine Learning Performance

The chosen model was **LightGBM** and it was tuned using **Optuna** to improve their parameters and scores. Below there's a table with the capacity of the model to learn.

**Hyperparameters (Optuna-tuned):**

| Parameter | Value |
|:----------|:-----:|
| n_estimators | 832 |
| learning_rate | 0.0064 |
| num_leaves | 867 |
| subsample | 0.69 |
| colsample_bytree | 0.48 |
| min_data_in_leaf | 52 |

**Cross-Validation Performance:**

|      R²      |     MAE     |     RMSE    |
|:------------:|:-----------:|:-----------:|
| 0.301 ± 0.005 | 5.124 ± 0.031 | 8.348 ± 0.194 |

**Generalization on Unseen Data (OOT):**

|      R²     |    RMSE    |    MAE    |
|:-----------:|:----------:|:---------:|
|    0.010    |   5.777    |   4.356   |

**Top 10 Features by SHAP Importance:**

| Feature | Mean SHAP Value |
|:--------|:---------------:|
| distance_customer_seller_min | 1.392 |
| freight_value_min | 0.989 |
| customer_lat | 0.953 |
| order_purchase_timestamp_month | 0.828 |
| customer_lng | 0.817 |
| order_approved_at_month | 0.809 |
| distance_customer_seller_q25 | 0.645 |
| product_weight_g_min | 0.247 |
| product_length_cm_min | 0.231 |
| product_height_cm_min | 0.209 |

## 7.0 Business Results

* #### What is the model's MAE (Mean Absolute Error)?

    The model predicts delivery time with an average error of **4.36 days** on unseen data, compared to **12.76 days** from the current rule-based method.

* #### How much improvement does the ML model provide over the current method?

    The model reduces the **MAE by 65.9%** (from 12.76 to 4.36 days) and **RMSE by 62.6%** (from 15.47 to 5.78 days) on unseen data.

* #### How reliable is the model in predicting delivery dates?

    The model provides a delivery date **range of ±4 days** around the predicted date, giving customers a confidence interval rather than a single point estimate. For example, the API returns `{"date_min": "2018-07-06", "date_max": "2018-07-14"}`.

* #### What are the financial impacts of more accurate delivery estimates?

    More accurate estimates reduce customer service complaints, lower cancellation rates, decrease reshipping costs, and protect brand reputation. The current method has 25% late deliveries — the model aims to significantly reduce this rate.

* #### What is the expected reduction in late deliveries?

    While the model does not directly classify "on time" vs "late," the **66% reduction in MAE** means delivery estimates are much closer to reality, directly reducing the number of orders perceived as late by customers.

## 8.0 Conclusions

The dataset contains orders with delivery times varying from a few days to several weeks across Brazil's continental distances. The current rule-based estimation method performs worse than a simple average (negative R²), indicating significant room for improvement.

Despite the complexity and variability of the logistics chain, the LightGBM model achieves a Mean Absolute Error of **4.36 days**, a **66% improvement** over the current method's 12.76 days. This represents a substantial operational gain for the marketplace.

The model was deployed as a **Flask API** that accepts order data and returns a predicted delivery date range, providing practical value for customer-facing delivery estimates.

## 9.0 Lessons Learned

* The current rule-based method was **worse than predicting the mean** for all orders (R² = -6.1), highlighting that simple heuristics can be highly inaccurate in complex logistics chains.

* Geographic distance between seller and customer is the strongest predictor of delivery time, but combining it with product characteristics, payment data, and temporal features improves predictions.

* Feature selection with mRMR helped reduce dimensionality, but the model still shows low R² on unseen data (0.01), suggesting that external factors not captured in the data (weather, carrier availability, road conditions) play a significant role.

* A prediction interval (±4 days) is more practical for customer communication than a single point estimate, as it accounts for irreducible uncertainty in delivery logistics.

## 10.0 Next Steps

* Collect additional features such as carrier information, weather data, and road conditions to improve model performance.

* Implement seasonal adjustment for known bottlenecks (Black Friday, end-of-year holidays).

* Explore deep learning approaches (LSTM/Transformer) for time-series aware predictions.

* Integrate the API with a production database and develop a monitoring system for model performance drift.

* Deploy the API on a cloud platform (Heroku, AWS, or GCP).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
