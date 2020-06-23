<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row" >
        <div class="col-lg-12">
            <div class="ibox">


				<?php if (isset($buttons)): ?>
					<div class="ibox-title">
						<?php foreach ($buttons as $btn):?>
							<?php if($btn["modal"]==true): ?>
								<a
									<?php if(isset($btn["url"])): ?>
										href = '<?=base_url($btn["url"])?>'
									<?php else: ?>
										href = '#'
									<?php endif; ?>
									id="modal_btn_add" role="button" class="btn btn-success" data-toggle="modal" data-target="#viewModal" data-refresh='true'>
									<i class="<?=$btn["icon"]?>"></i><?=$btn["txt"]?>
								</a>
							<?php else: ?>
								<a href="<?=base_url($btn["url"])?>" class="btn btn-success">
									<i class="<?=$btn["icon"]?>"></i><?=$btn["txt"]?>
								</a>
							<?php endif; ?>
						<?php endforeach;?>
					</div>
				<?php endif; ?>

                <div class="ibox-content">
                    <!--load datables estructure html-->
                    <header>
                        <h3 class="text-success"><i class="<?=$icono;?>"></i> <?=$titulo?></h3>
                    </header>
                    <section>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover datatable" id="editable">
                                <thead class="">
                                    <tr>
                                        <?php foreach ($table as $key => $value): ?>
                                            <th style="width: <?=$value?>%" class='text-primary font-bold'><?= $key?></th>
                                        <?php endforeach; ?>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <!--div class='ibox-content'-->
                    </section>
                    <!--Show Modal Popups View & Delete -->
                </div>
                <!--div class='ibox-content'-->
            </div>
            <!--<div class='ibox float-e-margins' -->
        </div>
        <!--div class='col-lg-12'-->
    </div>
    <!--div class='row'-->
</div>

<input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" id="csrf_token_id">

<div class='modal inmodal fade' id='viewModal' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>
    <div class='modal-dialog modal-md'>
        <div class='modal-content modal-md'>
		</div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

