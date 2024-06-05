USER_FILE="database/users.txt"

register() {
    read -rp "Masukkan username: " new_username
    read -rsp "Masukkan Password: " new_password
    echo "$new_username,$new_password" >> $USER_FILE
    echo -e "\nUser '$new_username' berhasil didaftarkan."
}