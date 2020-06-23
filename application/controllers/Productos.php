<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Productos extends CI_Controller {
	/*
	Global table name
	*/
	private $table = "producto";
	private $pk = "id_producto";

	function __construct()
	{
		parent::__construct();
		$this->load->model('UtilsModel',"utils");
		$this->load->model("ProductosModel","productos");
	}

	public function index()
	{
		$data = array(
			"titulo"=> "Productos",
			"icono"=> "mdi mdi-archive",
			"buttons" => array(
				0 => array(
					"icon"=> "mdi mdi-plus",
					'url' => 'productos/agregar',
					'txt' => ' Agregar Producto',
					'modal' => false,
				),
			),
			"table"=>array(
				"ID"=>10,
				"Nombre"=>20,
				"Categoria"=>20,
				"Marca"=>20,
				"Modelo"=>10,
				"Estado"=>10,
				"Acciones"=>10,
			),
		);
		$extras = array(
			'css' => array(
			),
			'js' => array(
			    "js/scripts/productos.js"
			),
		);
		layout("template/admin",$data,$extras);
	}

	function get_data(){
		$draw = intval($this->input->post("draw"));
		$start = intval($this->input->post("start"));
		$length = intval($this->input->post("length"));

		$order = $this->input->post("order");
		$search = $this->input->post("search");
		$search = $search['value'];
		$col = 0;
		$dir = "";
		if (!empty($order)) {
			foreach ($order as $o) {
				$col = $o['column'];
				$dir = $o['dir'];
			}
		}

		if ($dir != "asc" && $dir != "desc") {
			$dir = "desc";
		}
		$valid_columns = array(
			0 => 'producto.id_producto',
			1 => 'producto.nombre',
			2 => 'categoria.nombre',
			3 => 'producto.marca',
			4 => 'producto.modelo',
		);
		if (!isset($valid_columns[$col])) {
			$order = null;
		} else {
			$order = $valid_columns[$col];
		}

		$row = $this->productos->get_collection($order, $search, $valid_columns, $length, $start, $dir);

		if ($row != 0) {
			$data = array();
			foreach ($row as $rows) {

				$menudrop = "<div class='btn-group'>
					<button data-toggle='dropdown' class='btn btn-success dropdown-toggle' aria-expanded='false'><i class='mdi mdi-menu' aria-haspopup='false'></i> Menu</button>
					<ul class='dropdown-menu dropdown-menu-right' x-placement='bottom-start'>";
				$filename = base_url("productos/editar/");
				$menudrop .= "<li><a role='button' href='" . $filename.$rows->id_producto. "' ><i class='mdi mdi-square-edit-outline' ></i> Editar</a></li>";

                $filename = base_url("productos/proveedores/");
				$menudrop .= "<li><a role='button' href='" . $filename.$rows->id_producto. "' ><i class='mdi mdi-truck' ></i> Proveedores</a></li>";

                $filename = base_url("productos/precios/");
				$menudrop .= "<li><a role='button' href='" . $filename.$rows->id_producto. "' ><i class='mdi mdi-cash-multiple' ></i> Precios</a></li>";

				$state = $rows->activo;
				if($state==1){
					$txt = "Desactivar";
					$show_text = "<span class='badge badge-success font-bold'>Activo<span>";
					$icon = "mdi mdi-toggle-switch-off";
				}
				else{
					$txt = "Activar";
					$show_text = "<span class='badge badge-danger font-bold'>Inactivo<span>";
					$icon = "mdi mdi-toggle-switch";
				}
				$menudrop .= "<li><a  class='state_change' data-state='$txt'  id=" . $rows->id_producto . " ><i class='$icon'></i> $txt</a></li>";

				$menudrop .= "<li><a  class='delete_row'  id=" . $rows->id_producto . " ><i class='mdi mdi-trash-can-outline'></i> Eliminar</a></li>";
				$menudrop .= "</ul></div>";


				$data[] = array(
					$rows->id_producto,
					$rows->nombre,
					$rows->categoria,
					$rows->marca,
					$rows->modelo,
					$show_text,
					$menudrop,
				);
			}
			$total = $this->productos->total_rows();
			$output = array(
				"draw" => $draw,
				"recordsTotal" => $total,
				"recordsFiltered" => $total,
				"data" => $data
			);
		} else {
			$data[] = array(
				"",
				"",
				"",
				"No se encontraron registros",
				"",
				"",
				"",
			);
			$output = array(
				"draw" => 0,
				"recordsTotal" => 0,
				"recordsFiltered" => 0,
				"data" => $data
			);
		}
		echo json_encode($output);
		exit();
	}

	function agregar(){
		if($this->input->method(TRUE) == "GET"){
		    $categorias = $this->productos->get_categorias();
			$data = array(
			    "categorias"=>$categorias
			);
			$extras = array(
				'css' => array(
				),
				'js' => array(
				    "js/scripts/productos.js"
				),
			);
			layout("productos/agregar_producto",$data,$extras);
		}
		else if($this->input->method(TRUE) == "POST"){

			$nombre = strtoupper($this->input->post("nombre"));
			$categoria = strtoupper($this->input->post("categoria"));
			$codigo_barra = strtoupper($this->input->post("codigo_barra"));
			$codigo_generico = strtoupper($this->input->post("codigo_generico"));
			$marca = strtoupper($this->input->post("marca"));
			$modelo = strtoupper($this->input->post("modelo"));
			$costo_s_iva = $this->input->post("costo_s_iva");
			$costo_c_iva = $this->input->post("costo_c_iva");
			$precio_sugerido = $this->input->post("precio_sugerido");
			$dias_garantia = $this->input->post("dias_garantia");
			$cesc = $this->input->post("cesc");
			$seguro = $this->input->post("seguro");
            $upload_path = "assets/img/productos/";
            $path = "assets/img/productos/";

            $data = array(
                "nombre"=>$nombre,
                "id_categoria"=>$categoria,
                "codigo_barra"=>$codigo_barra,
                "codigo_generico"=>$codigo_generico,
                "marca"=>$marca,
                "modelo"=>$modelo,
                "costo_s_iva"=>$costo_s_iva,
                "costo_c_iva"=>$costo_c_iva,
                "precio_sugerido"=>$precio_sugerido,
                "dias_garantia"=>$dias_garantia,
                "cesc"=>$cesc,
                "seguro"=>$seguro,
                "activo"=>1,
            );
            $this->utils->begin();
            $id_producto = $this->productos->insertar_producto($data);
            if($id_producto!=NULL){

                foreach ($_FILES["photos"]["name"] as $photo=>$tmp_name){

                    if ($_FILES["photos"]["name"][$photo] != "") {
                        $imagen = upload_multiple_image("photos",$upload_path,$photo);
                        /*resize_image($imagen, $upload_path,1000,1000,100,0,"");*/
                        $url=$path.$imagen;
                        $data_img = array(
                            "id_producto"=>$id_producto,
                            "url"=>$url,
                        );
                        $this->utils->insert("producto_imagen",$data_img);
                    }
                }

                $this->utils->commit();
                $xdatos["type"]="success";
                $xdatos['title']='Información';
                $xdatos["msg"]="Registo ingresado correctamente!";
            }
            else {
                $this->utils->rollback();
                $xdatos["type"]="error";
                $xdatos['title']='Alerta';
                $xdatos["msg"]="Error al ingresar el registro";
            }


			echo json_encode($xdatos);
		}
	}

	function editar($id=-1){

		if($this->input->method(TRUE) == "GET"){
			$id = $this->uri->segment(3);
			$row = $this->productos->get_row_info($id);
			if($row && $id!=""){
                $categorias = $this->productos->get_categorias();
				$data = array(
					"row"=>$row,
					"categorias"=>$categorias,
				);
				$extras = array(
                    'css' => array(
                        "libs/jquery_image_multiple/image-uploader.min.css"
                    ),
                    'js' => array(
                        "libs/jquery_image_multiple/image-uploader.min.js",
                        "js/scripts/productos.js"
                    ),
				);
				layout("productos/editar_producto",$data,$extras);
			}else{
				redirect('errorpage');
			}
		}
		else if($this->input->method(TRUE) == "POST"){
            $id_producto = strtoupper($this->input->post("id_producto"));
            $nombre = strtoupper($this->input->post("nombre"));
            $categoria = strtoupper($this->input->post("categoria"));
            $codigo_barra = strtoupper($this->input->post("codigo_barra"));
            $codigo_generico = strtoupper($this->input->post("codigo_generico"));
            $marca = strtoupper($this->input->post("marca"));
            $modelo = strtoupper($this->input->post("modelo"));
            $costo_s_iva = $this->input->post("costo_s_iva");
            $costo_c_iva = $this->input->post("costo_c_iva");
            $precio_sugerido = $this->input->post("precio_sugerido");
            $dias_garantia = $this->input->post("dias_garantia");
            $cesc = $this->input->post("cesc");
            $seguro = $this->input->post("seguro");
            $upload_path = "assets/img/productos/";
            $path = "assets/img/productos/";

            $data = array(
                "nombre"=>$nombre,
                "id_categoria"=>$categoria,
                "codigo_barra"=>$codigo_barra,
                "codigo_generico"=>$codigo_generico,
                "marca"=>$marca,
                "modelo"=>$modelo,
                "costo_s_iva"=>$costo_s_iva,
                "costo_c_iva"=>$costo_c_iva,
                "precio_sugerido"=>$precio_sugerido,
                "dias_garantia"=>$dias_garantia,
                "cesc"=>$cesc,
                "seguro"=>$seguro,
            );
            $where = "id_producto='".$id_producto."'";
            $this->utils->begin();
            $update = $this->utils->update($this->table,$data,$where);
            if($update){
                $delete = array();

                //Insertar nuevas imagenes
                foreach ($_FILES["photos"]["name"] as $photo=>$tmp_name){

                    if ($_FILES["photos"]["name"][$photo] != "") {
                        $imagen = upload_multiple_image("photos",$upload_path,$photo);
                        /*resize_image($imagen, $upload_path,1000,1000,100,0,"");*/
                        $url=$path.$imagen;
                        $data_img = array(
                            "id_producto"=>$id_producto,
                            "url"=>$url,
                        );
                        $id_imagen = $this->productos->insertar_imagen($data_img);
                        array_push($delete,array('id_imagen'=>$id_imagen));
                    }
                }

                //Eliminar imagenes
                if(isset($_POST['old'])){
                    foreach($_POST['old'] as $value) {
                        if($value!=0) array_push($delete,array('id_imagen'=>$value));;
                    }
                }

                $this->productos->eliminar_imagen($delete,$id_producto);
                $this->utils->commit();
                $xdatos["type"]="success";
                $xdatos['title']='Información';
                $xdatos["msg"]="Registo actualizado correctamente!";
            }
            else {
                $this->utils->rollback();
                $xdatos["type"]="error";
                $xdatos['title']='Alerta';
                $xdatos["msg"]="Error al actualizar el registro";
            }


            echo json_encode($xdatos);
		}
	}

	function proveedores(){
        if($this->input->method(TRUE) == "GET"){
            $id = $this->uri->segment(3);
            $row = $this->productos->get_row_info($id);
            if($row && $id!=""){
                $proveedores = $this->productos->get_proveedores($id);
                $data = array(
                    "row"=>$row,
                    "proveedores"=>$proveedores,
                );
                $extras = array(
                    'css' => array(
                    ),
                    'js' => array(
                        "js/scripts/productos.js"
                    ),
                );
                layout("productos/proveedores",$data,$extras);
            }else{
                redirect('errorpage');
            }
        }else if($this->input->method(TRUE) == "POST"){
            $id_producto = $this->input->post("id_producto");
            $proveedores = $this->input->post("proveedores");

            $this->utils->begin();
            if(isset($proveedores)) {
                foreach ($proveedores as $rec) {

                    if ($rec["id_pp"] == 0) {
                        $form_detalle = array(
                            "id_producto" => $id_producto,
                            "id_proveedor" => $rec["id_proveedor"],
                        );
                        $this->utils->insert("producto_proveedor", $form_detalle);
                    } else {
                        $form_detalle = array(
                            "id_producto" => $id_producto,
                            "id_proveedor" => $rec["id_proveedor"],
                        );
                        $wherer = " id_pp='" . $rec["id_pp"] . "'";
                        $this->utils->update("producto_proveedor", $form_detalle, $wherer);
                    }
                }
            }

            $this->utils->commit();
            $xdatos["type"]="success";
            $xdatos['title']='Exito';
            $xdatos["msg"]="Registo guardado correctamente!";

            echo json_encode($xdatos);
        }
    }

	function precios(){
        if($this->input->method(TRUE) == "GET"){
            $id = $this->uri->segment(3);
            $row = $this->productos->get_row_info($id);
            if($row && $id!=""){
                $precios = $this->productos->get_precios($id);
                $data = array(
                    "row"=>$row,
                    "precios"=>$precios,
                );
                $extras = array(
                    'css' => array(
                    ),
                    'js' => array(
                        "js/scripts/productos.js"
                    ),
                );
                layout("productos/precios",$data,$extras);
            }else{
                redirect('errorpage');
            }
        }else if($this->input->method(TRUE) == "POST"){
            $id_producto = $this->input->post("id_producto");
            $proveedores = $this->input->post("proveedores");

            $this->utils->begin();
            if(isset($proveedores)) {
                foreach ($proveedores as $rec) {

                    if ($rec["id_pp"] == 0) {
                        $form_detalle = array(
                            "id_producto" => $id_producto,
                            "id_proveedor" => $rec["id_proveedor"],
                        );
                        $this->utils->insert("producto_proveedor", $form_detalle);
                    } else {
                        $form_detalle = array(
                            "id_producto" => $id_producto,
                            "id_proveedor" => $rec["id_proveedor"],
                        );
                        $wherer = " id_pp='" . $rec["id_pp"] . "'";
                        $this->utils->update("producto_proveedor", $form_detalle, $wherer);
                    }
                }
            }

            $this->utils->commit();
            $xdatos["type"]="success";
            $xdatos['title']='Exito';
            $xdatos["msg"]="Registo guardado correctamente!";

            echo json_encode($xdatos);
        }
    }

    function get_proveedor_autocomplete(){
        $query = $this->input->post("query");
        $rows = $this->productos->get_proveedor_autocomplete($query);
        $output = array();
        if($rows!=NULL) {
            foreach ($rows as $row) {
                $output[] = array(
                    'proveedor' => $row->id_proveedor . " | " . $row->nombre
                );
            }
        }
        echo json_encode($output);
    }

    function eliminar_proveedor(){
        if($this->input->method(TRUE) == "POST"){
            $id = $this->input->post("id");
            $where = " id_pp ='".$id."'";
            $this->utils->begin();
            $delete = $this->utils->delete("producto_proveedor",$where);
            if($delete) {
                $this->utils->commit();
                $data["type"] = "success";
                $data["title"] = "Información";
                $data["msg"] = "Registro eliminado con exito!";
            }
            else {
                $this->utils->rollback();
                $data["type"] = "Error";
                $data["title"] = "Alerta!";
                $data["msg"] = "Registro no pudo ser eliminado!";
            }
            echo json_encode($data);
        }
    }

	function get_images(){
        if($this->input->method(TRUE) == "POST"){
            $id = $this->input->post("id");
            $productos = $this->productos->get_images($id);
            $new = [];
            foreach ($productos as $row){
                array_push($new, array('id'=>$row->id_imagen, 'imagen'=>base_url($row->url)));
            }
            echo json_encode($new);
        }
    }

    function delete(){
        if($this->input->method(TRUE) == "POST"){
            $id = $this->input->post("id");
            $response = safe_delete($this->table,$this->pk,$id);
            echo json_encode($response);
        }
    }

    function state_change(){
        if($this->input->method(TRUE) == "POST"){
            $id = $this->input->post("id");
            $active = $this->productos->get_state($id);
            $response = change_state($this->table,$this->pk,$id,$active);
            echo json_encode($response);
        }
    }

}

/* End of file Productos.php */
