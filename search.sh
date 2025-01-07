#!/bin/bash

# Warna untuk output
Merah='\033[0;31m'
Hijau='\033[0;32m'
Kuning='\033[1;33m'
Biru='\033[1;34m'
Putih='\033[1;37m'
NC='\033[0m' # No Color

# Header ASCII Art
cat << "EOF"
██████╗  ██████╗ ██████╗ ██╗  ██╗███████╗
██╔══██╗██╔═══██╗██╔══██╗██║  ██║██╔════╝
██████╔╝██║   ██║██║  ██║███████║█████╗
██╔═══╝ ██║   ██║██║  ██║██╔══██║██╔══╝
██║     ╚██████╔╝██████╔╝██║  ██║███████╗
╚═╝      ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
       Tugu Phantom - Dorking Unlimited
EOF

# Pilihan menu
echo -e "${Biru}[${Hijau}1${Biru}] ${Kuning}Auto Dorking"
echo -e "${Biru}[${Hijau}2${Biru}] ${Kuning}Gunakan Daftar Anda Sendiri${Putih}\n"

read -p $'\e[1;34m[\e[1;31m?\e[1;34m]\e[1;37m Pilih opsi (1 atau 2): \e[1;33m' option

# Fungsi untuk mendapatkan data dari Google CSE
function fetch_cse_data() {
    local dork="$1"
    local start=1
    local hasil_file="hasil_dorking_$(date +%Y%m%d%H%M%S).txt"
    echo -e "${Biru}[${Kuning}*${Biru}] ${Putih}Mengambil data untuk dork: ${Kuning}$dork${NC}"

    # Ambil konfigurasi CSE
    local cse=$(curl -s "https://cse.google.com/cse.js?hpg=1&cx=partner-pub-2698861478625135:3033704849")
    local cselibv=$(echo "$cse" | sed -n 38p | cut -d '"' -f4)
    local cse_token=$(echo "$cse" | grep -o "cse_token.*" | cut -d '"' -f3)
    local exp=$(echo "$cse" | sed -n 37p | cut -d '"' -f6)
    local encoded_dork=$(echo -ne "$dork" | od -An -tx1 | tr ' ' % | xargs printf "%s")

    # Ambil hasil dengan paginasi
    while true; do
        local get=$(curl -s -X GET "https://cse.google.com/cse/element/v1?rsz=filtered_cse&num=10&hl=en&source=gcsc&gss=.com&start=$start&cselibv=$cselibv&cx=partner-pub-2698861478625135:3033704849&q=$encoded_dork&safe=off&cse_tok=$cse_token&exp=csqr,$exp&oq=$encoded_dork&callback=google.search.cse.api16174" | grep -o "visibleUrl.*" | cut -d '"' -f3)

        if [[ -z "$get" ]]; then
            echo -e "${Kuning}[!] Tidak ada hasil lebih lanjut untuk dork: ${Putih}$dork${NC}"
            break
        fi

        echo "$get" | tee -a "$hasil_file"
        echo -e "${Hijau}[+] Batch hasil ditambahkan ke file: $hasil_file${NC}"

        # Increment halaman
        ((start += 10))
    done

    echo -e "${Hijau}[+] Semua hasil dork disimpan ke: $hasil_file${NC}"
}

# Opsi menu
case $option in
1)
    # Auto Dorking
    read -p $'\e[1;34m[\e[1;31m?\e[1;34m]\e[1;37m Masukkan dork: \e[1;33m' dork
    fetch_cse_data "$dork"
    ;;
2)
    # Gunakan daftar dork sendiri
    read -p $'\e[1;34m[\e[1;31m?\e[1;34m]\e[1;37m Masukkan nama file dork: \e[1;33m' file_dork
    if [[ -f $file_dork ]]; then
        echo -e "${Biru}[${Kuning}*${Biru}] ${Putih}Memproses daftar dork dari file: ${Kuning}$file_dork${NC}"
        while IFS= read -r line; do
            fetch_cse_data "$line"
        done < "$file_dork"
    else
        echo -e "${Merah}[!] File tidak ditemukan: $file_dork${NC}"
    fi
    ;;
*)
    echo -e "${Merah}[!] Pilihan tidak valid!${NC}"
    ;;
esac
