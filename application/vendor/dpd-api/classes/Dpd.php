<?php
abstract class Dpd
{
  public static function autoload($class)
  {
    $path = dirname(__FILE__).'/'.$class.'.php';
    
    if (!file_exists($path))
    {
      return false;
    }

    require_once $path;
  }
  
  public static function registerAutoload()
  {
    spl_autoload_register(array('Dpd', 'autoload'));
  } 
}
?>