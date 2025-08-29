# GitHub Background Agents Setup

Этот проект настроен с автоматическими background agents для работы с GitHub. Вот что было настроено:

## 🚀 Автоматические Workflows

### 1. CI/CD Pipeline (`.github/workflows/ci.yml`)
- **Триггеры**: Push в main/develop, Pull Requests
- **Функции**:
  - Автоматическое тестирование на Node.js 18.x и 20.x
  - Проверка качества кода (ESLint, TypeScript)
  - Сборка приложения
  - Автоматический деплой на GitHub Pages
  - Сканирование безопасности (npm audit, CodeQL)

### 2. Автоматическое создание Issues (`.github/workflows/issue-on-failure.yml`)
- **Триггер**: При падении основного CI/CD pipeline
- **Функции**:
  - Автоматическое создание issue с деталями ошибки
  - Предотвращение дублирования issues

### 3. Автоматические релизы (`.github/workflows/release.yml`)
- **Триггер**: Push тега в формате `v*` (например, `v1.0.0`)
- **Функции**:
  - Создание GitHub Release
  - Сборка production версии
  - Создание архива релиза

### 4. Еженедельное обновление зависимостей (`.github/workflows/dependency-updates.yml`)
- **Триггер**: Еженедельно по понедельникам в 09:00 UTC
- **Функции**:
  - Проверка устаревших зависимостей
  - Автоматическое обновление
  - Исправление уязвимостей безопасности
  - Создание Pull Request с обновлениями

## 🛠 Настройка

### Требования
1. Включите GitHub Pages в настройках репозитория
2. Убедитесь, что ветка `main` является default

### Переменные окружения
Все необходимые секреты (GITHUB_TOKEN) уже доступны автоматически.

## 📋 Использование

### Ручной запуск workflows
1. Перейдите во вкладку "Actions" в вашем репозитории
2. Выберите нужный workflow
3. Нажмите "Run workflow"

### Создание релиза
```bash
# Создайте и запушьте тег
git tag v1.0.0
git push origin v1.0.0
```

### Ручное обновление зависимостей
1. Перейдите в Actions → "Weekly Dependency Updates"
2. Нажмите "Run workflow"

## 🔧 Локальная разработка

```bash
# Установка зависимостей
cd sait
npm install

# Запуск в режиме разработки
npm start

# Сборка для продакшена
npm run build

# Проверка качества кода
npm run lint
npm run type-check

# Проверка безопасности
npm run audit
```

## 📊 Мониторинг

- **Actions**: Следите за выполнением workflows во вкладке Actions
- **Issues**: Автоматически создаваемые issues при ошибках
- **Releases**: Автоматически создаваемые релизы
- **Pull Requests**: Автоматические PR для обновления зависимостей

## 🚨 Troubleshooting

### Workflow не запускается
1. **Проверьте вкладку Actions** в вашем репозитории
2. **Запустите Test Workflow вручную**:
   - Перейдите в Actions → "Test Workflow"
   - Нажмите "Run workflow"
3. **Проверьте настройки**:
   - Убедитесь, что Actions включены для вашего репозитория
   - Проверьте, что пушите в правильную ветку (main/master)

### Проблемы с CI/CD Pipeline
1. **Проверьте логи** основного workflow
2. **Убедитесь в наличии** `sait/package.json`
3. **Запустите локально**:
   ```bash
   cd sait
   npm install
   npm run lint
   npm run build
   ```

### Проблемы с деплоем
1. **Включите GitHub Pages** в настройках репозитория
2. **Выберите источник**: "Deploy from a branch" → "gh-pages"
3. **Проверьте логи** deployment job

### Ручное тестирование
```bash
# Запустите тест скрипт
chmod +x test-github-actions.sh
./test-github-actions.sh
```

### Частые проблемы
- **npm ci fails**: Используйте `npm install` вместо `npm ci`
- **Missing package-lock.json**: Файл будет создан автоматически
- **Node.js version**: Убедитесь, что версия поддерживается



