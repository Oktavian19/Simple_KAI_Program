HISTORY_FILE="database/history.txt"

view_history() {
    echo "History penyewaan untuk $username:"
    grep "^$username," $HISTORY_FILE | while IFS="," read -r username_field date_field departure_field arrival_field sch_time ticket_amount total_ticket; do
    echo "-----------------------------------"
    echo "          Bukti Transaksi          "
    echo "-----------------------------------"
    echo "Tanggal Pemesanan     : $date_field"
    echo "Stasiun Keberangkatan : $departure_field"
    echo "Stasiun Kedatangan    : $arrival_field"
    echo "Jadwal Perjalanan     : $sch_time"
    echo "Jumlah Tiket          : $ticket_amount"
    echo "Total Pembayaran      : Rp$total_ticket"
    echo "-----------------------------------"
    echo ""
    done
    total=$(grep "^$username," $HISTORY_FILE | awk -F "," '{sum += $7} END {print sum}')
    echo "Total pembayaran keseluruhan: Rp$total"
    echo -n "-- Tekan apa saja untuk melanjutkan --"
    read
    clear
}