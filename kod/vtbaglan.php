<?php

$vt = new mysqli("localhost", "root", "", "deneme");
$vt->set_charset("utf8");

if ($vt->connect_error) {
    die("Bağlantı hatası: " . $vt->connect_error);
}
$vt->set_charset("utf8");
if ($vt->error) {
    echo "Karakter kodlamasında hata var! <br />";
}
?>