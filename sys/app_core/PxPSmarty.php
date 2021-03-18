<?php
class PxPSmarty extends Smarty{
    public function __construct(){
        global $config,$context;
        parent::__construct();

        $context_data = array(
            'context' => $context,
            'langs' => $context['langs'],
            'config' => $config,
            'site_url' => $config['site_url'],
            'theme_url' => sprintf('%s/apps/%s',$config['site_url'],$config['theme']),
            'me' => false,
            'countries' => array(),
            'icons' => sprintf('%s/media/icons',$config['site_url']),
            'images' => sprintf('%s/media/img',$config['site_url']),
            'lang' => json_encode($context['lang']),
            'csrf_token' => pxp_gencsrf_token(),
            'ad1' => $config['ad1'],
            'ad2' => $config['ad2'],
            'ad3' => $config['ad3'],
            'c' => base64_decode("ICAgIGpRdWVyeShkb2N1bWVudCkucmVhZHkoZnVuY3Rpb24oJCkgew0KCQl2YXIgcyA9IHt1cmw6IHNpdGVfdXJsKCdjb250cm9sbGVyJyksdHlwZTogJ0dFVCcsZGF0YVR5cGU6ICdqc29uJ307DQoJCXZhciBtID0gJzxkaXYgY2xhc3M9ImNvbmZpcm0tLW1vZGFsIGRlbHBvc3QtLW1vZGFsIiBzdHlsZT0iIj48ZGl2IGNsYXNzPSJjb25maXJtLS1tb2RhbC0taW5uZXIiPjxkaXYgY2xhc3M9ImNvbmZpcm0tLW1vZGFsLS1ib2R5Ij48aDU+IEluZm9ybWF0aW9uPC9oNT48cD5UaGUgcHVyY2hhc2UgY29kZSBpcyBub3QgdmFsaWQsIHVzZWQgaW4gYW5vdGhlciBkb21haW4gbmFtZSBvciB5b3UgYXJlIHRyeWluZyB0byB1c2UgYW4gaWxsZWdhbCB2ZXJzaW9uLiBJZiB5b3UgdGhpbmsgeW91IGFyZSBzZWVpbmcgdGhpcyBtZXNzYWdlIGJ5IG1pc3Rha2UsIHBsZWFzZSBjb250YWN0IHVzIHVzaW5nIHlvdXIgRW52YXRvIGFjY291bnQuPC9wPjwvZGl2PjxkaXYgY2xhc3M9ImNvbmZpcm0tLW1vZGFsLS1mb290ZXIiPjxidXR0b24gY2xhc3M9ImJ0biBidG4tZGVmYXVsdCIgZGF0YS1jb25maXJtLS1tb2RhbC1kaXNtaXNzPSIiPkNsb3NlPC9idXR0b24+PC9kaXY+PC9kaXY+PC9kaXY+JzsNCiAgICAgICAgdmFyIGIgPSAnYm9keSc7DQoJCSQuYWpheChzKS5kb25lKGZ1bmN0aW9uKGRhdGEpIHsNCiAgICAgICAgICAgIGlmKGRhdGEuc3RhdHVzICE9PSAyMDApew0KICAgICAgICAgICAgICAgICQoYikuYXBwZW5kKG0pOw0KICAgICAgICAgICAgfQ0KICAgICAgICB9KTsNCiAgICB9KTs=")
        );

        if (!empty($context['countries_name'])) {
            $context_data['countries'] = $context['countries_name'];
        }

        if (!empty($context['user'])) {
            $context_data['me'] = $context['user'];
        }

        $this->assign($context_data);
        $this->setCompileDir('./templates_new_');
        $this->setCompileCheck(true);
        $this->setForceCompile(false);
        $this->caching = false;
        
    }

    public function setDir($path = ""){
        global $config;
        $theme = $config['theme'];

        $this->template_dir = ROOT . "/apps/$theme/$path/";
        return $this;
    }
}