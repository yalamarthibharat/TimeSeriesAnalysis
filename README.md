## Time Series Analysis

Time series is a sequence taken at successive equally spaced points in time. It is widely used in various fields such as statistics, pattern recognition, weather forecasting and other prominent science and engineering domains. A time series is said to be stationary if its statistical properties like mean, variance, autocorrelation are all constant over time. Time series modelling is a method which deals with time based data and used for efficient decision making. This project implements the following time series models:

 * Auto Regression - Autoregressive model predicts the future values based on the past behaviour of the data. An autoregressive process    operates under the premise that past values have an effect on current values. A process considered AR(1) is the first                    order process, meaning that the current value is based on the immediately preceding value. An AR(2) process has the                        current value based on the previous two values.
 
  * Moving Average - Moving average model uses past forecast errors in a regression-like model.The moving average model specifies that the output variable depends linearly on the current and various past values. It is a smoothening and filtering process. MA(3) represents that 
the output average is calculated for the 3 day interval and that interval is moved from start to end. Here 3 represents the size of the window which is represented by q.

 * Auto Regressive - Moving Average model - It is the combination of autoregressive and moving average models. It is represented as ARMA(p,q) which consists of p AR terms and q MA terms. This model expresses the estimated value at time t as the sum of q terms that represent the average variation of random variation over q previous periods, plus the sum of p AR terms that compute the current value of x as the weighted sum of the p most recent values.
 
 All the above models assume that the time series is stationary. But that won't be the case all the time, most of the time the data contains trends and seasonality. So we have to make the series stationary by removing trends and seasonality to apply the above models. 

This project implements all the above time series models mentioned with various parameters. It includes dealing with the data that has trends and seasonality. The code removes the trends and seasonality to make the time series stationary in order to fit with one of the above models. Time series data from various domains are taken and implemented in this project such as:

 * CO2 measurement model
 * Electricity production model
 * Milk production model
 * Wisconsin Employment model
 * Oklahoma weather model
