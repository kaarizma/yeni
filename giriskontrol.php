<?php
session_start()
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
</head>
<body>

<?php

include "kod/vtbaglan.php";
include "kod/fonksiyon.php";

echo "<pre>";
print_r($_POST);
echo "</pre>";

    if (isset($_POST["kullanici"]) && !empty($_POST["kullanici"])) {
        $kullanici = trim($_POST["kullanici"]);
        $kullanici = $vt-> real_escape_string($kullanici);

        $sql = "SELECT * FROM `kullanici` WHERE kAdi like '$kullanici'";
        $sonuc=$vt->query($sql);
        if ($vt->error) {
            echo "Bir hata var: <br > SQL : $sql <br />";    
        } 
        $giris = $sonuc->fetch_assoc();
        if ($sonuc->num_rows==1) {
            if (password_verify($_POST["sifre"], $giris["sifre"])) {
                $_SESSION["yetki"] = true;
                $_SESSION["ad"] = $giris["ad"];
                $_SESSION["soyad"] = $giris["soyad"];
                $_SESSION["kullanici"] = $giris["kAdi"];
                $_SESSION["ePosta"] = $giris["ePosta"];
                $_SESSION["zaman"] = $giris["zaman"];
                $_SESSION["kod"] = $giris["kod"];
                uyari("Hoşgeldiniz", "anasayfa.php");
            }
        }
        else{
            uyari("Böyle bir kullanıcı bulunamadı", "giris.php");
        }

    }
    else{
        uyari("lütfen kullanıcı adını giriniz", "giris.php");
    }
?>

</body>
</html>