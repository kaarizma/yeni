<?php

session_start();
session_destroy();

echo ("<script LANGUAGE='JavaScript'> window.alert('Başarıyla çıkış yapıldı');  window.location.href='anasayfa.php';</script>");	
exit; 

?>