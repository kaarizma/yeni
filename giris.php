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
            <form action="giriskontrol.php" method="POST">
                kullanici adı:<input type="text" name="kullanici"> <br>
                şifre:<input type="password" name="sifre"> <br>
                <input type="submit" name="gönder">                
            </form>
            </div>
        </div>
   
    <?php include "kod/footer.php" ?>
</body>
</html>