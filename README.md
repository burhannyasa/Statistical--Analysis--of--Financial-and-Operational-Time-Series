# Statistical Analysis of Financial and Operational Time Series

Bu proje, Zaman Serileri Analizi dersi kapsamında gerçekleştirilmiş olup; finansal, çevresel ve operasyonel verilerin istatistiksel yöntemlerle analizini, bileşenlerine ayrıştırılmasını (decomposition), durağanlaştırma tekniklerini ve gelecek döneme yönelik tahminlerin modellenmesini R programlama dili kullanarak kapsamaktadır.

---

## 📊 Proje Kapsamı ve Veri Setleri

Projede kullanılan veri setleri ve uygulanan teknikler şunlardır:

### 1. Finansal Veri Analizi (Google Hisse Senedi Fiyatları)
- **Amaç:** Google'ın (GOOGL) günlük kapanış fiyatlarına dayalı olarak piyasa hareketlerinin indekslenmesi ve görselleştirilmesi.
- **Kullanılan Yöntemler:** Sabit Esaslı Endeks, Zincirleme (Bileşik) Esaslı Endeks hesaplamaları.
- **Veri Kaynağı:** `quantmod` paketi aracılığıyla Yahoo Finance.

### 2. Operasyonel Veri Analizi (AirPassengers)
- **Amaç:** Uluslararası havayolu yolcu sayılarındaki trend ve mevsimsel etkilerin analizi ve ARIMA/ARMA modelleri ile tahminleme.
- **Kullanılan Yöntemler:** Çarpımsal Ayrıştırma (Multiplicative Decomposition), Durağanlaştırma (Fark alma, Log dönüşümü), ARIMA/ARMA Modellemesi.
- **Veri Kaynağı:** R `datasets` paketi.

### 3. Çevresel Veri Analizi (Nottem)
- **Amaç:** Nottingham Kalesi'ndeki ortalama aylık sıcaklıkların uzun vadeli analizi.
- **Kullanılan Yöntemler:** Toplamsal Ayrıştırma (Additive Decomposition), STL Ayrıştırma.
- **Veri Kaynağı:** R `datasets` paketi.

---

## 🚀 Öne Çıkan Bulgular (Key Outputs)

* **Google:** Sabit esaslı indeks analizinde, hisse senedinin baz tarihine göre %100'ün üzerinde değer kazandığı, ancak zincirleme endeks ile günlük volatilite düzeyi yüksek olduğu tespit edilmiştir.
* **AirPassengers:** ARIMA(2,1,1)(0,1,0)[12] modeli ile yapılan tahminlerde, yolcu sayısının artmaya devam edeceği ancak belirsizlik aralığının (confidence interval) uzun vadede genişlediği gözlemlenmiştir.
* **Nottem:** Sıcaklık verisinde belirgin bir yıllık mevsimsellik (sezonsallık) gözlemlenmiş olup, uzun vadeli bir trend belirlenememiştir.

---

## 🛠 Teknik Altyapı
- **Dil:** R
- **Temel Kütüphaneler:** `quantmod`, `forecast`, `tseries`, `ggplot2`, `fpp2`, `TTR`

## 📂 Proje Yapısı
- `/data`: Kullanılan veri setleri (CSV formatında).
- `/notebooks`: Analiz kodları (Rmd - R Markdown dosyaları).
- `/outputs`: Analizler sonucu üretilen grafikler (PNG) ve tablolar.
- `/report`: Projenin detaylı PDF raporu.
- `README.md`: Proje dokümantasyonu.
