HISTORY_FILE="database/history.txt"

select_menu() {
    source ./menu/schedule_menu.sh
    if view_schedule 
    then
        read -rp "Masukkan tanggal pemesanan(YYYY-MM-DD): " ticket_date
        if check_date $ticket_date 
        then
          echo -n "Pilih Jadwal: "
          read no
          IFS="," read -r sch_name sch_departure sch_arrive price arriv < <(grep "^sch_$no" database/schedule/$depart/data/$arriv.txt)
          echo "Berhasil mencari kereta asal $depart menuju $arriv untuk jadwal $sch_departure-$sch_arrive!"
          echo -n "Masukkan jumlah kursi yang ingin dipesan: "
          read ticket_amount
          total_price=$(($ticket_amount * $price))
          clear
          echo "Tiket Kereta asal $depart menuju $arriv untuk jadwal $sch_departure-$sch_arrive sejumlah $ticket_amount kursi berhasil dipesan!"
          echo "Total yang harus dibayarkan : $total_price"
          echo "$username,`date '+%Y-%m-%d %H:%M'`,$depart,$arriv,$sch_departure-$sch_arrive,$ticket_amount,$total_price" >> $HISTORY_FILE 
          read  
        else
          echo "Tanggal tidak sesuai!"
        fi
    fi
}

check_date() {
    input_date=$1

    # Convert the input date to the end of the day (23:59:59)
    input_date_seconds=$(date -d "$input_date 23:59:59" +%s 2>/dev/null)

    # Check if the date command was successful
    if [ $? -ne 0 ]; then
        echo "Invalid date format: $input_date"
        return 1  # false
    fi

    # Get the current date in seconds since epoch
    current_date_seconds=$(date +%s)

    if [ "$input_date_seconds" -ge "$current_date_seconds" ]; then
        return 0  # true
    else
        return 1  # false
    fi
}