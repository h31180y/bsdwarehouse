<?php
class authDataV1 {

    public $login;
    public $masterFid;
    public $password;

    public function __construct($login, $fid, $pass) {
    	
        if(!is_string($login) || !is_string($pass) || !is_int($fid)){
            Throw new Exception("Niepoprawne parametry authData(string, int, string)");
        }
        
        $this->login=$login;
        $this->masterFid=$fid;
        $this->password=$pass;
    }
}
?>