<?php

class ArticleDB extends Article
{

    private $_bd;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }


    public function getAllArticles()
    {
        $query = "select * from vue_articles";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);
            $resultset->execute();
            $data = $resultset->fetchAll();
            //var_dump($data);
            foreach ($data as $d) {
                $_array[] = new Article($d);
            }
            return $_array;
            $this->_bd->commit();
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête " . $e->getMessage();
        }
    }

}
