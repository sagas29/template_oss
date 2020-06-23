<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>
<div class="wrapper wrapper-content">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox" id="main_view">
				<div class="ibox-title">
					<h3 class="text-navy"><b><i class="mdi mdi-plus"></i> Agregar Producto</b></h3>
				</div>
				<div class="ibox-content">
					<form id="form_add" novalidate>
						<div class="row">
							<div class="col-lg-3">
								<div class="form-group single-line">
									<label for="nombre">Nombre</label>
									<input type="text" name="nombre" id="nombre" class="form-control mayu"  placeholder="Ingrese un nombre"
									required data-parsley-trigger="change">
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group single-line">
									<label for="categoria">Categoria</label>
									<select name="categoria" id="categoria" class="form-control select2" required data-parsley-trigger="change">
                                        <?php foreach ($categorias as $cat): ?>
                                        <option value="<?=$cat->id_categoria?>"><?=$cat->nombre?></option>
                                        <?php endforeach; ?>
                                    </select>
								</div>
							</div>
                            <div class="col-lg-3">
								<div class="form-group single-line">
									<label for="codigo_barra">Codigo de Barra</label>
									<input type="text" name="codigo_barra" id="codigo_barra" class="form-control mayu"  placeholder="Ingrese un codigo"
									required data-parsley-trigger="change">
								</div>
							</div>
                            <div class="col-lg-3">
								<div class="form-group single-line">
									<label for="codigo_generico">Codigo Generico</label>
									<input type="text" name="codigo_generico" id="codigo_generico" class="form-control mayu"  placeholder="Ingrese un codigo"
									required data-parsley-trigger="change">
								</div>
							</div>
						</div>
                        <div class="row">
							<div class="col-lg-3">
								<div class="form-group single-line">
									<label for="marca">Marca</label>
									<input type="text" name="marca" id="marca" class="form-control mayu"  placeholder="Ingrese una marca"
									required data-parsley-trigger="change">
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group single-line">
									<label for="modelo">Modelo</label>
                                    <input type="text" name="modelo" id="modelo" class="form-control mayu"  placeholder="Ingrese un modelo"
                                           required data-parsley-trigger="change">
								</div>
							</div>
                            <div class="col-lg-3">
								<div class="form-group single-line">
									<label for="costo_s_iva">Costo sin IVA</label>
									<input type="text" name="costo_s_iva" id="costo_s_iva" class="form-control decimal"  placeholder="Ingrese el costo sin iva"
									required data-parsley-trigger="change">
								</div>
							</div>
                            <div class="col-lg-3">
								<div class="form-group single-line">
									<label for=costo_c_iva">Costo con IVA</label>
									<input type="text" name="costo_c_iva" id="costo_c_iva" class="form-control decimal"  placeholder="Ingrese el costo con IVA"
									required data-parsley-trigger="change">
								</div>
							</div>
						</div>
                        <div class="row">
							<div class="col-lg-3">
								<div class="form-group single-line">
									<label for="precio_sugerido">Precio Sugerido</label>
									<input type="text" name="precio_sugerido" id="precio_sugerido" class="form-control decimal"  placeholder="Ingrese un precio sugerido"
									required data-parsley-trigger="change">
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group single-line">
									<label for="dias_garantia">Dias de Garantia</label>
                                    <input type="text" name="dias_garantia" id="dias_garantia" class="form-control numeric"  placeholder="Ingrese los dias de garantia"
                                           required data-parsley-trigger="change">
								</div>
							</div>
                            <div class="col-lg-3">
								<div class="form-group single-line">
                                    <fieldset>
                                        <legend>
                                            Cesc
                                        </legend>
                                        <div class="form-check abc-radio abc-radio form-check-inline">
                                            <input class="form-check-input" type="radio" id="cesc1" value="1" name="cesc">
                                            <label class="form-check-label" for="cesc1"> SI </label>
                                        </div>
                                        <div class="form-check abc-radio form-check-inline">
                                            <input class="form-check-input" type="radio" id="cesc2" value="0" name="cesc" checked>
                                            <label class="form-check-label" for="cesc2"> NO </label>
                                        </div>
                                    </fieldset>
								</div>
							</div>
                            <div class="col-lg-3">
								<div class="form-group single-line">
                                    <fieldset>
                                        <legend>
                                            Seguro
                                        </legend>
                                        <div class="form-check abc-radio abc-radio form-check-inline">
                                            <input class="form-check-input" type="radio" id="seguro1" value="1" name="seguro">
                                            <label class="form-check-label" for="seguro1"> SI </label>
                                        </div>
                                        <div class="form-check abc-radio form-check-inline">
                                            <input class="form-check-input" type="radio" id="seguro2" value="0" name="seguro" checked>
                                            <label class="form-check-label" for="seguro2"> NO </label>
                                        </div>
                                    </fieldset>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-12">
								<div class="mt-3">
									<label for="foto">Fotos del producto</label>
                                    <div class="input-images-2" style="padding-top: .5rem;"></div>
                                    <p class="text-muted text-center mt-2 mb-0">Haz click en el cuadro para agregar imagenes</p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-actions col-lg-12">
                                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" id="csrf_token_id">
								<button type="submit" id="btn_add" name="btn_add" class="btn btn-primary m-t-n-xs float-right"><i class="mdi mdi-content-save"></i>
									Guardar Registro
								</button>
							</div>
						</div>
					</form>
				</div>

			</div>
			<div class="ibox" style="display: none;" id="divh">
                <div class="ibox-content text-center">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2 class="text-danger blink_me">Espere un momento, procesando su solicitud!</h2>
                            <section class="sect">
                                <div id="loader">
                                </div>
                            </section>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

