# ==============================================================================
# Hava Yolu Yolcu Say??s?? Zaman Serisi Analizi (AirPassengers)

# Metodoloji: Klasik Ayr????t??rma, ARIMA ve ??stel D??zeltme (ETS) Modelleri
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. K??t??phanelerin Y??klenmesi
# ------------------------------------------------------------------------------
library(ggplot2)
library(forecast)
library(tseries)
library(fpp2)
library(TTR)
library(plotly)
library(datasets)

# ------------------------------------------------------------------------------
# 2. Veri Haz??rl?????? ve G??rselle??tirme
# ------------------------------------------------------------------------------
data("AirPassengers")
ts_data <- AirPassengers

# Klasik Zaman Serisi Grafi??i
plot(ts_data, main="AirPassengers Zaman Serisi (1949-1960)", 
     xlab="Y??l", ylab="Yolcu Say??s??", col="darkblue", lwd=2)

# ggplot2 ile Modern G??rselle??tirme
ts_df <- data.frame(
  Month = as.Date(time(ts_data)),
  Passengers = as.numeric(ts_data)
)

ggplot(ts_df, aes(x = Month, y = Passengers)) +
  geom_line(color = "blue", size = 1) +
  labs(title = "Hava Yolu Yolcu Say??s?? Trend Analizi", x = "Y??l", y = "Yolcu Say??s??") +
  theme_minimal()

# ------------------------------------------------------------------------------
# 3. Zaman Serisi Ayr????t??rma (Decomposition)
# ------------------------------------------------------------------------------
# ??arp??msal Model (Varyans zamanla artt?????? i??in tercih edilmi??tir)
air_decomp <- decompose(ts_data, type = "multiplicative")
plot(air_decomp, col="purple")

# Bile??enleri Tekil ??nceleme
par(mfrow=c(2,2))
plot(air_decomp$trend, main="Trend", col="blue")
plot(air_decomp$seasonal, main="Mevsimsellik", col="red")
plot(air_decomp$random, main="Rassall??k", col="green")
plot(ts_data / air_decomp$seasonal, main="Mevsimsellikten Ar??nd??r??lm????", col="darkgreen")
par(mfrow=c(1,1))

# ------------------------------------------------------------------------------
# 4. Hareketli Ortalamalar ve Yumu??atma (Smoothing)
# ------------------------------------------------------------------------------
# 12 Ayl??k Basit Hareketli Ortalama (SMA)
sma_12 <- SMA(ts_data, n = 12)
plot(ts_data, main = "12 Ayl??k Hareketli Ortalama Trendi", col = "gray")
lines(sma_12, col = "red", lwd = 2)

# ------------------------------------------------------------------------------
# 5. Otokorelasyon ve Dura??anl??k Testleri
# ------------------------------------------------------------------------------
# ACF ve Gecikme Diyagramlar??
ggAcf(ts_data, main = "Otokorelasyon Fonksiyonu (ACF)")
gglagplot(ts_data, main = "Gecikme Diyagramlar??")

# Box-Ljung Testi (Beyaz G??r??lt?? Kontrol??)
Box.test(ts_data, lag = 10, type = "Ljung-Box")

# ------------------------------------------------------------------------------
# 6. Tahminleme Modelleri (Forecasting)
# ------------------------------------------------------------------------------

# 6.1. ??stel D??zeltme Y??ntemleri (ETS / Holt-Winters)
hw_model <- hw(ts_data, seasonal = "multiplicative") # Holt-Winters
fit_ets  <- ets(ts_data)                            # Otomatik ETS

# 6.2. ARIMA Modelleme (Dura??anla??t??rma Dahil)
# Varyans?? sabitlemek i??in Log d??n??????m?? uygulanm????t??r
log_series <- log(ts_data)
auto_arima_model <- auto.arima(log_series, seasonal = TRUE)
forecast_arima <- forecast(auto_arima_model, h = 12)

# ------------------------------------------------------------------------------
# 7. Model Performans De??erlendirmesi
# ------------------------------------------------------------------------------
# E??itim ve Test Seti Ayr??m?? (Son 12 ay test)
train <- window(ts_data, end = c(1959, 12))
test  <- window(ts_data, start = c(1960, 1))

model_train <- auto.arima(train)
fc_test <- forecast(model_train, h = 12)

# Hata Metrikleri (RMSE, MAE)
accuracy(fc_test, test)

# Kal??nt?? Analizi
checkresiduals(model_train)

# ------------------------------------------------------------------------------
# 8. Nihai Tahmin G??rselle??tirme
# ------------------------------------------------------------------------------
autoplot(forecast_arima) +
  labs(title = "ARIMA(log) Modeli ile 12 Ayl??k Yolcu Say??s?? Tahmini", 
       x = "Y??l", y = "Log(Yolcu Say??s??)") +
  theme_minimal()





















