# Technical Test Folkatech DevOps Engineer

Task : Tugas dari kandidat adalah menyediakan aplikasi Node.js dengan pilihan nginx/httpd frontend proxy

Explanation :

Aplikasi node.js(folder node-application) : berisikan code syntax node.js yang mempunyai fungsi untuk membangun sebuah infrastruktur server sederhana. 

Script.sh : berisikan perintah perintah syntaks yang berfungsi untuk perantara antara aplikasi node.js dengan terraform, configuration nginx, dan juga ada penambahan firewal dan iptable.  

Terraform : berfungsi sebagai “infrastructure as code” tool atau bisa disebut automation tool untuk menjalankan infrasturcture tasks

AWS (Amazon Web Services) : Penyedia layanan cloud (platform cloud) yang aman

Nginx : merupakan Web server yang juga berfungsi sebagai email proxy, reverse proxy, dan load balancer. Struktur software ini bersifat asinkron dan event-driven; yang memungkinkan banyak request atau permintaan diproses pada waktu bersamaan

Main.tf : berisi file konfigurasi yang akan kita gunakan nantinya contoh seperti, kita akan membuat vpc, subnet, security group dan juga instance dll

Node.js application diakses dari clone dengan link github account https://github.com/dhemoz/server-node.git yang berada di script.sh dan dijalankan oleh terraform

Flow Process Program:
Terraform melalui script.sh dapat mengakses aplikasi node.js dan beberapa perintah syntax yg kita siapkan untuk membangun infrastruktur server, sekaligus configuration server dan proxy. Setelah itu, Terraform akan meneruskan perintah ke aws dan melakukan proses configuration secara automasi dari perintah-perintah yang diberikan . dan pada akhirnya akan muncul instance yang memberikan akses untuk memanage SSH

Step:

1. Install AWS CLI pada Laptop/Komputer

Petunjuk: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

2. Install Terraform sesuai dengan OS Device anda

Petunjuk: https://developer.hashicorp.com/terraform/downloads

3.Sign Up Akun AWS

Petunjuk: https://portal.aws.amazon.com/billing/signup
  (Memerlukan kartu VISA/Mastercard yang akan di verifikasi oleh AWS Amazon)

4.Buat akun AWS IAM
Petunjuk Lhttps://docs.aws.amazon.com/id_id/IAM/latest/UserGuide/id_users_create.html

5. Siapkan Access Key dan Secret Key dari akun AWS IAM

6. Msukkan Data Module ec2 cluster nya sesuai dengan data di AWS IAM dan AWS VPC

7. Jalankan command di teriminal: "terraform init" untuk memastikan apakah konfigurasi dari main.tf benar
 
# Cara membuat infrastruktur server 
Tools: NGINX, Aplikasi Node.js, SSL, Terraform

Jalankan command berikut:

**terraform init**
Fungsi: Untuk inisialisasi awal pada directory file terraform kita

**terraform plan**
Fungsi: Untuk mengetahui resource apa saja yang kita akan buat 

**terraform apply**
Fungsi: untuk melakukan provisioning membuat resource pada cloud provider kita dalam hal ini aws

(Jika ingin menghapus semua resource yang telah dibuat jalankan command: **terraform destroy** )

Terlihat instance baru pada console AWS service EC2 di bagian Instance.

Kendala: Kandidat tidak bisa mendapatkan Access Key dan Secret Key dari AWS dikarenakan akun harus diverfikasi selama 3-5 hari untuk memastikan apakah VISA dari kandidat Valid
