# 💰 Finance Tracker

A simple Ruby on Rails web application for tracking personal income and expenses. Users can log transactions, categorize them, and view a live financial summary.

---

## 🚀 Features

- Add, view, and delete financial transactions
- Categorize transactions (e.g. income, rent, groceries)
- Automatic calculation of:
  - ✅ Total income
  - ❌ Total expenses
  - 💵 Balance
- Color-coded transaction amounts (green for income, red for expenses)
- Clean and responsive layout

---

## 🛠️ Tech Stack

- **Ruby on Rails 8**
- **PostgreSQL** (as database)
- **HTML + ERB**
- **CSS** (custom styling via `application.css`)
- **Turbo (Hotwire)** for fast page updates

---

---

## ⚙️ Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/your-username/rails-finance-tracker.git
cd rails-finance-tracker
```

### 2. Install Dependencies 

```bash
bundle install
```
### 3. Set up the Database

```bash
rails db:create
rails db:migrate
```
## 4. Start the Server
```bash
rails server
```
