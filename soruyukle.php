<?php
session_start()
?>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container"> 
    <?php include "kod/navbar.php";
    include "kod/vtbaglan.php";
    include "kod/fonksiyon.php";
    ?>
        <div class="body">
            <form action="sorukontrol.php" method="POST">
                Başlık : <input type="text" name="baslik"> <br>
                Kategori : 
                <select name="kategori" >
                    <?php
                        $sql = "SELECT * FROM `kategori` WHERE 1";
                        $sonuc = $vt->query($sql);
                        $sayi=$sonuc->num_rows;
                        for ($i=0; $i < $sayi; $i++) { 
                            $satir = $sonuc->fetch_assoc();
                            $kKod = $satir["kod"];
                            $katAdi = $satir["kategoriAdi"];
                            echo "<option value='$kKod'>$katAdi</option>";
                        }
                        ?>
                </select>  <br> İçerik : <br>
                <textarea name="icerik"  cols="30" rows="10"> </textarea> <br>
                <input type="hidden" name="kullanici" value="<?php echo $_SESSION["kod"] ?>">
                <input type="submit" name="gonder">
            </form>
        </div>
    <?php include "kod/footer.php" ?>
    </div>
</body>
</html>