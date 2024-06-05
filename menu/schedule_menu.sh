view_schedule() {
    cat database/schedule/schedule.txt
    read choice
    clear

    case $choice in
        1) depart=malang
        ;;
        2) depart=lawang
        ;;
        3) depart=surabaya
        ;;
        4) depart=wonokromo
        ;;
        *)
        echo "Pilihan tidak valid. Silakan coba lagi."
        return 1
        ;;
    esac

    cat database/schedule/$depart/schedule_$depart.txt
        read arriv
        clear
        if  [ $arriv -gt 4 ]
        then
            echo "Pilihan tidak valid. Silakan coba lagi."
            return 1
        else
            cat "database/schedule/$depart/schedule_$depart$arriv.txt"
            read
        fi

    export depart
    export arriv
}