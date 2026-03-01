---
title: "Statistical Analysis of Financial and Operational Time Series"
output: html_notebook
---

# 1. Proje Özeti
Bu proje, eğilimleri, mevsimselliği anlamak ve istatistiksel modeller kullanarak tahminler yapmak için üç farklı zaman serisi veri setini analiz eder.

- **Veri 1:** AirPassengers (Operasyonel Veri)
- **Veri 2:** Nottem (Çevresel Veri)
- **Veri 3:** Google Hisse Senedi Fiyatları (Finansal Veri)

---

# 2. Bölüm 1: Operasyonel Veri Analizi (AirPassengers)
1949-1960 yılları arasındaki uluslararası havayolu yolcu sayılarının aylık toplamlarının analizi.

```{r, message=FALSE, warning=FALSE}
# Gerekli kütüphaneleri yükleyelim
library(ggplot2)
library(datasets)
library(TTR)
library(fpp2)
library(forecast)
library(plotly)
library(tseries)

# Veriyi yükleyelim
data("AirPassengers")
ts_data <- AirPassengers

# Görselleştirme
plot(ts_data, main="AirPassengers Zaman Serisi", 
     xlab="Yıl", ylab="Yolcu Sayısı", col="blue")

# Mevsimsel varyasyon trendle birlikte arttığı için çarpımsal (multiplicative) ayrıştırma kullanıyoruz.

airpassengers_decomp <- decompose(AirPassengers, type = "multiplicative")
plot(airpassengers_decomp)


# ARIMA ile Tahmin

# Otomatik ARIMA modeli
model <- auto.arima(AirPassengers)
summary(model)

# Tahmin
forecast_arima <- forecast(model, h = 12)
autoplot(forecast_arima) +
  labs(title = "ARIMA Tahmini", x = "Yıl", y = "Yolcu Sayısı") +
  theme_minimal()


#Çevresel Veri Analizi (Nottem)
#Nottingham Kalesi'ndeki ortalama aylık sıcaklıkların analizi.


# Veriyi yükleyelim
data("nottem")

# Görselleştirme
plot(nottem, main="Nottem Sıcaklık Zaman Serisi", col="darkred")

# Ayrıştırma
nottem_decomp <- decompose(nottem, type = "additive")
plot(nottem_decomp)


# Finansal Veri Analizi (Google)
# Google hisse senedi fiyatları için sabit ve zincirleme esaslı endekslerin hesaplanması (2020-2023).


# Veriyi indir
library(quantmod)
getSymbols("GOOG", src = "yahoo", from = "2020-01-01", to = "2023-12-31")

# Ön işleme
close_prices <- as.numeric(Cl(GOOG))
dates <- index(GOOG)

# Sabit Esaslı Endeks (Baz = İlk Gün)
sabit_indeks <- close_prices / close_prices[1] * 100

# Zincirleme Esaslı Endeks (Baz = Önceki Gün)
returns <- diff(close_prices) / close_prices[-length(close_prices)]
bilesik_indeks <- cumprod(1 + returns) * 100


# Endeks Görselleştirme

# Endeksleri Çiz
plot(dates, sabit_indeks, type = "l", col = "blue", 
     main = "Sabit ve Zincirleme Esaslı Endeksler",
     ylab = "Endeks", xlab = "Tarih")
lines(dates[-1], bilesik_indeks, col = "red")
legend("topleft", legend = c("Sabit Esaslı", "Zincirleme Esaslı"), 
       col = c("blue", "red"), lty = 1)





Sonuç

AirPassengers veri seti güçlü bir yukarı yönlü trend ve çarpımsal mevsimsellik göstermektedir.

Nottem verisi, belirgin bir uzun vadeli trend olmaksızın net bir yıllık mevsimsellik sergilemektedir.

Google hisse senedi endeksleri, analiz edilen dönemdeki önemli piyasa dalgalanmalarını vurgulamaktadır.


































