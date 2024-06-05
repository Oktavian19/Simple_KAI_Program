# Menu saat belum login
main_menu() {
    echo "==========================="
    echo "        KAI ACCESS         "
    echo "==========================="
    echo "1. Login"
    echo "2. Register"
    echo "3. Lihat Jadwal"
    echo "4. Keluar"
    echo "==========================="
    echo -n "Masukkan pilihan Anda: "
    read choice

    case $choice in
        1)
        clear
        source ./function/login.sh
        login
        ;;
        2)
        clear
        source ./function/register.sh
        register
        ;;
        3)
        clear
        source ./menu/schedule_menu.sh
        view_schedule
        ;;
        4) 
        exit 0 
        ;;
        *)
        clear
        echo "Pilihan tidak valid. Silakan coba lagi."
        ;;
    esac
}