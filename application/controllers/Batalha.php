<?php
defined('BASEPATH') OR exit('No direct script access allowed');

Class Batalha extends CI_controller
{
    function __construct(){
        parent:: __construct();
        $this->load->model('BatalhaModel', 'bM');
    }
    public function index(){
        $vida_humano = 12;
        $vida_orc = 20;
        $turno = 1;
        $dados_rodada = array();

        $this->bM->atualizaPontosVida(1,$vida_humano);
        $this->bM->atualizaPontosVida(2,$vida_orc);

        while($this->bM->pontosVida(1) > 0 || $this->bM->pontosVida(2) > 0){
            $dado_inicial_humano = rand(1,20);
            $iniciativa_humano = $dado_inicial_humano + $this->bM->agilidade(1);

            $dado_inicial_orc = rand(1,20);
            $iniciativa_orc = $dado_inicial_orc + $this->bM->agilidade(2);

            if($iniciativa_humano == $iniciativa_orc){
                $dado_inicial_humano = rand(1,20);
                $iniciativa_humano = $dado_inicial_humano + $this->bM->agilidade(1);

                $dado_inicial_orc = rand(1,20);
                $iniciativa_orc = $dado_inicial_orc + $this->bM->agilidade(2);
            }
            else if($iniciativa_humano > $iniciativa_orc){
                $iniciativa = 'HUMANO';
                $ataque_humano = rand(1,20) + $this->bM->agilidade(1) + $this->bM->ataque(1);
                $defesa_orc = rand(1,20) + $this->bM->agilidade(2) + $this->bM->defesa(2);

                if($ataque_humano > $defesa_orc){
                    $dano = rand(1,$this->bM->facesDado(1)) + $this->bM->forcaRaca(1);
                    $vida_orc = $this->bM->pontosVida(2) - $dano;
                    $this->bM->atualizaPontosVida(2,$vida_orc);
                }
                else{
                    $dano = 0;
                }
                $dados_rodada = array('TURNO' => $turno,'INICIATIVA' => $iniciativa, 'ATAQUE' => $ataque_humano, 'DEFESA' => $defesa_orc, 'DANO' => $dano,'VIDA ORC' => $vida_orc);
            }
            else{
                $iniciativa = 'ORC';
                $ataque_orc = rand(1,20) + $this->bM->agilidade(2) + $this->bM->ataque(2);
                $defesa_humano = rand(1,20) + $this->bM->agilidade(1) + $this->bM->defesa(1);

                if($ataque_orc > $defesa_humano){
                    $dano = rand(1,$this->bM->facesDado(2)) + $this->bM->forcaRaca(2);
                    $vida_humano = $this->bM->pontosVida(1) - $dano;
                    $this->bM->atualizaPontosVida(1,$vida_humano);
                }
                else{
                    $dano = 0;
                }
                $dados_rodada = array('TURNO' => $turno,'INICIATIVA' => $iniciativa, 'ATAQUE' => $ataque_orc, 'DEFESA' => $defesa_humano, 'DANO' => $dano,'VIDA HUMANO' => $vida_humano);
            }
            echo "<p>".json_encode($dados_rodada)."</p>";
            $turno++;
        }
    }
}