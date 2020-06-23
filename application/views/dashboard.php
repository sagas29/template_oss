<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2><?=$this->session->nombre; ?></h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item active">
                <strong>Bienvenido!</strong>
            </li>
        </ol>
    </div>
    <div class="col-lg-2">

    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">

        <div class="col-lg-3">
            <a href="<?= base_url("productos") ?>">
                <div class="widget style1 lazur-bg">
                    <div class="row">
                        <div class="col-3">
                            <i class="mdi mdi-archive mdi-48px"></i>
                        </div>
                        <div class="col-9 text-right">
                            <span> Gestionar </span>
                            <h2 class="font-bold">Productos</h2>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-3">
            <a href="<?= base_url("categorias") ?>">
                <div class="widget style1 yellow-bg">
                    <div class="row">
                        <div class="col-3">
                            <i class="mdi mdi-format-list-bulleted mdi-48px"></i>
                        </div>
                        <div class="col-9 text-right">
                            <span> Gestionar </span>
                            <h2 class="font-bold">Categorias</h2>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-3">
            <a href="<?= base_url("ordenes")?>">
                <div class="widget style1 red-bg">
                    <div class="row">
                        <div class="col-3">
                            <i class="mdi mdi-archive mdi-48px"></i>
                        </div>
                        <div class="col-9 text-right">
                            <span> Gestionar </span>
                            <h2 class="font-bold">Ordenes</h2>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-3">
            <a href="<?= base_url("configuracion") ?>">
                <div class="widget style1 navy-bg">
                    <div class="row">
                        <div class="col-3">
                            <i class="mdi mdi-archive mdi-48px"></i>
                        </div>
                        <div class="col-9 text-right">
                            <span> Administrar </span>
                            <h2 class="font-bold">Configuracion</h2>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>