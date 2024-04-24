<?php

class NouveauteDB extends Nouveaute
{

    private $_bd;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }


    public function getAllNouveautes()
    {
        $query = "select * from vue_nouveautes";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->execute();
            $data = $resultset->fetchAll();
            //var_dump($data);
            foreach ($data as $d) {
                $_array[] = new Nouveaute($d);
            }
            return $_array;
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête " . $e->getMessage();
        }
    }

}
