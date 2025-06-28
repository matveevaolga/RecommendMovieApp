# RecommendMovieApp

# Настройка проекта

## Настройка TMDB API

1. В корне проекта создайте файл:  
   - `Configs/Secrets.xcconfig` (если папки `Configs` нет — создайте её).  
2. Добавьте в него ваш ключ в формате:  
   API_KEY = ваш_ключ_здесь
3. Подключите конфиг в Xcode
   - Откройте настройки проекта → вкладка Info
   - Для Debug и Release конфигураций укажите Configs/Secrets.xcconfig
4. Добавьте в Info.plist:
   
   - Вставьте перед закрывающим </dict>:
     
        <key>TMDB_API_KEY</key>
        
        <string>$(TMDB_API_KEY)</string>
