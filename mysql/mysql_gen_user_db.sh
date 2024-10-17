#!/bin/bash

# Meminta input untuk nama database
read -p "Masukkan nama database: " DB_NAME

# Meminta input untuk nama pengguna
read -p "Masukkan nama pengguna: " DB_USER

# Meminta input untuk kata sandi
read -s -p "Masukkan kata sandi untuk pengguna '${DB_USER}': " DB_PASSWORD
echo # Untuk baris baru setelah input kata sandi

# Login ke MySQL sebagai root dan menjalankan perintah
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -u root -p -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
mysql -u root -p -e "FLUSH PRIVILEGES;"

echo "Database '${DB_NAME}' dan pengguna '${DB_USER}' telah dibuat dengan sukses."
