
# 💬 PHP Social Messenger

**PHP Social Messenger** is a powerful, **real-time messaging** platform designed for seamless communication. It features a modern, responsive interface built with **PHP, MySQL, and AJAX** to ensure instant message delivery without page reloads. Whether you're managing a contact list, blocking unwanted users, or updating your digital identity, this app handles it all with a smooth, native feel.

---

## ✨ Features

### 1️⃣ Real-Time Messaging ⚡
* **Instant Sync:** Messages appear in real-time using AJAX polling.
* **Message Status:** Track unread counts and see the latest activity at a glance.
* **Interaction:** Built-in support to **copy or delete** specific messages.

### 2️⃣ User Management & Security 🚫
* **Dynamic Search:** Find users instantly via the real-time search bar.
* **Block System:** Prevent specific users from contacting you. Integrated alerts notify blocked parties if they attempt to send a message.
* **Authentication:** Secure login and signup flow with password hashing.

### 3️⃣ Profile Customization 👤
* **Personal Identity:** Easily update your full name, email, and password.
* **Avatar Uploads:** Support for custom profile pictures stored securely in the `src/images/profile-picture/` directory.

---

## 🛠 Default Users (Demo Data)

| 👤 Full Name | Username | 📝 Role | 🔑 Password |
| :--- | :--- | :--- | :--- |
| **Subankar Dey** | `subho` | Developer / Admin | aaaa |
| **Fayaz Ali** | `ashfaq` | Test User | aaaa |

> **Note:** All demo accounts use the same hashed password from the SQL dump.

---

## ⚙️ Installation Guide

Follow these steps to set up the messenger on your local XAMPP/WAMP environment:

### 1️⃣ Clone & Navigate
```bash
git clone https://github.com/Subankar-Dey/php-social-messenger.git
cd php-social-messenger
````

### 2️⃣ Database Setup

1.  Open **phpMyAdmin**.
2.  Create a database named `social_messenger_db`.
3.  Import the provided `.sql` file found in your project root or `db/` folder.

### 3️⃣ Configuration

Update your database credentials in your connection file (usually `config.php` or `db_config.php`):

```php
<?php
define("DB_SERVER", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "");
define("DB_NAME", "social_messenger_db");
?>
```

### 4️⃣ Launch

Move the folder to your server's root (e.g., `htdocs`) and visit:
`http://localhost/php-social-messenger/login`

-----

## 📂 Project Structure

```text
├── api/              # RESTful API endpoints for Auth & Messaging
├── login/            # Login page logic & views
├── logout/           # Session termination
├── signup/           # User registration
└── src/              # Assets & Frontend
    ├── css/          # Custom styling & Bootstrap
    ├── js/           # AJAX & Real-time logic
    └── images/       # UI assets & Profile pictures
```

## 🖥 Technologies Used

-----

## 📜 License

Distributed under the **MIT License**. See `LICENSE` for more information.

## 🤝 Contributing

Contributions make the open-source community an amazing place\!

1.  **Fork** the Project.
2.  Create your **Feature Branch** (`git checkout -b feature/AmazingFeature`).
3.  **Commit** your Changes (`git commit -m 'Add some AmazingFeature'`).
4.  **Push** to the Branch (`git push origin feature/AmazingFeature`).
5.  Open a **Pull Request**.

-----

**Developed with ❤️ by [Subankar Dey](https://github.com/Subankar-Dey/)**

```
