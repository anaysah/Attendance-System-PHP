<?php
session_start();

if(isset($_POST["submit"]) || isset($_GET['usertype'])){
    require_once 'dbh.inc.php';
    require_once 'auth.function.inc.php';
    require_once 'main.function.inc.php';

    if(isset($_GET['usertype'])){  #if the method is get and has a variable named usertype then it is demo
        $email = "nonoteh949@kaudat.com";
        $pass = "123";
        $userType = $_GET['usertype'];
    }else{
        $email = $_POST["login-email"];
        $pass = $_POST["login-pass"];
        $userType = userType("user-type");
    }

    if($userType === false){ 
        redirect("../auth.php","please select a user type");
    }

    if( emptyInputLogin($email, $pass) !== false){
        redirect("../auth.php","Emtpy Input");
    }

    if(loginUser($conn, $email, $pass, $userType)){
        if($userType==="teacher")
        redirect("../teacher","you are loged in");
        else redirect("../student","you are loged in");
    }
    redirect("../auth.php","Wrong Password");

}else{
    header("location: ../auth.php");
    exit();
}
