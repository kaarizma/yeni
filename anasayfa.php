<?php
session_start()
?>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ana Sayfa</title>
    <link rel="stylesheet" href="style.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>
<body>
    <div class="container">
    <?php include "kod/navbar.php";
    include "kod/vtbaglan.php";
    include "kod/fonksiyon.php";
    ?>
    <div class="body">
        <div class="soru">
            <?php
            
            $sql = "SELECT soru.*, kullanici.kAdi, kategori.kategoriAdi FROM `soru` JOIN `kullanici` JOIN `kategori` WHERE kullanici.kod = soru.kullaniciKod and soru.kategoriKod = kategori.kod";
            $sonuc = $vt->query($sql);
                $sayi=$sonuc->num_rows;
                for ($i=0; $i < $sayi; $i++) { 
                    $satir = $sonuc->fetch_assoc();
                    $baslik = htmlentities($satir["baslik"]);
                    $katAdi = htmlentities($satir["kategoriAdi"]);
                    $icerik = htmlentities($satir["icerik"]);
                    $kulKod = htmlentities($satir["kullaniciKod"]);
                    $zaman = htmlentities($satir["zaman"]);
                    $kulAdi = htmlentities($satir["kAdi"]);
                    $sKod = htmlentities($satir["kod"]);
                
            ?>
            <p><?php echo $kulAdi ?></p>
            <p><span><?php echo $katAdi ?></span><span style="float: right;"><?php echo $zaman ?></span></p>
            <p><?php echo $baslik ?></p>
            <a href="sorudetay.php?soruKod=<?php echo $sKod ?>"><button type="submit" style="float: right;">Cevapla</button></a>            
            <br>
            <hr>
            <?php } ?>
        </div>
    </div>

    <?php include "kod/footer.php" ?>
    </div>
</body>
</html>