<?php
require_once('import3p/google-storage/autoload.php');
use Google\Cloud\Storage\StorageClient;

function uploadFiletoGoogleCloud($fileContent, $cloudPath) {
    global $config;
    if ($config['google_cloud_storage'] == 0 || empty($config['google_cloud_storage_service_account']) || empty($config['google_cloud_storage_bucket_name'])) {
        return false;
    }
    $bucketName = $config['google_cloud_storage_bucket_name'];
    $privateKeyFileContent = $config['google_cloud_storage_service_account'];
    // connect to Google Cloud Storage using private key as authentication
    try {
        $storage = new StorageClient([
            'keyFile' => json_decode($privateKeyFileContent, true)
        ]);
    } catch (Exception $e) {
        // maybe invalid private key ?
        print $e;
        return false;
    }
 
    // set which bucket to work in
    $bucket = $storage->bucket($bucketName);
 
    // upload/replace file 
    $storageObject = $bucket->upload(
            $fileContent,
            ['name' => $cloudPath]
            // if $cloudPath is existed then will be overwrite without confirmation
            // NOTE: 
            // a. do not put prefix '/', '/' is a separate folder name  !!
            // b. private key MUST have 'storage.objects.delete' permission if want to replace file !
    );
 
    // is it succeed ?
    return $storageObject != null;
}