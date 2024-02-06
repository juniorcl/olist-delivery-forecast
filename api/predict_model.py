import json
import joblib

import pandas as pd


def convert_dict_into_dataframe(dict_data):
    
    df_data = pd.DataFrame({key: [val] for key, val in dict_data.items()})
    
    return df_data


def get_prediction(df):

    list_selected_features = [
        'distance_customer_seller_min',
        'product_height_cm_min',
        'distance_customer_seller_q25',
        'freight_value_min',
        'customer_lat',
        'order_approved_at_second',
        'customer_lng',
        'order_purchase_timestamp_month',
        'product_length_cm_min',
        'product_weight_g_min',
        'payment_value_q75',
        'payment_value_max',
        'payment_value_mean',
        'order_approved_at_month']
    
    model = joblib.load('../../models/machine_learning_model_from_5.0_api_development.joblib')

    df.loc[:, 'pred'] = model.predict(df[list_selected_features])

    return df


def get_date_prediction(df):

    df['pred_int'] = df['pred'].round().astype(int)
    
    df['date_pred'] = df.apply(lambda i: i['order_purchase_timestamp'] + pd.DateOffset(day=i['pred_int']), axis=1)

    df['date_pred_max'] = df['date_pred'] + pd.DateOffset(days=4)

    df['date_pred_min'] = df['date_pred'] - pd.DateOffset(days=4)
    
    return df


def get_result(json_data):

    df = convert_dict_into_dataframe(json_data)

    df['order_purchase_timestamp'] = pd.to_datetime(df['order_purchase_timestamp'], format='%Y-%m-%d %H:%M:%S')
    df['time'] = pd.to_datetime(df['time'], format='%Y-%m-%d')

    df = get_prediction(df)

    df = get_date_prediction(df)

    pred_max = df['date_pred_max'].dt.strftime('%Y-%m-%d')[0]
    pred_min = df['date_pred_min'].dt.strftime('%Y-%m-%d')[0]

    json_result = {'date_min': pred_min, 'date_max': pred_max}
    
    return json.dumps(json_result)