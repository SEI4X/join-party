<?php
    function getConnection()
    {
        $host = 'localhost';
        $db_name = 'join_party';
        $username = 'root';
        $password = 'Polarnaya32_X!';
        $conn= new mysqli($host, $username, $password, $db_name);
        if ($conn->connect_error) {
            $conn= null;
        }
        return $conn;
    }
?>