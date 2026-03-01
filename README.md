# 📊 Statistical Analysis of Financial and Operational Time Series

Bu proje, finansal, çevresel ve operasyonel veriler üzerinde ekonometrik zaman serisi analizleri ve tahminleme yöntemlerini kapsamlı bir şekilde incelemektedir. Çalışmada **Google Hisse Fiyatları**, **Avrupa Borsa Endeksleri (EuStockMarkets)**, **Hava Yolu Yolcu Sayısı (AirPassengers)** ve **Sıcaklık Verileri (Nottem)** analiz edilmiştir.

## 📈 Proje Kapsamı ve Veri Setleri

Projede kullanılan veri setleri ve uygulanan teknikler şunlardır:

### 1. Finansal Veri Analizi (Google Hisse Senedi Fiyatları)
- **Amaç:** Google'ın (GOOGL) günlük kapanış fiyatlarına dayalı olarak piyasa hareketlerinin indekslenmesi ve görselleştirilmesi.
- **Kullanılan Yöntemler:** Sabit Esaslı Endeks, Zincirleme (Bileşik) Esaslı Endeks hesaplamaları.
- **Veri Kaynağı:** `quantmod` paketi aracılığıyla Yahoo Finance.

### 2. Avrupa Borsaları Analizi (EuStockMarkets)
- **Amaç:** Farklı Avrupa borsa endekslerinin (DAX, SMI, CAC, FTSE) aynı baz seviyesine çekilerek karşılaştırmalı analizi.
- **Kullanılan Yöntemler:** Normalizasyon, Karşılaştırmalı Zaman Serisi Grafikleri.
- **Veri Kaynağı:** R `datasets` paketi.

### 3. Operasyonel Veri Analizi (AirPassengers)
- **Amaç:** Uluslararası havayolu yolcu sayılarındaki trend ve mevsimsel etkilerin analizi ve ARIMA/ARMA modelleri ile tahminleme.
- **Kullanılan Yöntemler:** Çarpımsal Ayrıştırma (Multiplicative Decomposition), Durağanlaştırma (Fark alma, Log dönüşümü), ARIMA/ARMA Modellemesi.
- **Veri Kaynağı:** R `datasets` paketi.

### 4. Çevresel Veri Analizi (Nottem)
- **Amaç:** Nottingham Kalesi'ndeki ortalama aylık sıcaklıkların uzun vadeli analizi.
- **Kullanılan Yöntemler:** Toplamsal Ayrıştırma (Additive Decomposition), STL Ayrıştırma.
- **Veri Kaynağı:** R `datasets` paketi.

---

## 🚀 Öne Çıkan Bulgular (Key Outputs)

* **Google:** Hisse senedinin baz tarihine göre %100'ün üzerinde değer kazandığı, ancak zincirleme endeks ile günlük volatilite düzeyinin yüksek olduğu tespit edilmiştir.
* **EuStockMarkets:** Endekslerin birbirleriyle yüksek korelasyon içinde hareket ettiği, ancak düşüş ve yükseliş zamanlarında farklılaşabildikleri gözlemlenmiştir.
* **AirPassengers:** ARIMA(2,1,1)(0,1,0)[12] modeli ile yapılan tahminlerde, yolcu sayısının artmaya devam edeceği ancak belirsizlik aralığının (confidence interval) uzun vadede genişlediği gözlemlenmiştir.
* **Nottem:** Sıcaklık verisinde belirgin bir yıllık mevsimsellik (sezonsallık) gözlemlenmiş olup, uzun vadeli bir trend belirlenememiştir.
  

🖼️ Analiz Görselleri ve Teknik Atıflar

1. Google Hisse Senedi Endeks Karşılaştırması
outputs/google_index_analysis.png

Analiz: Sabit ve Bileşik Esaslı Endeks hesaplamaları.

Yorum: Google hisse senedinin baz dönemine oranla sergilediği büyüme performansı ve günlük volatilite yapısı bu grafik üzerinden analiz edilmiştir.

2. Avrupa Borsa Endeksleri (DAX ve FTSE)
outputs/eustock_dax_ftse_comparison.png

Analiz: Karşılaştırmalı Zaman Serisi Analizi.

Yorum: Alman (DAX) ve İngiliz (FTSE) borsalarının zaman içindeki korelasyonu ve birbirlerine göre relatif getiri performansları karşılaştırılmıştır.

3. AirPassengers Mevsimsellikten Arındırılmış Seri
outputs/airpassengers_seasonally_adjusted.png

Analiz: Mevsimsel Arındırma (Seasonal Adjustment).

Yorum: Hava yolu yolcu sayısındaki mevsimsel gürültü temizlenerek, serinin altındaki ana yükseliş trendi daha belirgin hale getirilmiştir.

4. Nottem Toplamsal Ayrıştırma (Decomposition)
outputs/nottem_decomposition.png

Analiz: Additive Decomposition (Trend, Seasonal, Random).

Yorum: Sıcaklık verilerinin mevsimsel döngüleri ile hata payları birbirinden ayrıştırılmış; verinin durağanlığı ve periyodik yapısı incelenmiştir.

---

## 🛠 Teknik Altyapı
- **Dil:** R
- **Temel Kütüphaneler:** `quantmod`, `forecast`, `tseries`, `ggplot2`, `fpp2`, `TTR`

## 📂 Proje Yapısı
- `/data`: Kullanılan veri setleri (CSV formatında).
- `/notebooks`: R analiz kodları.
- `/outputs`: Analizler sonucu üretilen grafikler (PNG).
- `/report`: Projenin detaylı PDF raporu.
- `README.md`: Proje dokümantasyonu.
