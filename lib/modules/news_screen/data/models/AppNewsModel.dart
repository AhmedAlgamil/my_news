import 'dart:convert';

/// status : "ok"
/// totalResults : 34
/// articles : [{"source":{"id":"google-news","name":"Google News"},"author":"Al Masry Al Youm - المصري اليوم","title":"الآن.. طرق الحصول على نتيجة الشهادة الإعدادية 2023 بالرقم القومي في محافظات مصر - Al Masry Al Youm - المصري اليوم","description":null,"url":"https://news.google.com/rss/articles/CBMiMmh0dHBzOi8vd3d3LmFsbWFzcnlhbHlvdW0uY29tL25ld3MvZGV0YWlscy8yODk3Mjg20gEA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T12:20:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Sky News Arabia سكاي نيوز عربية","title":"لليوم الثاني.. الدفاع الروسية تعلن إسقاط 3 صواريخ ستورم شادو - Sky News Arabia سكاي نيوز عربية","description":null,"url":"https://news.google.com/rss/articles/CBMi3AJodHRwczovL3d3dy5za3luZXdzYXJhYmlhLmNvbS93b3JsZC8xNjI0NjUzLSVEOSU4NCVEOSU4NCVEOSU4QSVEOSU4OCVEOSU4NS0lRDglQTclRDklODQlRDglQUIlRDglQTclRDklODYlRDklOEEtJUQ4JUE3JUQ5JTg0JUQ4JUFGJUQ5JTgxJUQ4JUE3JUQ4JUI5LSVEOCVBNyVEOSU4NCVEOCVCMSVEOSU4OCVEOCVCMyVEOSU4QSVEOCVBOS0lRDglQUElRDglQjklRDklODQlRDklODYtJUQ4JUE3JUQ5JTk1JUQ4JUIzJUQ5JTgyJUQ4JUE3JUQ4JUI3LTMtJUQ4JUI1JUQ5JTg4JUQ4JUE3JUQ4JUIxJUQ5JThBJUQ4JUFFLSVEOCVCMyVEOCVBQSVEOSU4OCVEOCVCMSVEOSU4NS0lRDglQjQlRDglQTclRDglQUYlRDklODjSAeACaHR0cHM6Ly93d3cuc2t5bmV3c2FyYWJpYS5jb20vYW1wL3dvcmxkLzE2MjQ2NTMtJUQ5JTg0JUQ5JTg0JUQ5JThBJUQ5JTg4JUQ5JTg1LSVEOCVBNyVEOSU4NCVEOCVBQiVEOCVBNyVEOSU4NiVEOSU4QS0lRDglQTclRDklODQlRDglQUYlRDklODElRDglQTclRDglQjktJUQ4JUE3JUQ5JTg0JUQ4JUIxJUQ5JTg4JUQ4JUIzJUQ5JThBJUQ4JUE5LSVEOCVBQSVEOCVCOSVEOSU4NCVEOSU4Ni0lRDglQTclRDklOTUlRDglQjMlRDklODIlRDglQTclRDglQjctMy0lRDglQjUlRDklODglRDglQTclRDglQjElRDklOEElRDglQUUtJUQ4JUIzJUQ4JUFBJUQ5JTg4JUQ4JUIxJUQ5JTg1LSVEOCVCNCVEOCVBNyVEOCVBRiVEOSU4OA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T11:53:55Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Al Masry Al Youm - المصري اليوم","title":"بعد انخفاضها.. أسعار الذهب بمنتصف تعاملات اليوم الأحد 28 مايو 2023 - Al Masry Al Youm - المصري اليوم","description":null,"url":"https://news.google.com/rss/articles/CBMiMmh0dHBzOi8vd3d3LmFsbWFzcnlhbHlvdW0uY29tL25ld3MvZGV0YWlscy8yODk3MjE10gEA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T11:28:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Sky News Arabia سكاي نيوز عربية","title":"\"القطة الناخبة\" تخطف الأنظار.. مشاهد فريدة من انتخابات تركيا - Sky News Arabia سكاي نيوز عربية","description":null,"url":"https://news.google.com/rss/articles/CBMizQJodHRwczovL3d3dy5za3luZXdzYXJhYmlhLmNvbS93b3JsZC8xNjI0NjMwLSVEOCVBNyVEOSU4NCVEOSU4MiVEOCVCNyVEOCVBOS0lRDglQTclRDklODQlRDklODYlRDglQTclRDglQUUlRDglQTglRDglQTktJUQ4JUFBJUQ4JUFFJUQ4JUI3JUQ5JTgxLSVEOCVBNyVEOSU4NCVEOCVBNyVEOSU5NCVEOSU4NiVEOCVCOCVEOCVBNyVEOCVCMS0lRDklODUlRDglQjQlRDglQTclRDklODclRDglQUYtJUQ5JTgxJUQ4JUIxJUQ5JThBJUQ4JUFGJUQ4JUE5LSVEOCVBNyVEOSU4NiVEOCVBQSVEOCVBRSVEOCVBNyVEOCVBOCVEOCVBNyVEOCVBQS0lRDglQUElRDglQjElRDklODMlRDklOEElRDglQTfSAdECaHR0cHM6Ly93d3cuc2t5bmV3c2FyYWJpYS5jb20vYW1wL3dvcmxkLzE2MjQ2MzAtJUQ4JUE3JUQ5JTg0JUQ5JTgyJUQ4JUI3JUQ4JUE5LSVEOCVBNyVEOSU4NCVEOSU4NiVEOCVBNyVEOCVBRSVEOCVBOCVEOCVBOS0lRDglQUElRDglQUUlRDglQjclRDklODEtJUQ4JUE3JUQ5JTg0JUQ4JUE3JUQ5JTk0JUQ5JTg2JUQ4JUI4JUQ4JUE3JUQ4JUIxLSVEOSU4NSVEOCVCNCVEOCVBNyVEOSU4NyVEOCVBRi0lRDklODElRDglQjElRDklOEElRDglQUYlRDglQTktJUQ4JUE3JUQ5JTg2JUQ4JUFBJUQ4JUFFJUQ4JUE3JUQ4JUE4JUQ4JUE3JUQ4JUFBLSVEOCVBQSVEOCVCMSVEOSU4MyVEOSU4QSVEOCVBNw?oc=5","urlToImage":null,"publishedAt":"2023-05-28T11:06:06Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"العربية","title":"دينا الشربيني تكشف حقيقة ارتباطها بالفنان تامر حسني - العربية","description":null,"url":"https://news.google.com/rss/articles/CBMixAJodHRwczovL3d3dy5hbGFyYWJpeWEubmV0L2N1bHR1cmUtYW5kLWFydC8yMDIzLzA1LzI4LyVEOCVBRiVEOSU4QSVEOSU4NiVEOCVBNy0lRDglQTclRDklODQlRDglQjQlRDglQjElRDglQTglRDklOEElRDklODYlRDklOEEtJUQ4JUFBJUQ5JTgzJUQ4JUI0JUQ5JTgxLSVEOCVBRCVEOSU4MiVEOSU4QSVEOSU4MiVEOCVBOS0lRDglQTclRDglQjElRDglQUElRDglQTglRDglQTclRDglQjclRDklODclRDglQTctJUQ4JUE4JUQ4JUE3JUQ5JTg0JUQ5JTgxJUQ5JTg2JUQ4JUE3JUQ5JTg2LSVEOCVBQSVEOCVBNyVEOSU4NSVEOCVCMS0lRDglQUQlRDglQjMlRDklODYlRDklOEHSAcgCaHR0cHM6Ly93d3cuYWxhcmFiaXlhLm5ldC9hbXAvY3VsdHVyZS1hbmQtYXJ0LzIwMjMvMDUvMjgvJUQ4JUFGJUQ5JThBJUQ5JTg2JUQ4JUE3LSVEOCVBNyVEOSU4NCVEOCVCNCVEOCVCMSVEOCVBOCVEOSU4QSVEOSU4NiVEOSU4QS0lRDglQUElRDklODMlRDglQjQlRDklODEtJUQ4JUFEJUQ5JTgyJUQ5JThBJUQ5JTgyJUQ4JUE5LSVEOCVBNyVEOCVCMSVEOCVBQSVEOCVBOCVEOCVBNyVEOCVCNyVEOSU4NyVEOCVBNy0lRDglQTglRDglQTclRDklODQlRDklODElRDklODYlRDglQTclRDklODYtJUQ4JUFBJUQ4JUE3JUQ5JTg1JUQ4JUIxLSVEOCVBRCVEOCVCMyVEOSU4NiVEOSU4QQ?oc=5","urlToImage":null,"publishedAt":"2023-05-28T10:22:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Al Masry Al Youm - المصري اليوم","title":"«النواب» يوافق مبدئيًا على «الدمغة وتنمية الموارد».. و«معيط»: «البُن المحمص» لا يذهب للمقاهي - Al Masry Al Youm - المصري اليوم","description":null,"url":"https://news.google.com/rss/articles/CBMiMmh0dHBzOi8vd3d3LmFsbWFzcnlhbHlvdW0uY29tL25ld3MvZGV0YWlscy8yODk3MTY30gEA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T10:00:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Sky News Arabia سكاي نيوز عربية","title":"لافروف: الغرب \"يلعب بالنار\" بشأن تزويد كييف بـ\"أف-16\" - Sky News Arabia سكاي نيوز عربية","description":null,"url":"https://news.google.com/rss/articles/CBMipgJodHRwczovL3d3dy5za3luZXdzYXJhYmlhLmNvbS93b3JsZC8xNjI0NTk4LSVEOSU4NCVEOCVBNyVEOSU4MSVEOCVCMSVEOSU4OCVEOSU4MS0lRDglQTclRDklODQlRDglQkElRDglQjElRDglQTgtJUQ5JThBJUQ5JTg0JUQ4JUI5JUQ4JUE4LSVEOCVBOCVEOCVBNyVEOSU4NCVEOSU4NiVEOCVBNyVEOCVCMS0lRDglQTglRDglQjQlRDglQTclRDklOTQlRDklODYtJUQ4JUFBJUQ4JUIyJUQ5JTg4JUQ5JThBJUQ4JUFGLSVEOSU4MyVEOSU4QSVEOSU4QSVEOSU4MS0lRDglQTglRDklODAlRDglQTclRDklOTQlRDklODEtMTbSAaoCaHR0cHM6Ly93d3cuc2t5bmV3c2FyYWJpYS5jb20vYW1wL3dvcmxkLzE2MjQ1OTgtJUQ5JTg0JUQ4JUE3JUQ5JTgxJUQ4JUIxJUQ5JTg4JUQ5JTgxLSVEOCVBNyVEOSU4NCVEOCVCQSVEOCVCMSVEOCVBOC0lRDklOEElRDklODQlRDglQjklRDglQTgtJUQ4JUE4JUQ4JUE3JUQ5JTg0JUQ5JTg2JUQ4JUE3JUQ4JUIxLSVEOCVBOCVEOCVCNCVEOCVBNyVEOSU5NCVEOSU4Ni0lRDglQUElRDglQjIlRDklODglRDklOEElRDglQUYtJUQ5JTgzJUQ5JThBJUQ5JThBJUQ5JTgxLSVEOCVBOCVEOSU4MCVEOCVBNyVEOSU5NCVEOSU4MS0xNg?oc=5","urlToImage":null,"publishedAt":"2023-05-28T09:29:50Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Al Masry Al Youm - المصري اليوم","title":"صدمة في الأهلي قبل مباراة الوداد.. الإصابة تبعد حمدي فتحي - Al Masry Al Youm - المصري اليوم","description":null,"url":"https://news.google.com/rss/articles/CBMiMmh0dHBzOi8vd3d3LmFsbWFzcnlhbHlvdW0uY29tL25ld3MvZGV0YWlscy8yODk3MTEy0gEA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T08:39:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Sky News Arabia سكاي نيوز عربية","title":"أول رحلة تجارية للطائرة \"سي 919\" صينية الصنع - Sky News Arabia سكاي نيوز عربية","description":null,"url":"https://news.google.com/rss/articles/CBMi6QFodHRwczovL3d3dy5za3luZXdzYXJhYmlhLmNvbS93b3JsZC8xNjI0NTgxLSVEOCVCMSVEOCVBRCVEOSU4NCVEOCVBOS0lRDglQUElRDglQUMlRDglQTclRDglQjElRDklOEElRDglQTktJUQ5JTg0JUQ5JTg0JUQ4JUI3JUQ4JUE3JUQ5JThBJUQ5JTk0JUQ4JUIxJUQ4JUE5LSVEOCVCMyVEOSU4QS05MTktJUQ4JUI1JUQ5JThBJUQ5JTg2JUQ5JThBJUQ4JUE5LSVEOCVBNyVEOSU4NCVEOCVCNSVEOSU4NiVEOCVCOdIB7QFodHRwczovL3d3dy5za3luZXdzYXJhYmlhLmNvbS9hbXAvd29ybGQvMTYyNDU4MS0lRDglQjElRDglQUQlRDklODQlRDglQTktJUQ4JUFBJUQ4JUFDJUQ4JUE3JUQ4JUIxJUQ5JThBJUQ4JUE5LSVEOSU4NCVEOSU4NCVEOCVCNyVEOCVBNyVEOSU4QSVEOSU5NCVEOCVCMSVEOCVBOS0lRDglQjMlRDklOEEtOTE5LSVEOCVCNSVEOSU4QSVEOSU4NiVEOSU4QSVEOCVBOS0lRDglQTclRDklODQlRDglQjUlRDklODYlRDglQjk?oc=5","urlToImage":null,"publishedAt":"2023-05-28T08:06:42Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"الفجر","title":"سعر الدولار الآن|الجنيه يتحدى العملة الأمريكية..واختناق في السوق السوداء - الفجر","description":null,"url":"https://news.google.com/rss/articles/CBMiHmh0dHBzOi8vd3d3LmVsZmFnci5vcmcvNDY5NzQzMdIBAA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T07:58:01Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"اليوم السابع","title":"أسعار العملات اليوم الأحد 28-5-2023 أمام الجنيه المصرى - اليوم السابع","description":null,"url":"https://news.google.com/rss/articles/CBMiogJodHRwczovL3d3dy55b3VtNy5jb20vc3RvcnkvMjAyMy81LzI4LyVEOCVBMyVEOCVCMyVEOCVCOSVEOCVBNyVEOCVCMS0lRDglQTclRDklODQlRDglQjklRDklODUlRDklODQlRDglQTclRDglQUEtJUQ4JUE3JUQ5JTg0JUQ5JThBJUQ5JTg4JUQ5JTg1LSVEOCVBNyVEOSU4NCVEOCVBMyVEOCVBRCVEOCVBRi0yOC01LTIwMjMtJUQ4JUEzJUQ5JTg1JUQ4JUE3JUQ5JTg1LSVEOCVBNyVEOSU4NCVEOCVBQyVEOSU4NiVEOSU4QSVEOSU4Ny0lRDglQTclRDklODQlRDklODUlRDglQjUlRDglQjElRDklODkvNjE4NzE3NNIBngJodHRwczovL20ueW91bTcuY29tL2FtcC8yMDIzLzUvMjgvJUQ4JUEzJUQ4JUIzJUQ4JUI5JUQ4JUE3JUQ4JUIxLSVEOCVBNyVEOSU4NCVEOCVCOSVEOSU4NSVEOSU4NCVEOCVBNyVEOCVBQS0lRDglQTclRDklODQlRDklOEElRDklODglRDklODUtJUQ4JUE3JUQ5JTg0JUQ4JUEzJUQ4JUFEJUQ4JUFGLTI4LTUtMjAyMy0lRDglQTMlRDklODUlRDglQTclRDklODUtJUQ4JUE3JUQ5JTg0JUQ4JUFDJUQ5JTg2JUQ5JThBJUQ5JTg3LSVEOCVBNyVEOSU4NCVEOSU4NSVEOCVCNSVEOCVCMSVEOSU4OS82MTg3MTc0?oc=5","urlToImage":null,"publishedAt":"2023-05-28T07:50:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Masrawy - مصراوي","title":"الأمطار الآن تتجه شرقا.. تفاصيل حالة الطقس لحظة بلحظة - Masrawy - مصراوي","description":null,"url":"https://news.google.com/rss/articles/CBMizAJodHRwczovL3d3dy5tYXNyYXd5LmNvbS9uZXdzL25ld3NfZWd5cHQvZGV0YWlscy8yMDIzLzUvMjgvMjQyMDE5MC8lRDglQTclRDklODQlRDglQTMlRDklODUlRDglQjclRDglQTclRDglQjEtJUQ4JUE3JUQ5JTg0JUQ4JUEyJUQ5JTg2LSVEOCVBQSVEOCVBQSVEOCVBQyVEOSU4Ny0lRDglQjQlRDglQjElRDklODIlRDglQTctJUQ4JUFBJUQ5JTgxJUQ4JUE3JUQ4JUI1JUQ5JThBJUQ5JTg0LSVEOCVBRCVEOCVBNyVEOSU4NCVEOCVBOS0lRDglQTclRDklODQlRDglQjclRDklODIlRDglQjMtJUQ5JTg0JUQ4JUFEJUQ4JUI4JUQ4JUE5LSVEOCVBOCVEOSU4NCVEOCVBRCVEOCVCOCVEOCVBOdIB0AJodHRwczovL3d3dy5tYXNyYXd5LmNvbS9uZXdzL25ld3NfZWd5cHQvZGV0YWlscy8yMDIzLzUvMjgvMjQyMDE5MC8lRDglQTclRDklODQlRDglQTMlRDklODUlRDglQjclRDglQTclRDglQjEtJUQ4JUE3JUQ5JTg0JUQ4JUEyJUQ5JTg2LSVEOCVBQSVEOCVBQSVEOCVBQyVEOSU4Ny0lRDglQjQlRDglQjElRDklODIlRDglQTctJUQ4JUFBJUQ5JTgxJUQ4JUE3JUQ4JUI1JUQ5JThBJUQ5JTg0LSVEOCVBRCVEOCVBNyVEOSU4NCVEOCVBOS0lRDglQTclRDklODQlRDglQjclRDklODIlRDglQjMtJUQ5JTg0JUQ4JUFEJUQ4JUI4JUQ4JUE5LSVEOCVBOCVEOSU4NCVEOCVBRCVEOCVCOCVEOCVBOT9hbXA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T07:49:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"CNN Arabic","title":"عثرة بسيطة قد تسبب لك مشكلة كبيرة.. كيف تحافظ على قوة العظام مع التقدم بالسن؟ - CNN Arabic","description":null,"url":"https://news.google.com/rss/articles/CBMiWmh0dHBzOi8vYXJhYmljLmNubi5jb20vc2NpZW5jZS1hbmQtaGVhbHRoL3ZpZGVvL3YxMzg0MTcta2VlcGluZy1ib25lcy1zdHJvbmctYXMteW91LWFnZS1obdIBYmh0dHBzOi8vYXJhYmljLmNubi5jb20vYW1waHRtbC9zY2llbmNlLWFuZC1oZWFsdGgvdmlkZW8vdjEzODQxNy1rZWVwaW5nLWJvbmVzLXN0cm9uZy1hcy15b3UtYWdlLWht?oc=5","urlToImage":null,"publishedAt":"2023-05-28T07:43:14Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"اليوم السابع","title":"نونو سانتو مستمر مع اتحاد جدة بعد التتويج بالدوري السعودي - اليوم السابع","description":null,"url":"https://news.google.com/rss/articles/CBMi1wJodHRwczovL3d3dy55b3VtNy5jb20vc3RvcnkvMjAyMy81LzI4LyVEOSU4NiVEOSU4OCVEOSU4NiVEOSU4OC0lRDglQjMlRDglQTclRDklODYlRDglQUElRDklODgtJUQ5JTg1JUQ4JUIzJUQ4JUFBJUQ5JTg1JUQ4JUIxLSVEOSU4NSVEOCVCOS0lRDglQTclRDglQUElRDglQUQlRDglQTclRDglQUYtJUQ4JUFDJUQ4JUFGJUQ4JUE5LSVEOCVBOCVEOCVCOSVEOCVBRi0lRDglQTclRDklODQlRDglQUElRDglQUElRDklODglRDklOEElRDglQUMtJUQ4JUE4JUQ4JUE3JUQ5JTg0JUQ4JUFGJUQ5JTg4JUQ4JUIxJUQ5JThBLSVEOCVBNyVEOSU4NCVEOCVCMyVEOCVCOSVEOSU4OCVEOCVBRiVEOSU4QS82MTk0NTU30gHTAmh0dHBzOi8vbS55b3VtNy5jb20vYW1wLzIwMjMvNS8yOC8lRDklODYlRDklODglRDklODYlRDklODgtJUQ4JUIzJUQ4JUE3JUQ5JTg2JUQ4JUFBJUQ5JTg4LSVEOSU4NSVEOCVCMyVEOCVBQSVEOSU4NSVEOCVCMS0lRDklODUlRDglQjktJUQ4JUE3JUQ4JUFBJUQ4JUFEJUQ4JUE3JUQ4JUFGLSVEOCVBQyVEOCVBRiVEOCVBOS0lRDglQTglRDglQjklRDglQUYtJUQ4JUE3JUQ5JTg0JUQ4JUFBJUQ4JUFBJUQ5JTg4JUQ5JThBJUQ4JUFDLSVEOCVBOCVEOCVBNyVEOSU4NCVEOCVBRiVEOSU4OCVEOCVCMSVEOSU4QS0lRDglQTclRDklODQlRDglQjMlRDglQjklRDklODglRDglQUYlRDklOEEvNjE5NDU1Nw?oc=5","urlToImage":null,"publishedAt":"2023-05-28T07:37:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Goal.com","title":"\"تم منعي\" .. أوليفر كان يشن هجومًا ضاريًا على بايرن ميونخ بعد إقالته | العربية Goal.com - Goal.com","description":null,"url":"https://news.google.com/rss/articles/CBMi5wJodHRwczovL3d3dy5nb2FsLmNvbS9hci8lRDglQTMlRDglQUUlRDglQTglRDglQTclRDglQjEvJUQ5JTg1JUQ5JTg2JUQ4JUI5JUQ5JThBLSVEOCVBNyVEOSU5NCVEOSU4OCVEOSU4NCVEOSU4QSVEOSU4MSVEOCVCMS0lRDklODMlRDglQTclRDklODYtJUQ5JThBJUQ4JUI0JUQ5JTg2LSVEOSU4NyVEOCVBQyVEOSU4OCVEOSU4NSVEOSU4QiVEOCVBNy0lRDglQjYlRDglQTclRDglQjElRDklOEElRDklOEIlRDglQTctJUQ4JUE4JUQ4JUE3JUQ5JThBJUQ4JUIxJUQ5JTg2LSVEOSU4NSVEOSU4QSVEOSU4OCVEOSU4NiVEOCVBRS0lRDglQTclRDklOTUlRDklODIlRDglQTclRDklODQlRDglQUElRDklODcvYmx0ZGUwZTJkZGE2MDE5N2MwNNIBAA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T07:29:04Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Al Masry Al Youm - المصري اليوم","title":"ارتفاع مؤشرات البورصة بداية تداولات اليوم الأحد 28 مايو - Al Masry Al Youm - المصري اليوم","description":null,"url":"https://news.google.com/rss/articles/CBMiMmh0dHBzOi8vd3d3LmFsbWFzcnlhbHlvdW0uY29tL25ld3MvZGV0YWlscy8yODk3MDY30gEA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T07:28:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Masrawy - مصراوي","title":"هبوط طائرة مصرية بسلام في جدة بعد انفجار أحد إطاراتها - Masrawy - مصراوي","description":null,"url":"https://news.google.com/rss/articles/CBMi0wJodHRwczovL3d3dy5tYXNyYXd5LmNvbS9uZXdzL25ld3NfZWd5cHQvZGV0YWlscy8yMDIzLzUvMjgvMjQyMDE2NC8lRDklODclRDglQTglRDklODglRDglQjctJUQ4JUI3JUQ4JUE3JUQ4JUE2JUQ4JUIxJUQ4JUE5LSVEOSU4NSVEOCVCNSVEOCVCMSVEOSU4QSVEOCVBOS0lRDglQTglRDglQjMlRDklODQlRDglQTclRDklODUtJUQ5JTgxJUQ5JThBLSVEOCVBQyVEOCVBRiVEOCVBOS0lRDglQTglRDglQjklRDglQUYtJUQ4JUE3JUQ5JTg2JUQ5JTgxJUQ4JUFDJUQ4JUE3JUQ4JUIxLSVEOCVBMyVEOCVBRCVEOCVBRi0lRDglQTUlRDglQjclRDglQTclRDglQjElRDglQTclRDglQUElRDklODclRDglQTfSAdcCaHR0cHM6Ly93d3cubWFzcmF3eS5jb20vbmV3cy9uZXdzX2VneXB0L2RldGFpbHMvMjAyMy81LzI4LzI0MjAxNjQvJUQ5JTg3JUQ4JUE4JUQ5JTg4JUQ4JUI3LSVEOCVCNyVEOCVBNyVEOCVBNiVEOCVCMSVEOCVBOS0lRDklODUlRDglQjUlRDglQjElRDklOEElRDglQTktJUQ4JUE4JUQ4JUIzJUQ5JTg0JUQ4JUE3JUQ5JTg1LSVEOSU4MSVEOSU4QS0lRDglQUMlRDglQUYlRDglQTktJUQ4JUE4JUQ4JUI5JUQ4JUFGLSVEOCVBNyVEOSU4NiVEOSU4MSVEOCVBQyVEOCVBNyVEOCVCMS0lRDglQTMlRDglQUQlRDglQUYtJUQ4JUE1JUQ4JUI3JUQ4JUE3JUQ4JUIxJUQ4JUE3JUQ4JUFBJUQ5JTg3JUQ4JUE3P2FtcA?oc=5","urlToImage":null,"publishedAt":"2023-05-28T07:11:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"اليوم السابع","title":"انطلاق فعاليات ملتقى بناة مصر بحضور رئيس الوزراء ووزيرى الإسكان والكهرباء - اليوم السابع","description":null,"url":"https://news.google.com/rss/articles/CBMi-wJodHRwczovL3d3dy55b3VtNy5jb20vc3RvcnkvMjAyMy81LzI4LyVEOCVBNyVEOSU4NiVEOCVCNyVEOSU4NCVEOCVBNyVEOSU4Mi0lRDklODElRDglQjklRDglQTclRDklODQlRDklOEElRDglQTclRDglQUEtJUQ5JTg1JUQ5JTg0JUQ4JUFBJUQ5JTgyJUQ5JTg5LSVEOCVBOCVEOSU4NiVEOCVBNyVEOCVBOS0lRDklODUlRDglQjUlRDglQjEtJUQ4JUE4JUQ4JUFEJUQ4JUI2JUQ5JTg4JUQ4JUIxLSVEOCVCMSVEOCVBNiVEOSU4QSVEOCVCMy0lRDglQTclRDklODQlRDklODglRDglQjIlRDglQjElRDglQTclRDglQTEtJUQ5JTg4JUQ5JTg4JUQ4JUIyJUQ5JThBJUQ4JUIxJUQ5JTg5LSVEOCVBNyVEOSU4NCVEOCVBNSVEOCVCMyVEOSU4MyVEOCVBNyVEOSU4Ni82MTk0NTEx0gH3Amh0dHBzOi8vbS55b3VtNy5jb20vYW1wLzIwMjMvNS8yOC8lRDglQTclRDklODYlRDglQjclRDklODQlRDglQTclRDklODItJUQ5JTgxJUQ4JUI5JUQ4JUE3JUQ5JTg0JUQ5JThBJUQ4JUE3JUQ4JUFBLSVEOSU4NSVEOSU4NCVEOCVBQSVEOSU4MiVEOSU4OS0lRDglQTglRDklODYlRDglQTclRDglQTktJUQ5JTg1JUQ4JUI1JUQ4JUIxLSVEOCVBOCVEOCVBRCVEOCVCNiVEOSU4OCVEOCVCMS0lRDglQjElRDglQTYlRDklOEElRDglQjMtJUQ4JUE3JUQ5JTg0JUQ5JTg4JUQ4JUIyJUQ4JUIxJUQ4JUE3JUQ4JUExLSVEOSU4OCVEOSU4OCVEOCVCMiVEOSU4QSVEOCVCMSVEOSU4OS0lRDglQTclRDklODQlRDglQTUlRDglQjMlRDklODMlRDglQTclRDklODYvNjE5NDUxMQ?oc=5","urlToImage":null,"publishedAt":"2023-05-28T06:55:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"اليوم السابع","title":"أطعمة الإفطار الصحية للحفاظ على نشاطك طوال اليوم - اليوم السابع","description":null,"url":"https://news.google.com/rss/articles/CBMiqwJodHRwczovL3d3dy55b3VtNy5jb20vc3RvcnkvMjAyMy81LzI4LyVEOCVBMyVEOCVCNyVEOCVCOSVEOSU4NSVEOCVBOS0lRDglQTclRDklODQlRDglQTUlRDklODElRDglQjclRDglQTclRDglQjEtJUQ4JUE3JUQ5JTg0JUQ4JUI1JUQ4JUFEJUQ5JThBJUQ4JUE5LSVEOSU4NCVEOSU4NCVEOCVBRCVEOSU4MSVEOCVBNyVEOCVCOC0lRDglQjklRDklODQlRDklODktJUQ5JTg2JUQ4JUI0JUQ4JUE3JUQ4JUI3JUQ5JTgzLSVEOCVCNyVEOSU4OCVEOCVBNyVEOSU4NC0lRDglQTclRDklODQlRDklOEElRDklODglRDklODUvNjE5NDA3NdIBpwJodHRwczovL20ueW91bTcuY29tL2FtcC8yMDIzLzUvMjgvJUQ4JUEzJUQ4JUI3JUQ4JUI5JUQ5JTg1JUQ4JUE5LSVEOCVBNyVEOSU4NCVEOCVBNSVEOSU4MSVEOCVCNyVEOCVBNyVEOCVCMS0lRDglQTclRDklODQlRDglQjUlRDglQUQlRDklOEElRDglQTktJUQ5JTg0JUQ5JTg0JUQ4JUFEJUQ5JTgxJUQ4JUE3JUQ4JUI4LSVEOCVCOSVEOSU4NCVEOSU4OS0lRDklODYlRDglQjQlRDglQTclRDglQjclRDklODMtJUQ4JUI3JUQ5JTg4JUQ4JUE3JUQ5JTg0LSVEOCVBNyVEOSU4NCVEOSU4QSVEOSU4OCVEOSU4NS82MTk0MDc1?oc=5","urlToImage":null,"publishedAt":"2023-05-28T05:00:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"Sky News Arabia سكاي نيوز عربية","title":"بذكرى تأسيسها.. هجوم \"هائل\" وإسقاط 40 مسيرة روسية فوق كييف - Sky News Arabia سكاي نيوز عربية","description":null,"url":"https://news.google.com/rss/articles/CBMiuAJodHRwczovL3d3dy5za3luZXdzYXJhYmlhLmNvbS93b3JsZC8xNjI0NTY1LSVEOCVBOCVEOCVCMCVEOSU4MyVEOCVCMSVEOSU4OS0lRDglQUElRDglQTclRDklOTQlRDglQjMlRDklOEElRDglQjMlRDklODclRDglQTctJUQ5JTg3JUQ4JUFDJUQ5JTg4JUQ5JTg1LSVEOSU4NyVEOCVBNyVEOSU4QSVEOSU5NCVEOSU4NC0lRDklODglRDglQTclRDklOTUlRDglQjMlRDklODIlRDglQTclRDglQjctNDAtJUQ5JTg1JUQ4JUIzJUQ5JThBJUQ4JUIxJUQ4JUE5LSVEOCVCMSVEOSU4OCVEOCVCMyVEOSU4QSVEOCVBOS0lRDklODMlRDklOEElRDklOEElRDklODHSAbwCaHR0cHM6Ly93d3cuc2t5bmV3c2FyYWJpYS5jb20vYW1wL3dvcmxkLzE2MjQ1NjUtJUQ4JUE4JUQ4JUIwJUQ5JTgzJUQ4JUIxJUQ5JTg5LSVEOCVBQSVEOCVBNyVEOSU5NCVEOCVCMyVEOSU4QSVEOCVCMyVEOSU4NyVEOCVBNy0lRDklODclRDglQUMlRDklODglRDklODUtJUQ5JTg3JUQ4JUE3JUQ5JThBJUQ5JTk0JUQ5JTg0LSVEOSU4OCVEOCVBNyVEOSU5NSVEOCVCMyVEOSU4MiVEOCVBNyVEOCVCNy00MC0lRDklODUlRDglQjMlRDklOEElRDglQjElRDglQTktJUQ4JUIxJUQ5JTg4JUQ4JUIzJUQ5JThBJUQ4JUE5LSVEOSU4MyVEOSU4QSVEOSU4QSVEOSU4MQ?oc=5","urlToImage":null,"publishedAt":"2023-05-28T04:41:04Z","content":null}]

