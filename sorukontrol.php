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

$katKod = $_POST["kategori"];
$kullaniciKod = $_POST["kullanici"];

//başlık kontrol
if (isset($_POST["baslik"]) && !empty($_POST["baslik"])) {
    $baslik = trim($_POST["baslik"]);
    $baslik = $vt-> real_escape_string($baslik);
        if (strlen($baslik)<3) {
            uyari("başlık 3 karakterden az olamaz", "soruyukle.php");
        }
    }
else{
    uyari("başlığı boş bırakamazsınız", "soruyukle.php");
}

//içerik kontrol
if (isset($_POST["icerik"]) && !empty($_POST["icerik"])) {
    $icerik = trim($_POST["icerik"]);
    $icerik = $vt-> real_escape_string($icerik);
        if (strlen($icerik)<3) {
            uyari("soru içeriği 3 karakterden az olamaz", "soruyukle.php");
        }
    }
else{
    uyari("soruyu boş bırakamazsınız", "soruyukle.php");
}

    $sql = "INSERT INTO `soru` (`kod`, `baslik`, `kategoriKod`, `icerik`, `kullaniciKod`) VALUES (NULL, '$baslik', '$katKod', '$icerik', '$kullaniciKod')";
    $vt-> query($sql);
    if ($vt->error) {
        echo "Hata var! <br />";
        echo "SQL : $sql <br />";
    }

    uyari("Başarıyla soru sordunuz", "anasayfa.php");

    $vt->close();
?>

</body>
</html>