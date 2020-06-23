<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox" id="main_view">
                <div class="ibox-title">
                    <h3 class="text-navy"><b><i class="mdi mdi-square-edit-outline"></i> Editar Producto</b></h3>
                </div>
                <div class="ibox-content">
                    <form id="form_edit" novalidate>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" name="nombre" id="nombre" class="form-control mayu"  placeholder="Ingrese un nombre" value="<?=$row->nombre?>"
                                           required data-parsley-trigger="change">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for="categoria">Categoria</label>
                                    <select name="categoria" id="categoria" class="form-control select2" required data-parsley-trigger="change">
                                        <?php foreach ($categorias as $cat): ?>
                                            <option value="<?=$cat->id_categoria?>"
                                            <?php if($cat->id_categoria==$row->id_categoria) echo "selected"; ?>
                                            ><?=$cat->nombre?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for="codigo_barra">Codigo de Barra</label>
                                    <input type="text" name="codigo_barra" id="codigo_barra" class="form-control mayu"  placeholder="Ingrese un codigo" value="<?=$row->codigo_barra?>"
                                           required data-parsley-trigger="change">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for="codigo_generico">Codigo Generico</label>
                                    <input type="text" name="codigo_generico" id="codigo_generico" class="form-control mayu"  placeholder="Ingrese un codigo" value="<?=$row->codigo_generico?>"
                                           required data-parsley-trigger="change">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for="marca">Marca</label>
                                    <input type="text" name="marca" id="marca" class="form-control mayu"  placeholder="Ingrese una marca" value="<?=$row->marca?>"
                                           required data-parsley-trigger="change">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for="modelo">Modelo</label>
                                    <input type="text" name="modelo" id="modelo" class="form-control mayu"  placeholder="Ingrese un modelo" value="<?=$row->modelo?>"
                                           required data-parsley-trigger="change">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for="costo_s_iva">Costo sin IVA</label>
                                    <input type="text" name="costo_s_iva" id="costo_s_iva" class="form-control decimal"  placeholder="Ingrese el costo sin iva" value="<?=$row->costo_s_iva?>"
                                           required data-parsley-trigger="change">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for=costo_c_iva">Costo con IVA</label>
                                    <input type="text" name="costo_c_iva" id="costo_c_iva" class="form-control decimal"  placeholder="Ingrese el costo con IVA" value="<?=$row->costo_c_iva?>"
                                           required data-parsley-trigger="change">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for="precio_sugerido">Precio Sugerido</label>
                                    <input type="text" name="precio_sugerido" id="precio_sugerido" class="form-control decimal"  placeholder="Ingrese un precio sugerido" value="<?=$row->precio_sugerido?>"
                                           required data-parsley-trigger="change">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group single-line">
                                    <label for="dias_garantia">Dias de Garantia</label>
                                    <input type="text" name="dias_garantia" id="dias_garantia" class="form-control numeric"  placeholder="Ingrese los dias de garantia" value="<?=$row->dias_garantia?>"
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
                                            <input class="form-check-input" type="radio" id="cesc1" value="1" name="cesc" <?php if ($row->cesc==1) echo "checked"; ?>>
                                            <label class="form-check-label" for="cesc1"> SI </label>
                                        </div>
                                        <div class="form-check abc-radio form-check-inline">
                                            <input class="form-check-input" type="radio" id="cesc2" value="0" name="cesc" <?php if ($row->cesc==0) echo "checked"; ?>>
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
                                            <input class="form-check-input" type="radio" id="seguro1" value="1" name="seguro" <?php if ($row->seguro==1) echo "checked"; ?>>
                                            <label class="form-check-label" for="seguro1"> SI </label>
                                        </div>
                                        <div class="form-check abc-radio form-check-inline">
                                            <input class="form-check-input" type="radio" id="seguro2" value="0" name="seguro" <?php if ($row->seguro==0) echo "checked"; ?>>
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
                                    <div class="input-images-edit" style="padding-top: .5rem;"></div>
                                    <p class="text-muted text-center mt-2 mb-0">Haz click en el cuadro para agregar imagenes</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-actions col-lg-12">
                                <input type="hidden" name="id_producto" id="id_producto" value="<?=$row->id_producto?>">
                                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" id="csrf_token_id">
                                <button type="submit" id="btn_edit" name="btn_edit" class="btn btn-primary m-t-n-xs float-right"><i class="mdi mdi-content-save"></i>
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
<script>
    let preloaded = [];
    let token1 = $("#csrf_token_id").val()
    $.ajax({
        type: "POST",
        url: base_url+"productos/get_images",
        data: {id :$("#id_producto").val(),csrf_test_name:token1},
        dataType: 'json',
        success: function (data) {
            $.each(data, function(index, item) {
                preloaded.push({id:item['id'],src:item['imagen']})
            });
        },
        complete:function () {
            $('.input-images-edit').imageUploader({
                preloaded: preloaded,
                imagesInputName: 'photos',
                preloadedInputName: 'old'
            });
        }
    });


</script>