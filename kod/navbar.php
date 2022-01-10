<div class="navbar">
<a href="anasayfa.php">[Ana Sayfa]</a>

<?php 
if (isset($_SESSION["yetki"]) AND ($_SESSION["yetki"])) {
    echo "<a href='soruyukle.php'>[Soru Sor]</a>";
    echo "<a href='cikis.php' style='float:right'>[Çıkış Yap]</a>";
}
else{
    echo "<a href='giris.php'>[Giriş Yap]</a>";
    echo "<a href='kayit.php'>[Kayıt Ol]</a>";
}
?>
<hr>
</div>
