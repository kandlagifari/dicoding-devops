#! bin/bash

# Mendefinisikan nama user
name="sleeping-knight"

# Mencetak teks awal
echo "Hello, my name is ${name}"

# Set counter
counter=0

# true sebagai penanda bahwa perulangan ini berlangsung sebanyak 3 kali
while [ ${counter} -lt 3 ]
 
do
 
   # menampilkan ukuran memory pada sistem dalam satuan megabytes    
   echo "========================== Menampilkan Ukuran Memory pada Sistem dalam Satuan Megabytes =========================="
   awk '{$2=$2/1024;$3="MB"} 1' /proc/meminfo | column -t 
   echo -e "\n"
   # tunda 3 detik setelah perintah sebelumnya dijalankan
   sleep 1
 
   # menampilkan penggunaan ruang disk pada filesystem dalam satuan gigabytes
   echo "==================== Menampilkan Penggunaan Ruang Disk pada Filesystem dalam Satuan Gigabytes ====================" 
   df -H
   echo -e "\n"
   # tunda 3 detik setelah perintah sebelumnya dijalankan
   sleep 1
 
   # menampilkan penggunaan ruang disk pada filesystem hanya untuk kolom filesystem dan use%, serta tanpa menyertakan tmpfs
   echo "=== Menampilkan Penggunaan Ruang Disk pada Filesystem Untuk Kolom Filesystem dan Use%, Tanpa Menyertakan tmpfs ==="
   df -x tmpfs --output=source,pcent
   echo -e "\n"
   # tunda 1 menit setelah perintah sebelumnya dijalankan
   sleep 1

   # Tambah counter
   counter=$((counter+1))
 
done
