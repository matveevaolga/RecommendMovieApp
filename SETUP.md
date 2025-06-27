# Настройка проекта

## Настройка TMDB API

1. Создайте файл `.env` в корне проекта
2. Добавьте в него ваш API ключ:

```bash
TMDB_API_KEY=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOTA0NTE2ZTQ3ZmQyZDBmOGY3YTZhNGQ0OWFmZGJlZiIsIm5iZiI6MTcwNjIyMTU0MS44ODksInN1YiI6IjY1YjJkZmU1ODczZjAwMDE3YmY1M2Q3YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7qdUoEyPXaPPjzLt23lcimPwvONgAhrMF-owHWo01V4
TMDB_BASE_URL=https://api.themoviedb.org/3
```

## Важно!

- Не коммитьте файл `.env` в Git
- Файл `.env` уже добавлен в `.gitignore`
- Используйте `env.example` как шаблон для создания `.env`