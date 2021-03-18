<?php
if ($action == 'success' && IS_LOGGED && $config['paystack'] == "on" && !empty($config['paystack_secret_key']) && !empty($config['paystack_public_key'])) {
    if( isset($_GET['a']) && $_GET['a'] === 'success' && isset($_GET['reference']) && !empty($_GET['reference'])){
        $reference = Generic::secure($_GET['reference']);

        $curl = curl_init();

        curl_setopt_array($curl, array(
        CURLOPT_URL => "https://api.paystack.co/transaction/verify/" . rawurlencode($reference),
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HTTPHEADER => [
            "accept: application/json",
            "authorization: Bearer ".$config['paystack_secret_key'],
            "cache-control: no-cache"
        ],));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        if($err){
            // there was an error contacting the Paystack API
        die('Curl returned error: ' . $err);
        }

        $tranx = json_decode($response);

        if(!$tranx->status){
        // there was an error from the API
        die('API returned error: ' . $tranx->message);
        }

        if('success' == $tranx->data->status){
            //var_dump($tranx->data->metadata->custom_fields);
            $type = '';
            $item_id = '';
            $title = '';
            $item_license = '';
            $amount = 0;
            foreach($tranx->data->metadata->custom_fields as $key => $value){
                if( $value->variable_name === 'type' ){
                    $type = $value->value;
                }
                if( $value->variable_name === 'id' ){
                    $item_id = $value->value;
                }
                if( $value->variable_name === 'title' ){
                    $title = $value->value;
                }
                if( $value->variable_name === 'item_license' ){
                    $item_license = $value->value;
                }
                if( $value->variable_name === 'amount' ){
                    $amount = $value->value / 100;
                }
            }
            if( $type === 'store' ){
                $store_image = $db->arrayBuilder()->where('id',$item_id)->getOne(T_STORE);
                $u = $db->arrayBuilder()->where('user_id',$store_image['user_id'])->getOne(T_USERS);
                $commesion = $amount / 2;
                $wallet = $u['balance'] + $commesion;
                $update = $user->updateStatic($store_image['user_id'],array('balance' => $wallet));
                $db->insert(T_TRANSACTIONS,array(
                    'user_id'       => $me['user_id'],
                    'amount'        => $amount,
                    'type'          => 'store',
                    'item_store_id' => $item_id,
                    'admin_com'     => $commesion,
                    'time'          => time(),
                    'item_license'  => $item_license
                    )
                );
                $db->where('id',$item_id)->update(T_STORE, array( 'sells' => $db->inc(1)));
                $notif   = new Notifications();
                $re_data = array(
                    'notifier_id' => $me['user_id'],
                    'recipient_id' => $store_image['user_id'],
                    'type' => 'store_purchase',
                    'url' => $config['site_url'] . "/store/".$item_id,
                    'time' => time()
                );
                try {
                    $notif->notify($re_data);
                } catch (Exception $e) {
                }
            
                header('Location: ' . $config['site_url'] . "/store/".$item_id);
                exit();
            }elseif( $type === 'pro' ){
                $update = $user->updateStatic($me['user_id'],array('is_pro' => 1,'verified' => 1));
                $amount = $config['pro_price'];
                $date   = time();

                $db->insert(T_PAYMENTS,array('user_id' => $me['user_id'],
                                          'amount' => $amount,
                                          'type' => 'pro_member',
                                          'date' => $date));

                $db->insert(T_TRANSACTIONS,array('user_id' => $me['user_id'],
                                  'amount' => $amount,
                                  'type' => 'pro_member',
                                  'time' => $date));
                header('Location: ' . $config['site_url'] . "/upgraded");
                exit();
            }
        }

    }
}
else if($action == 'create_payment'){
    $type = Generic::secure($_POST['type']);
    $metadata = array();
    if( $type === 'pro' ){
        $amount = intval( $config['pro_price'] ).'00';
        $metadata = [
            'custom_fields'=> [
                [
                    'display_name'=> "Amount",
                    'variable_name'=> "amount",
                    'value'=> $amount
                ],
                [
                    'display_name'=> "Type",
                    'variable_name'=> "type",
                    'value'=> $type
                ]
            ]
        ];
    }else{
        $amount = intval( Generic::secure($_POST['amount'] ) ) . '00';  //the amount in kobo. This value is actually NGN 300
        $id = Generic::secure($_POST['id']);
        $title = Generic::secure($_POST['title']);
        $item_license = Generic::secure($_POST['license']);
        $metadata = [
            'custom_fields'=> [
                [
                    'display_name'=> "Amount",
                    'variable_name'=> "amount",
                    'value'=> $amount
                ],
                [
                    'display_name'=> "Item id",
                    'variable_name'=> "id",
                    'value'=>  $id
                ],
                [
                    'display_name'=> "Item title",
                    'variable_name'=> "title",
                    'value'=> $title
                ],
                [
                    'display_name'=> "Item license",
                    'variable_name'=> "item_license",
                    'value'=> $item_license
                ],
                [
                    'display_name'=> "Type",
                    'variable_name'=> "type",
                    'value'=> $type
                ]
            ]
        ];
    }
    $curl = curl_init();
    $email = $me['email'];
    

    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://api.paystack.co/transaction/initialize",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS => json_encode([
            'amount'=>$amount,
            'email'=>$email,
            'metadata'=> $metadata
        ]),
        CURLOPT_HTTPHEADER => [
            "authorization: Bearer ".$config['paystack_secret_key'],
            "content-type: application/json",
            "cache-control: no-cache"
        ],
    ));
    $response = curl_exec($curl);
    $err = curl_error($curl);

    if($err){
        // there was an error contacting the Paystack API
        $data = array(
            'status' => 400,
            'message' => $err
        ); 
    }

    $tranx = json_decode($response, true);

    if(!$tranx->status){
        // there was an error from the API
        $data = array(
            'status' => 400,
            'message' => $tranx['message'],
            'url' => $tranx['data']['authorization_url']
        ); 
    }else{
        $data = array(
            'status' => 200,
            'message' => 'success',
            'url' => $tranx['data']['authorization_url']
        ); 
    }
}