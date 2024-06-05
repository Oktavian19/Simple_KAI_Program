# Menu utama setelah login
user_menu() {
    echo "==========================="
    echo "        KAI ACCESS         "
    echo "==========================="
    echo "1. Lihat Jadwal Kereta"
    echo "2. Pilih Stasiun Keberangkatan"
    echo "3. Riwayat Pembelian Tiket"
    echo "4. Keluar"
    echo "==========================="
    echo -n "Masukkan pilihan Anda: "
    read choice
    clear

    case $choice in
        1)
        source ./menu/schedule_menu.sh
        view_schedule
        ;;
        2)
        source ./menu/select_menu.sh
        select_menu
        ;;
        3)
        source ./function/history.sh
        view_history
        ;;
        4)
        exit 0
        ;;
        *)
        echo "Pilihan tidak valid. Silakan coba lagi."
        ;;
    esac
}