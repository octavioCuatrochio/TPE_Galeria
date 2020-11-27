<?php

class ArtworkModel
{

    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_arte;charset=utf8', 'root', '');

        //al desactivar las preparaciones emuladas, nos permite poner parametros al LIMIT a traves de PDO.
        $this->db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    }

    function GetArtworks()
    {
        $sentencia = $this->db->prepare("SELECT * FROM obra");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function GetArtwork($id_piece)
    {
        $sentencia = $this->db->prepare("SELECT * FROM obra WHERE id=?");
        $sentencia->execute(array($id_piece));
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }

    function GetArtworksByCategory($id_category)
    {
        $sentencia = $this->db->prepare("SELECT * FROM obra WHERE id_categoria=?");
        $sentencia->execute([$id_category]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function AddArtwork($nombre, $descripcion, $autor, $anio, $imagen, $category)
    {
        $sentencia = $this->db->prepare("INSERT INTO obra(nombre, descripcion, autor, anio,imagen,id_categoria) VALUES(?,?,?,?,?,?)");
        $sentencia->execute(array($nombre, $descripcion, $autor, $anio, $imagen, $category));
    }

    function GetFrontArtworks($limit)
    {
        $sentencia = $this->db->prepare("SELECT * FROM obra LIMIT ?");
        $sentencia->execute(array($limit));
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function DeleteArtwork($art_id)
    {
        $sentencia = $this->db->prepare("DELETE FROM obra WHERE id=?");
        $sentencia->execute([$art_id]);
    }


    function UpdateArtwork($nombre, $descripcion, $autor, $anio, $imagen, $category, $art_id)
    {
        $sentencia = $this->db->prepare("UPDATE obra
        SET nombre=?, descripcion=?, autor=?, anio=?, imagen=?, id_categoria=? 
        WHERE id=?");
        $sentencia->execute(array($nombre, $descripcion, $autor, $anio, $imagen, $category, $art_id));
    }

    function GetArtworkAndCategories()
    {
        $sentencia = $this->db->prepare("SELECT obra.*, categoria.nombre_category FROM obra JOIN categoria ON obra.id_categoria = categoria.id");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function GetRowCount()
    {
        $sentencia = $this->db->prepare("SELECT COUNT(*) FROM obra");
        $sentencia->execute();
        return $sentencia->fetch(PDO::FETCH_ASSOC);
    }

    function GetArtworkAndCategoryById($obra_id)
    {
        $sentencia = $this->db->prepare("SELECT obra.*, categoria.nombre_category FROM obra JOIN categoria ON obra.id_categoria = categoria.id WHERE obra.id=?");
        $sentencia->execute([$obra_id]);
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }

    function getBlockOfArtworks($offset, $quantity)
    {
        $sentencia = $this->db->prepare("SELECT obra.id, obra.nombre, obra.descripcion, obra.autor, obra.imagen FROM obra ORDER BY id LIMIT ?,?");
        $sentencia->execute(array($offset, $quantity));
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }
}
