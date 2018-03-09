<?php

    /**
     * INDEX
     *
     * Copyright (c) 2014 All rights reserved.
     */
    error_reporting(E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED);
    //error_reporting(E_ALL);
    ini_set('display_errors', 'Off');

    include_once '../app/controllers/FrontController.php';
    new FrontController(__FILE__);
