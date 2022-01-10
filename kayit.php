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
        <?php include "kod/navbar.php" ?>
        <div class="body">
            <form action="kayitkontrol.php" method="POST">
                ad:<input type="text" name="ad"> <br>
                soyad:<input type="text" name="soyad"> <br>
                kullanici adı:<input type="text" name="kullanici"> <br>
                eposta:<input type="email" name="ePosta"> <br>
                şifre:<input type="password" name="sifre1"> <br>
                şifre tekrarı<input type="password" name="sifre2"> <br>
                <input type="submit" name="gönder">
            </form>
        </div>
    </div>
    <?php include "kod/footer.php" ?>
</body>
</html>