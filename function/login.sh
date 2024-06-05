USER_FILE="database/users.txt"

login() {
    read -rp "Masukkan username: " username
    read -rsp "Masukkan Password: " password
    clear
    if grep -q "$username,$password" $USER_FILE; then
        clear
        echo -e "\nLogin berhasil."
        logged_in=1
    else
        clear
        echo -e "\nLogin gagal. User tidak ditemukan."
        logged_in=0
        return
    fi
}