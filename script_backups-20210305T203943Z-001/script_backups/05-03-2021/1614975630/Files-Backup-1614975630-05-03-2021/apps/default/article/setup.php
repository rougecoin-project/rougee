<?php
class Smarty_Blog extends PxPSmarty{
    function __construct($app = ''){
        global $context,$config;
        $theme = $config['theme'];
        $site_url = $config['site_url'];
        parent::__construct();
        $this->template_dir = ROOT . "/apps/$theme/$app/templates/$app/";
        $this->config_dir   = ROOT . "/apps/$theme/$app/configs/";
        $this->cache_dir    = ROOT . "/apps/$theme/$app/cache/";
        $this->assign(array(
            'app_name' => "article",
            'xhr_url' => "$site_url/aj/article",
        ));
    }
}
