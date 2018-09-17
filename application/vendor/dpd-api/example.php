<?php
require_once __DIR__.'/dpd_required.php';

$shipFromDpd["Company"] = "FromCompanyName";
$shipFromDpd["Name"] = "my@example.com";
$shipFromDpd["Street"] = "Street, Number/Number";
$shipFromDpd["City"] = "City";
$shipFromDpd["PostalCode"] = "30000";
$shipFromDpd["CountryCode"] = "PL";
$shipFromDpd["Phone"] = "12121212";
$shipFromDpd["Email"] = "my@example.com";

$shipToDpd["Company"] = 'ToCompanyName';
$shipToDpd["Name"] = 'PersonName';
$shipToDpd["Surname"] = 'PersonSurname';
$shipToDpd["Street"] = 'Street';
$shipToDpd["Number"] = 'Number/Number';
$shipToDpd["City"] = 'City';
$shipToDpd["CountryCode"] = 'PL';
$shipToDpd["PostalCode"] = '30000';
$shipToDpd["Phone"] = '123123123';
$shipToDpd["Phone2"] = '33221144';
$shipToDpd["Email"] = 'you@example.com';

$packageDetails["package_amount"] = 2;
$packageDetails["customer_data_1"] = 'SomeExtraInfo';
$packageDetails["package_content"] = 'PackageContent';
$packageDetails["reference_number"] = 'ReferenceNumber';
$packageDetails["Ref1"] = 'reference_1';
$packageDetails["Ref2"] = 'reference_2';
$packageDetails["Ref3"] = 'reference_3';
$packageDetails["COD"] = '123.11';
$packageDetails["DeclaredValue"] =  '123.11';
$packageDetails["Weight"] = '11';

try{
    $dpd = new DpdApi();
    $dpd->setLang("pl_PL");
    
    //webservice host (xml) - ask Your DPD consultant
    $dpd->setHost("https://...");
    $dpd->setFolder(__DIR__.'/../dpd_files');
    $dpd->setLogin("LOGIN");
    $dpd->setPassword("PASSWORD");
    $dpd->setMasterfid(1111);
    
    $dpd->setDepartment(1);
    $dpd->setConnection();
    $dpd->setShipFrom($shipFromDpd);
    $dpd->setShipTo($shipToDpd);
    $dpd->setPackageDetails($packageDetails);

    //register package
    var_dump($dpd->registerNewPackage());
    
    //get label by reference number
    var_dump($dpd->getLabelPDF(1, "EXAMPLE_REFERENCE_NUMBER"));
    
    //get label by waybill number
    var_dump($dpd->getLabelPDF(2, "0040992801495A"));
    
    //generate protocol
    var_dump($dpd->getProtocol(array('EXAMPLE_REFERENCE_NUMBER')));
    
    
}catch (Exception $e){
    var_dump($e->getMessage());
}

?>