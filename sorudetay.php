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
            $soruKod = $_GET["soruKod"];
            $sql = "SELECT soru.*, kullanici.kAdi, kategori.kategoriAdi FROM `soru` JOIN `kullanici` JOIN `kategori` WHERE kullanici.kod = soru.kullaniciKod and soru.kategoriKod = kategori.kod and soru.kod = $soruKod";
            $sonuc = $vt->query($sql);
                    $satir = $sonuc->fetch_assoc();
                    $sKod = htmlentities($satir["kod"]);
                    $baslik = htmlentities($satir["baslik"]);
                    $katAdi = htmlentities($satir["kategoriAdi"]);
                    $icerik = htmlentities($satir["icerik"]);
                    $kulKod = htmlentities($satir["kullaniciKod"]);
                    $zaman = htmlentities($satir["zaman"]);
                    $kulAdi = htmlentities($satir["kAdi"]); 
            ?>
            <p><?php echo $kulAdi ?></p>
            <p><span><?php echo $katAdi ?></span><span style="float: right;"><?php echo $zaman ?></span></p>
            <p><?php echo $baslik ?></p>
            <p>Soru : <?php echo $icerik ?></p>

            <br>
            <form action="cevapkontrol.php" method="POST">
                <textarea name="cevap"  cols="30" rows="10"></textarea> <br>
                <input type="hidden" name="kullaniciKod" value="<?php echo $kulKod ?>">
                <input type="hidden" name="soruKod" value="<?php echo $sKod ?>">
                <input type="submit" value="Gönder">
            </form>
            <hr>
            <div class="cevaplar">
                <h4>Cevaplar</h4>
                <hr>
            <?php
            
            $sql = "SELECT cevap.*, kullanici.kAdi FROM `cevap` JOIN `kullanici` JOIN `soru` WHERE kullanici.kod = cevap.kullaniciKod AND soru.kod = cevap.soruKod and soruKod = $soruKod";
            $sonuc = $vt->query($sql);
                $sayi=$sonuc->num_rows;

                if ($sayi==0) {
                    echo "İlk cevabı sen ver";
                }

                for ($i=0; $i < $sayi; $i++) { 
                    $satir = $sonuc->fetch_assoc();
                    $cevap = htmlentities($satir["cevap"]);
                    $zaman = htmlentities($satir["zaman"]);
            ?>
            <p><?php echo $kulAdi ?></p>
            <p><span style="float: right;"><?php echo $zaman ?></span></p>
            <p><?php echo $cevap ?></p>
            <br>
            <hr>
            <?php } ?>
            </div>
        </div>
    </div>

    <?php include "kod/footer.php" ?>
    </div>
</body>
</html>