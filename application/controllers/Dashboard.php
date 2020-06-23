<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
		//validar_session($this);
		$this->load->model("Dashboard_model");
	}

	public function index()
	{

        /*$data = array(

            "urljs"=>"funciones_dashboard.js",

        );*/

		layout('dashboard',"","");
	}

	function grafica_permiso_admin(){
		$inicio = restar_meses(date("Y-m-d"),6);
		for($i=0; $i<6; $i++)
		{
			$a = explode("-",$inicio)[0];
			$m = explode("-",$inicio)[1];
			$ult = cal_days_in_month(CAL_GREGORIAN, $m, $a);
			$start = "$a-$m-01";
			$end = "$a-$m-$ult";
			$row = $this->Dashboard_model->grafica_permiso($start,$end);
			$total = $row->total;
			$data[] = array(
				"total" => $total,
				"mes" => nombre_mes($m),
			);
			$inicio = sumar_meses($start,1);
		}
		echo json_encode($data);
	}


	function grafica_vacacion_admin(){
		$inicio = restar_meses(date("Y-m-d"),6);
		for($i=0; $i<6; $i++)
		{
			$a = explode("-",$inicio)[0];
			$m = explode("-",$inicio)[1];
			$ult = cal_days_in_month(CAL_GREGORIAN, $m, $a);
			$start = "$a-$m-01";
			$end = "$a-$m-$ult";
			$row = $this->Dashboard_model->grafica_vacacion($start,$end);
			$total = $row->total;
			$data[] = array(
				"total" => $total,
				"mes" => nombre_mes($m),
			);
			$inicio = sumar_meses($start,1);
		}
		echo json_encode($data);
	}

}
