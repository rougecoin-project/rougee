<?php
class Smarty_Explore extends PxPSmarty {
    function __construct($app = ''){
        global $context,$config;
        $theme = $config['theme'];
        $site_url = $config['site_url'];
        parent::__construct();
        $this->template_dir = ROOT . "/apps/$theme/$app/templates/$app/";
        $this->config_dir   = ROOT . "/apps/$theme/$app/configs/";
        $this->cache_dir    = ROOT . "/apps/$theme/$app/cache/";
        $this->assign(array(
            'app_name' => "explore",
            'xhr_url' => "$site_url/aj/posts",
        ));
    }
}
