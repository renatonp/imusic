<?php
defined('BASEPATH') OR exit('No direct script access allowed');

Class BatalhaModel extends CI_Model
{
    public function agilidade($raca){
        $this->db->select('hr.agilidade');
        $this->db->from('habilidades_raca AS hr');
        $this->db->where('id_raca',$raca);
        $query = $this->db->get();
        foreach($query->result() as $resultado){
            return $resultado->agilidade;
        }
    }

    public function ataque($raca){
        $this->db->select('ar.ataque');
        $this->db->from('arma_raca AS ar');
        $this->db->where('id_raca',$raca);
        $query = $this->db->get();
        foreach($query->result() as $resultado){
            return $resultado->ataque;
        }
    }

    public function defesa($raca){
        $this->db->select('ar.defesa');
        $this->db->from('arma_raca AS ar');
        $this->db->where('id_raca',$raca);
        $query = $this->db->get();
        foreach($query->result() as $resultado){
            return $resultado->defesa;
        }
    }

    public function pontosVida($raca){
        $this->db->select('pv.vida');
        $this->db->from('pontos_vida AS pv');
        $this->db->where('id_raca',$raca);
        $query = $this->db->get();
        foreach($query->result() as $resultado){
            return $resultado->vida;
        }
    }

    public function forcaRaca($raca){
        $this->db->select('hr.forca');
        $this->db->from('habilidades_raca AS hr');
        $this->db->where('id_raca',$raca);
        $query = $this->db->get();
        foreach($query->result() as $resultado){
            return $resultado->forca;
        }
    }

    public function facesDado($raca){
        $this->db->select('ar.faces_dado');
        $this->db->from('arma_raca AS ar');
        $this->db->where('id_raca',$raca);
        $query = $this->db->get();
        foreach($query->result() as $resultado){
            return $resultado->faces_dado;
        }
    }

    public function atualizaPontosVida($raca,$pv){
            $this->db->where('id_raca', $raca);
            $this->db->set('vida', $pv);
            $this->db->update('pontos_vida');
            
            if($this->db->affected_rows() > 0){
                return true;
            }else{
                return false;
            }
        }
}