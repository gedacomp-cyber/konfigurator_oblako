# 🔧 Исправление ошибки "Access Denied" в GitHub Actions

## 🚨 Проблема
```
Access Denied: Unable to access GitHub app for this repository.
(Request ID: e3639778-e834-43ad-9ce2-4c5d64fd81dc)
```

## 🔍 Возможные причины

### 1. **Репозиторий приватный**
- GitHub Actions могут быть отключены для приватных репозиториев
- Или у вас нет прав на запуск Actions

### 2. **Права доступа**
- У вас может не быть прав администратора
- Или Actions отключены в настройках организации

### 3. **Организационные ограничения**
- В организации могут быть ограничения на Actions
- Или требуется одобрение администратора

## 🛠 Решения

### Шаг 1: Проверить статус репозитория
1. Перейдите в **Settings** → **Actions** → **General**
2. Убедитесь, что выбрано **"Allow all actions"**
3. Или **"Allow actions created by GitHub"**

### Шаг 2: Проверить права доступа
1. **Для личного репозитория:**
   - Вы должны быть владельцем репозитория

2. **Для репозитория организации:**
   - Попросите администратора организации дать вам права
   - Или попросите администратора включить Actions

### Шаг 3: Временное решение
Запустите workflow **"Debug Access Issues"** вручную:
1. Перейдите в **Actions** вкладку
2. Выберите **"Debug Access Issues"**
3. Нажмите **"Run workflow"**
4. Посмотрите логи - они покажут статус доступа

### Шаг 4: Альтернативные решения

#### Вариант A: Сделать репозиторий публичным
```bash
# Временно сделать публичным для тестирования
# Settings → Danger Zone → Make public
```

#### Вариант B: Использовать Personal Access Token
1. Создайте **Personal Access Token** в GitHub Settings
2. Добавьте его как секрет в репозитории
3. Обновите workflows для использования PAT вместо GITHUB_TOKEN

#### Вариант C: Использовать GitHub CLI
```bash
# Установить GitHub CLI
gh auth login

# Проверить статус
gh repo view --json isPrivate,viewerPermission

# Запустить workflow локально
gh workflow run "CI/CD Pipeline"
```

## 📞 Если ничего не помогает

### Связаться с администратором организации:
- Попросить включить GitHub Actions для репозитория
- Попросить дать права на запуск workflows
- Попросить проверить настройки организации

### Или создать новый репозиторий:
1. Создайте новый публичный репозиторий
2. Перенесите туда код
3. Протестируйте Actions там

## 🎯 Быстрая проверка

Запустите этот workflow для диагностики:
```bash
# В GitHub Actions интерфейсе:
Actions → "Debug Access Issues" → "Run workflow"
```

Логи покажут точный статус доступа к репозиторию.

## 📋 Полезные ссылки

- [GitHub Actions Permissions](https://docs.github.com/en/actions/security-guides/automatic-token-authentication)
- [Managing GitHub Actions settings](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository)
- [Troubleshooting GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/troubleshooting-workflows)
