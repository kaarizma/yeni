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

$soruKod = $_POST["soruKod"];
$kullaniciKod = $_POST["kullaniciKod"];



//cevap kontrol
if (isset($_POST["cevap"]) && !empty($_POST["cevap"])) {
    $cevap = trim($_POST["cevap"]);
    $cevap = $vt-> real_escape_string($cevap);
        if (strlen($cevap)<3) {
            uyari("cevap içeriği 3 karakterden az olamaz", "sorudetay.php?soruKod=$soruKod");
        }
    }
else{
    uyari("cevabı boş bırakamazsınız", "sorudetay.php?soruKod=$soruKod");
}

    $sql = "INSERT INTO `cevap` (`kod`, `soruKod`, `kullaniciKod`, `cevap`) VALUES (NULL, '$soruKod', '$kullaniciKod', '$cevap')";
    $vt-> query($sql);
    if ($vt->error) {
        echo "Hata var! <br />";
        echo "SQL : $sql <br />";
    }

    uyari("Başarıyla cevapladınız", "sorudetay.php?soruKod=$soruKod ");

    $vt->close();
?>

</body>
</html>