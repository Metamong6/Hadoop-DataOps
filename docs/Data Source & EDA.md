## Data Source / EDA
[Data source / EDA](https://www.notion.so/Data-source-EDA-a7cfe455b6e9451c9df0aebb535dd073)
### Data source

**Data 참조 - [NYC Taxi Data](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page) 및 [Kaggle](https://www.kaggle.com/competitions/new-york-city-taxi-fare-prediction/data)**

사용할 feature 목록(raw data - [apache parquet](https://parquet.apache.org/) - yellow taxi data 2017 ~ 2018)

### EDA - Exploratory Data Analysis

**NYC Taxi Data**

2017-01 data

![Untitled](https://user-images.githubusercontent.com/102719063/203528456-cc1379a8-2801-4e65-ba11-5e7da5eb44eb.png)

→ 9710820 rows × 19 columns

![Untitled (1)](https://user-images.githubusercontent.com/102719063/203528426-775b26d2-6215-4032-b05f-3f2dd91fab7c.png)

→ 전체 컬럼

### Target:

- fare_amount

### Features:

- ~~~ VendorID ~~~
    - tpep_pickup_datetime
    - tpep_dropoff_datetime
    - passenger_count
    - trip_distance
    - RatecodeID
    - ~~~ store_and_fwd_flag ~~~
    - PULocationID
    - DOLocationID
    - payment_type
    - ~~~ extra ~~~
    - ~~~ mta_tax ~~~
    - ~~~ tip_amount ~~~
    - ~~~ tolls_amount ~~~
    - ~~~ improvement_surcharge ~~~
    - ~~~ total_amount ~~~
    - ~~~ congestion_surcharge ~~~
    - ~~~ airport_fee ~~~
        
        
        중요도가 높지않은 부가적인 요금인 tax와 tip은 제외했다. 
        
        total amount 의 경우도 tip+tax+fare amount 포함이였기 때문에 제외시켰다.
        
        ![Untitled (2)](https://user-images.githubusercontent.com/102719063/203528434-97a0440b-3f06-47c7-b456-d9baa928f595.png)
        
- 결측치 제거
    
    ![Untitled (3)](https://user-images.githubusercontent.com/102719063/203528439-a7d9296c-a210-43a0-9788-9a8a933db325.png)
    
- 이상치 제거
    
    ![Untitled (4)](https://user-images.githubusercontent.com/102719063/203528443-040fee74-aa0e-4641-aef5-973c0c47fae6.png)
    

### **Correlation Visualization**

상관관계 시각화

![Untitled (5)](https://user-images.githubusercontent.com/102719063/203528447-36ef99c7-c352-4a65-a401-f127460160e2.png)

![Untitled (6)](https://user-images.githubusercontent.com/102719063/203528448-e3cfa982-c628-455d-907a-b6623802482a.png)

### feature engineering & ML

- categorical columns (ID→ category) & drive time diff(이동시간 계산)
    
    ![Untitled (7)](https://user-images.githubusercontent.com/102719063/203528452-2a6942ec-9fbe-4429-85fa-7d86c1627da7.png)
    

- XGBoost regressor & mean squared error
    
    ![Untitled (8)](https://user-images.githubusercontent.com/102719063/203528453-65314cf2-3b1c-4e5e-9d38-56bc00f6119b.png)
