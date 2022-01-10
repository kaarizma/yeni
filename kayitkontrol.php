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


//ad soyad kontrol
    if (isset($_POST["ad"]) && !empty($_POST["ad"])) {
        $ad = $vt-> real_escape_string($_POST["ad"]);
    }
    else{
        uyari("Lütfen adınızı giriniz", "kayit.php");
    }

    if (isset($_POST["soyad"]) && !empty($_POST["soyad"])) {
        $soyad = $vt-> real_escape_string($_POST["soyad"]);
    }
    else{
        uyari("Lütfen soyadınızı giriniz", "kayit.php");
    }

//kullanici adı kontrol
    if (isset($_POST["kullanici"]) && !empty($_POST["kullanici"])) {
        $kullanici = trim($_POST["kullanici"]);
        $kullanici = $vt-> real_escape_string($kullanici);
            if (strlen($kullanici)>=3) {
                $sorgusql = "SELECT `kAdi` FROM `kullanici` WHERE kAdi like '$kullanici'";
                $sonuc = $vt->query($sorgusql);
                if($sonuc->num_rows==1){
                    uyari("kullanıcı adı zaten kullanılmakta", "kayit.php");
                }
            }
            else{
                uyari("kullanıcı adı 3 karakterden az olamaz", "kayit.php");
            } 
        }
    else{
        uyari("kullanıcı adını girmediniz", "kayit.php");
    }

//E-posta kontrol
    if (isset($_POST["ePosta"]) && !empty($_POST["ePosta"])) {
        $ePosta = trim($_POST["ePosta"]);
        $ePosta = $vt->real_escape_string($ePosta);

        if (!filter_var($ePosta, FILTER_VALIDATE_EMAIL) ){
	        uyari("lütfen düzgün e posta giriniz","kayit.php");
	    }
	    $eposta = filter_var($ePosta, FILTER_VALIDATE_EMAIL);
          
        }
    else{
        uyari("e posta adresinizi girmediniz", "kayit.php");
    }


//şifre kontrol
    if (isset($_POST["sifre1"]) && !empty($_POST["sifre1"])) {
        $sifre1 = trim($_POST["sifre1"]);
        $sifre1 = $vt->real_escape_string($sifre1);
        
        if (strlen($sifre1)>=3) {
            if (isset($_POST["sifre2"]) && !empty($_POST["sifre2"])) {
                $sifre2 = trim($_POST["sifre2"]);
                $sifre2 = $vt->real_escape_string($sifre2);
                if($sifre1 == $sifre2){
                    $sifre=password_hash($sifre1, PASSWORD_DEFAULT);
                }
                else{
                    uyari("Şifreler uyuşmuyor lütfen kontrol edin", "kayit.php");
                }
            }
            else{
                uyari("Şifre tekrarını girmediniz","kayit.php");
            }
        }
        else{
            uyari("Şifre 3 karakterden az olamaz", "kayit.php");
        }
    }
    else{
        uyari("Şifre girmediniz", "kayit.php");
    }

    $sql="INSERT INTO `kullanici` (`kod`, `ad`, `soyad`, `kAdi`, `ePosta`, `sifre`) VALUES (NULL, '$ad', '$soyad', '$kullanici', '$ePosta', '$sifre')";
    $vt->query($sql);
    if ($vt->error) {
        echo "Hata var! <br />";
        echo "SQL : $sql <br />";
    }

    uyari("Başarıyla kayıt oldunuz", "giris.php");

    $vt->close();
    

?>

</body>
</html>