AppNewsModel appNewsModelFromJson(String str) =>
    AppNewsModel.fromJson(json.decode(str));

String appNewsModelToJson(AppNewsModel data) => json.encode(data.toJson());

class AppNewsModel {
  AppNewsModel({
    String? status,
    num? totalResults,
    List<Articles>? articles,
  }) {
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
  }

  AppNewsModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles?.add(Articles.fromJson(v));
      });
    }
  }

  String? _status;
  num? _totalResults;
  List<Articles>? _articles;

  AppNewsModel copyWith({
    String? status,
    num? totalResults,
    List<Articles>? articles,
  }) =>
      AppNewsModel(
        status: status ?? _status,
        totalResults: totalResults ?? _totalResults,
        articles: articles ?? _articles,
      );

  String? get status => _status;

  num? get totalResults => _totalResults;

  List<Articles>? get articles => _articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalResults'] = _totalResults;
    if (_articles != null) {
      map['articles'] = _articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// source : {"id":"google-news","name":"Google News"}
/// author : "Al Masry Al Youm - المصري اليوم"
/// title : "الآن.. طرق الحصول على نتيجة الشهادة الإعدادية 2023 بالرقم القومي في محافظات مصر - Al Masry Al Youm - المصري اليوم"
/// description : null
/// url : "https://news.google.com/rss/articles/CBMiMmh0dHBzOi8vd3d3LmFsbWFzcnlhbHlvdW0uY29tL25ld3MvZGV0YWlscy8yODk3Mjg20gEA?oc=5"
/// urlToImage : null
/// publishedAt : "2023-05-28T12:20:00Z"
/// content : null

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  Articles({
    Source? source,
    String? author,
    String? title,
    dynamic description,
    String? url,
    dynamic urlToImage,
    String? publishedAt,
    dynamic content,
    bool isLiked = true,
  }) {
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
    _isLiked = isLiked;
  }

  Articles.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
    _isLiked = false;
  }

  Source? _source;
  String? _author;
  String? _title;
  dynamic _description;
  String? _url;
  dynamic _urlToImage;
  String? _publishedAt;
  dynamic _content;
  bool _isLiked = false;

  Articles copyWith({
    Source? source,
    String? author,
    String? title,
    dynamic description,
    String? url,
    dynamic urlToImage,
    String? publishedAt,
    dynamic content,
  }) =>
      Articles(
        source: source ?? _source,
        author: author ?? _author,
        title: title ?? _title,
        description: description ?? _description,
        url: url ?? _url,
        urlToImage: urlToImage ?? _urlToImage,
        publishedAt: publishedAt ?? _publishedAt,
        content: content ?? _content,
      );

  Source? get source => _source;

  String? get author => _author;

  String? get title => _title;

  dynamic get description => _description;

  String? get url => _url;

  dynamic get urlToImage => _urlToImage;

  String? get publishedAt => _publishedAt;

  dynamic get content => _content;

  bool? get isLiked => _isLiked;

  set isLiked(bool? value) {
    _isLiked = value!;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    map['content'] = _content;
    return map;
  }
}

/// id : "google-news"
/// name : "Google News"

Source sourceFromJson(String str) => Source.fromJson(json.decode(str));

String sourceToJson(Source data) => json.encode(data.toJson());

class Source {
  Source({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Source.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  String? _id;
  String? _name;

  Source copyWith({
    String? id,
    String? name,
  }) =>
      Source(
        id: id ?? _id,
        name: name ?? _name,
      );

  String? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
