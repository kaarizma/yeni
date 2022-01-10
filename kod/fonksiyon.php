<?php

function uyari($mesaj, $url) {
    echo ("<script LANGUAGE='JavaScript'> window.alert('$mesaj');  window.location.href='$url';</script>");	
    exit; 
}

?>